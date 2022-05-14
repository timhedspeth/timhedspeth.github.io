imagesegmentation <- function(imagefile, numclust, alpha, dist) {
  
  Plotlist <- list()
  #load in image
  image = imagefile
  
  
  #change image to grayscale and remove color dimensions
  if (dim(image)[4] == 3) {
    grayimage = grayscale(image)
  } 
  grayimage = image[,,1,1]
  
  #rotate image to original orientation
  grayimage=grayimage[nrow(grayimage):1, ncol(grayimage):1]
  
  #create image data frame
  imgDm <- dim(image)
  
  img <- data.frame(
    x = rep(1: imgDm[1], imgDm[2]),
    y = rep(1:imgDm[2], each = imgDm[1]),
    G = as.vector(grayimage)
  )
  
  #plot original image
  originalimage <- ggplot(data = img, aes(x = x, y = y)) + 
    geom_point(colour = gray(img$G)) +
    labs(title = "Original Image") +
    xlab("x") +
    ylab("y") 
  
  Plotlist <- c(Plotlist, list(originalimage))
  
  ##### K MEANS CLUSTERING #####
  # Apply kmeans with numclust clusters
  kMeans <- kmeans(img$G, centers = numclust)
  
  img$cluster <- as.factor(kMeans$cluster)
  
  #Plot k-means clusters
  kmeansimage <- ggplot(data = img) + 
    geom_point(aes(x = x, y = y, color = cluster)) +
    labs(title = paste("K-Means Clustered Image")) +
    xlab("x") +
    ylab("y")
  
  Plotlist <- c(Plotlist, list(kmeansimage))
  
  ##### SPECTRAL CLUSTERING #####
  #smooth image
  smoothimg = image.smooth(grayimage,theta=2)
  
  #reduce both image dimensions by factor of 10
  newdim = c(round(imgDm/10))
  smallimage = matrix(0, newdim[1],newdim[2])
  
  radius <- 5
  for (row in 1:(newdim[1])) {
    centerx = (row)/newdim[1]*imgDm[1]
    lowerx = max(1, round(centerx - radius, 0))
    upperx = min(imgDm[1], round(centerx + radius, 0))
    for (column in 1:newdim[2]) {
      centery = (column)/newdim[2]*imgDm[2]
      lowery = max(1, round(centery - radius, 0))
      uppery = min(imgDm[2],round(centery + radius, 0))
      smallimage[row, column] = mean(smoothimg$z[lowerx:upperx, lowery:uppery])
    }
  }
  
  #change image matrix to vector
  smallimg <- data.frame(
    x = rep(1:newdim[1], newdim[2]),
    y = rep(1:newdim[2], each = newdim[1]),
    G = as.vector(smallimage)
  )
  
  smallimg <- smallimg %>% arrange(x)
  
  data <- smallimg
 # dist = 2
  #alpha = 100
  simmatrix = matrix(0, nrow(data), nrow(data))
  for(p in 1:nrow(data)) {
    simmatrix[p,] = ifelse(abs(data$x[p] - data$x) <= dist & abs(data$y[p]- data$y) <= dist, exp(-(data$G[p]-data$G)^2*alpha), 0)
  }
  
  # get laplacian matrix
  D = diag(rowSums(simmatrix))
  U = D-simmatrix
  
  # get eigenvectors
  eig = eigen(U, symmetric=TRUE)
  
  # apply k means to n smallest eigenvectors
  km = kmeans(eig$vectors[,(ncol(simmatrix)-numclust):(ncol(simmatrix))], centers = numclust, nstart = 5)
  
  smallimg$cluster <- as.factor(km$cluster)
  
  #Plot spectral clusters
  spectralimage <- ggplot(data = smallimg) + 
    geom_point(aes(x = x, y = y, color = cluster)) +
    labs(title = paste("Spectral Clustered Image")) +
    xlab("x") +
    ylab("y")
  
  Plotlist <- c(Plotlist, list(spectralimage))
  
  ##### FUZZY C MEANS #####
  fcm <- fcm(smallimg$G, centers = numclust)
  u <- fcm$u
  smallimg <- cbind(smallimg, u)
  clusternames <- c("one", "two", "three", "four", "five", "six", "seven", "eight")
  names(smallimg)[5:ncol(smallimg)] <- clusternames[1:numclust]
  
  for (i in 1:numclust) {
    vector <- clusternames[i]
    fuzzy <- ggplot(data = smallimg) + 
      geom_point(aes_string(x = 'x', y = 'y', color = vector)) +
      labs(title = paste("Fuzzy Cluster", i, "Probabilities")) +
      xlab("x") +
      ylab("y")
    Plotlist <- c(Plotlist, list(fuzzy))
  }
  
  #Plot everything
  x1 <- ggarrange(plotlist = Plotlist, ncol = 3, nrow=round(length(Plotlist)/3)+1)
  return(x1)
} 

