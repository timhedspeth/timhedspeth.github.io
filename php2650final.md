---
title: "Clustering"
---

#### Project by Joanna Walsh and Timothy Hedspeth for PHP 2650

Example of equations: <img src="https://render.githubusercontent.com/render/math?math=e^{i \pi} = -1">

## What is clustering? 
Clustering is a general technique in statistical learning, where we are trying to identify clusters (subgroups) in our data. A clustering algorithim takes in unlabeled data, making it an unsupervised learning technique. These clusters are groups that are partitions of the input data where membership in clusters are associated with similarity between the observations that are in a cluster. This technique allows for us to capture grouping that seem natural such as finding grouping of hand written digits based on the value of the pixel, groups of pictures of different people (all photographed many times) to capture groups where the same indvidual is identified in a cluster, etc. There are many applications of clustering that extend beyond these basic examples. We extend our knoweldge of clustering to examine the process of image segmentation. 

## What is image segmentation?
Image segmetation at the base level, is when a machine is tryin learn and extract different parts of an image, and is a crucial step in the process of image processing (Dass & Devi). What does this practically mean though? Us humans (that are able to see) can look at an image and clearly identify the distinict objects that are present. Take the images below as an example:
![Birman_22](https://user-images.githubusercontent.com/71342657/167688081-fec9f247-5b44-4e8e-bbe6-f9362cc3ead6.jpg)

![image](https://user-images.githubusercontent.com/71342657/167689885-0e5e1a24-193a-482e-85f7-95ad033f2119.png)

In the first image we can clearly see that Birman, the siammese cat, is sitting in a beautiful bed of grass. On the contrary in the second image we see a CT scan of the Opharanx (a part of the throat). In both of these images we are able to observe disticit objects birman and the grassy background, though we may not be able to note what parts of the Ophranx are shown (and which regions are indicative of potential concern), things that we take forgranted are not as easy for a computer (Dass & Devi). Computers must learn this information, through a series of steps, the first of which is the segmetation of these images into distinict groups, which can be done through clustering (Dass & Devi). 

Clustering these images present unique challenges, as different images present different challenges (Dass & Devi). Take for example Birman, as a black and white cat he stands out against the green background, but as we can see his face is darker, and clustering may identify this with the background as they are more similar in color. The second image on the other hand is black and white, and could be a problem as the gradient of color is almost fuzzy, which could be problematic for some algorithims. In fact image segmentation is a very open field of research as different methods perform well for some images and perform poorly for others (Dass & Devi). Though it would be beneficial, there is currently no universal algorithim for image segmentation, as heterogeniety in images leads to different needs, though this is an active field of research (Dass & Devi)! With this in mind our project explores three different techniques for image segmentation k-means clustering, spectral clustering, and fuzzy C-means clustering. 




## What are these algorithims and how do they perform? 
### k-means clustering 
One of the most common clustering algorithims k-means, in which the algorithim is trying to classify pixels into k distinict clusters (Dhanachandra et al). To segment images with this technique consier <img src="https://render.githubusercontent.com/render/math?math=p=p(x,y)"> to be input pixels to be clustered with <img src="https://render.githubusercontent.com/render/math?math=c_k"> cluster centers. For the pixels we want to minimize the objective function <img src="https://render.githubusercontent.com/render/math?math=d=||p(x,y)-c_k||"> and assign pixels to the closest cluster in terms of distance. With the pixels assigned to thier new cluster   This algoorithim attempts to minimize the eculidian distance between pixels in a single cluster and reculauate the center using the formula <img src="https://render.githubusercontent.com/render/math?math=c_k=\frac{1}{k}\sum_{y\in c_k}\sum_{x\in c_k} p(x,y)"> (Dhanachandra et al).  

In addition k-means is a hard clustering algorithhim, as it assigns pixels into a single cluster (Dass & Devi).  This means that once a pixel is assigned to a cluster it cannot gain membership to other clusters (Dass & Devi). Given the random nature 

### Spectral clustering 
A popular method of image segmentation is through the use of spectral clustering, an algorithim that utilizes Linear algebra in tandem with k-means, which is known to produce better results than just through the use of just k-mean (Tung). This method uses weighted graphs, wherre the weight between nodes on the graph corresponds to the similarity between pixels, which can be expressed as a weightted adjacency matrix (Tung). Where the degree of the weights are 
<img src="https://render.githubusercontent.com/render/math?math=d_i=\sum_{j=1}^n w_{ij}"> (Tung). This is used to calculate the Laplician Matrix, which is then used for clustering algorithim (Tung). With the Laplician Matrix we calaculate the first <img src="https://render.githubusercontent.com/render/math?math=k"> eigenvectors with the <img src="https://render.githubusercontent.com/render/math?math=k"> smallest eigenvalues and construct a matrix <img src="https://render.githubusercontent.com/render/math?math=V)"> with the eigenvectors as columns. The matrix is used to create a set of points <img src="https://render.githubusercontent.com/render/math?math=y_1,y_2,...,y_n"> such that <img src="https://render.githubusercontent.com/render/math?math=y_i\in \mathbf{R}^k">, where these points are clustered using <img src="https://render.githubusercontent.com/render/math?math=k">-means to find clusters <img src="https://render.githubusercontent.com/render/math?math=C_1,...,C_k">. Though this method can be used to perform clustering well, it is coomputationally expensive so the image is segemented blockwise using the rule where the algorithims looks at the similarity between pixels <img src="https://render.githubusercontent.com/render/math?math=x_i"> and <img src="https://render.githubusercontent.com/render/math?math=x_j"> is determined by the exponetial decay function where <img src="https://render.githubusercontent.com/render/math?math=s_{i,j}=exp(-\alpha(I(x_i)-I(x_j))^2)">  when the pixels are in the same nebighhrhood, where <img src="https://render.githubusercontent.com/render/math?math=I"> is the intensity of a given pixel and a tuning parameter <img src="https://render.githubusercontent.com/render/math?math=\alpha">. Segementation is then performed on the blocks for a fixed <img src="https://render.githubusercontent.com/render/math?math=k"> clusters.     


### Fuzzy C-means clustering 
In general clustering looks at "hard" boundaries between the subgroups that are found (i.e. data only belongs to a single cluster) (Bezdeck & Ehrlich & Full, 1983). In fuzzy clustering we consider something called a memmbership function which allows for data to be assigned to different clusters with different levels of membership (chuang). This is an important distinction between other clustering algroithims, as the nebighoring pixels in an image are highly correlated, so the information in surrounding pixels can be important in forming clusters (chuang). We have <img src="https://render.githubusercontent.com/render/math?math=X=(x_1,...,x_N)"> where <img src="https://render.githubusercontent.com/render/math?math=J=N"> is the number of pixels to be partitioned (Chaung). Unlike other clustering algorithims this method looks at the membership function, where the membership is represented as the probability of a pixel belonging to a certainn cluster (Chuang). The membership function is updated as <img src="https://render.githubusercontent.com/render/math?math=u_{ij}=\frac{1}{\sum_{k=1}^c (\frac{||x_j-v_i||}{||x_j-v_k||})^{2/(m-1)}}"> and <img src="https://render.githubusercontent.com/render/math?math=v_i=\frac{\sum_{j=1}^N u_{ij}^m x_j}{\sum_{j=1}^N u_{ij}^m}">, where the algorithim converges when we reach a saddle point or the local minimum of the cost function. 

This algorithim must be extended beyond the standard algorithim when there 

Objective function: <img src="https://render.githubusercontent.com/render/math?math=J=minimize(\sum_{j=1}^N\sum_{i=1}^C u_{ij}^m ||x_j-v_i||)">


## Comparsion of algorithims 

k-means is computational inexpensive, not as good as the others algorithims we look at 

spectral clustering is better than k-means, but is computationally expensive to perform. 

Fuzzy c-means allows for us to explore noisey images, but only assigns the probability of being in a cluster and does not segment out. 



## How do we implement these methods? 
For this project we apply the clustering methods that are discussed above to image data for both animals and medical imaging. The [R file] is attached here for refrence in case anyone wants to follow the code to get a more speifific idea of what we do in the code. The segmented images shown above were derived by the code we implemented, and if you want to see it for yourself check out our [shiny app](https://timhedspeth1.shinyapps.io/image_segmentation/).

The [R file](function.R)


#### Refrences 

Bezdek, James C., Robert Ehrlich, and William Full. "FCM: The fuzzy c-means clustering algorithm." Computers & geosciences 10.2-3 (1984): 191-203. 

Chuang, Keh-Shih, et al. "Fuzzy c-means clustering with spatial information for image segmentation." computerized medical imaging and graphics 30.1 (2006): 9-15.

Dhanachandra, Nameirakpam, Khumanthem Manglem, and Yambem Jina Chanu. "Image segmentation using K-means clustering algorithm and subtractive clustering algorithm." Procedia Computer Science 54 (2015): 764-771.

A SURVEY O N EVALUATION METHODS FOR
IMAGE SEGMENTATION Zhang 
