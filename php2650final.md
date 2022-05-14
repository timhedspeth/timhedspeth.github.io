---
title: "Clustering"
---

#### Project by Joanna Walsh and Timothy Hedspeth for PHP 2650

Clustering is a general technique in statistical learning in which one tries to identify clusters, or subgroups, in a dataset in an unsupervised way (Gareth et al. 385-399). These clusters are groups or partitions of the input data for which cluster membership is determined by similarity between observations; in other words, observations that are more similar to each other are more likely to belong to the same cluster, while objects that are quite dissimilar are likely to be separated. (Gareth et al. 385-399). This technique allows us to capture natural groupings among data, which is useful for many applications, including linking consumers’ online interactions to groups of people, grouping students by academic performance to predict future success, separating speech into individual voices, grouping protein sequences or chemical compounds by their properties, identifying the same person across groups of pictures of different people, all photographed many times, or classifying handwritten digits based on patterns of pixels (Suryanarayana et al., 2015). These are only some of the cool examples of how clustering methods are used in our everyday lives, across many fields! Though there are many possible applications of clustering, we will be focusing on exploring the process of image segmentation using clustering. If you don’t know what image segmentation is, don’t worry: we will explain in the next section!        

### What is image segmentation?

Image segmentation, at a basic level, is when a machine tries to learn and extract different parts of an image, a crucial step in image processing (Dass et al.). What does this practically mean, though? Us humans (that are able to see) can look at an image and clearly identify the distinct objects that are present. Take the images below as an example: 

<img width="459" alt="Screen Shot 2022-05-14 at 1 58 42 PM" src="https://user-images.githubusercontent.com/71342657/168448718-37e9e065-410a-497a-8bc6-9e0e57c6c5cd.png">
Figure 1. Image of Birman (Parkhi et al.) 
<img width="237" alt="Screen Shot 2022-05-14 at 2 24 29 PM" src="https://user-images.githubusercontent.com/71342657/168448726-83d235ed-d734-45db-a92d-0f2da8d04f0e.png">
Figure 2. Image of boxer (Parkhi et al.) 
![brain](https://user-images.githubusercontent.com/71342657/168448730-c0b963fb-a58c-4cbd-86e5-3425d1aa7d60.jpg)
Figure 3. Image of brain from MRI (T2-Weighted MRI )


In the first two images we can clearly identify distinct objects (a Birman, a type of cat, sitting in a bed of grass and a Boxer standing in the snow). In the third image, we see a CT scan of a brain from a T-2 weighted MRI, and though we may not be able to tell what parts of the brain are shown (and which regions are indicative of potential concern), we can still observe distinct regions and differences. This ability to (for the most part) distinguish between objects is something that we take for granted, and it is not as easy of a task for machine learning algorithms to accomplish (Dass et al.). Machines cannot “see” natural separations in images - instead, they just see a large array of numbers. So for a machine, image recognition is done through a series of steps, the first of which is the segmentation of an image into distinct groups, a process which can be done through clustering (Dass et al.). This image segmentation is also a crucial step in object classification and as a preliminary step to reduce the complexity of image processing. In order to perform clustering, the algorithms look for regions in an image that are similar, based on visual attributes of the photo (Lalitha et al.). What do we mean by similar? While segmentation algorithms can match parts of images based on color, texture, or even edges, the most common way that algorithms identify “similar” parts of images is by matching pixels of the image with similar intensity values, based on the reflection of light in the image (Dass et al.). For black and white images, each pixel has a single intensity measurement, whereas for colored images, each pixel has three intensity measurements (one for red, one for green, and one for blue). In this blog, we’ll focus on grayscale images, where each pixel has an intensity measurement from 0 (corresponding to black) to 1 (corresponding to white). Values between 0 and 1 represent varying shades of gray, from dark to light. Thus, when clustering these images, groups of pixels with similar intensities are considered to be similar to each other. 

The use of clustering in image segmentation presents some challenges. For example, because each image is unique and has varying characteristics, segmentation techniques perform differently on different images (Dass et al.). Take, for example, the picture of the Birman cat: while the most natural segmentation might appear to be the cat as one cluster and the grassy background as another cluster, the cat’s darker face and ears are more similar in pixel intensity to the grassy background than to the cat’s actual body. Similarly, the small white flowers in the grass are more similar in intensity to the cat’s white fur than to the rest of the grass itself. Thus, some clustering algorithms might tend to group the fur and flowers into one cluster and the grass and darker face and ears into another rather than simply separating the cat from the grassy background. However, on images with more clear contrasts between natural clusters, such as the picture of the Boxer, where his darker fur is in stark contrast to the white, snowy background, clustering algorithms can more easily segment the image into the natural groups of dog and background. These images of cats and dogs can further be compared to the image of the brain, in which a natural grouping may not seem obvious (unless you are a neuroscientist, perhaps). Ultimately, image segmentation is an open field of research with different methods, each of which can perform well for some images and poorly for others, due to the heterogeneity of image data  (Dass et al.). Though it would be nice if there was a consensus among researchers about the best image segmentation method, there is currently no universal algorithm for this application, because this heterogeneity in images leads to a need for many segmentation algorithms (Dass et al.). With this in mind, this blog will describe and explore three different techniques for image segmentation: k-means clustering, spectral clustering, and fuzzy c-means clustering. 

In the next sections, we will detail how these different clustering techniques are applied to image data and provide examples of the clustering results for the Birman, Boxer, and brain images we have shown in this section. This is done through the use of R programming, and the script file is available to explore [here]. But, if you prefer a more interactive demonstration, check out our [shiny app], where you can look at some examples we have already performed, or try it yourself by uploading your own image to see it segmented! 


### Explanation of algorithms
###### K-means clustering
One of the most common clustering algorithms is k-means, which is an algorithm that attempts to classify pixels into k distinct (non-overlapping) clusters (Dhanachandra et al). To segment an image with this technique, consider <img src="https://render.githubusercontent.com/render/math?math=p=p(x,y)"> to be input pixels to be clustered with <img src="https://render.githubusercontent.com/render/math?math=c_k"> cluster centers (Dhanachandra et al). When clustering the image, we aim to minimize the objective function <img src="https://render.githubusercontent.com/render/math?math=d=||p(x,y)-c_k||">, which essentially means minimizing the differences between pixels in the same group. This is done by first randomly assigning k pixels to represent the centers of the k groups, and then assigning the rest of the pixels to the cluster center that they are closest to in terms of euclidean distance (Dhanachandra, et al). Once the pixels are assigned to the clusters, this algorithm then attempts to minimize the euclidean distance between pixels in a single cluster by recalculating the centers using the formula  <img src="https://render.githubusercontent.com/render/math?math=c_k=\frac{1}{k}\sum_{y\in c_k}\sum_{x\in c_k} p(x,y)"> (Dhanachandra et al). The algorithm keeps doing this until the centers converge (stop changing/updating).

One of the largest pitfalls of this algorithm is that the user must pre-specify the number of clusters k, before clustering (Norouzi, et al.). Also, given the random nature of the initialized center of the prespecified clusters, this method does not always perform optimally (Norouzi, et al.). Moreover, this clustering algorithm is also sensitive to outliers and noise in the data, and there is active, ongoing research aiming to alleviate these issues with modified k-means algorithms (Norouzi, et al.). Though this method does suffer from these pitfalls, it is a very efficient and relatively fast algorithm. For example, when different clustering methods were applied to MRI image data, it was observed that the computation time for k-means was 1.875 seconds, whereas Fuzzy C-Means took up to 56 seconds (Vijay and Subhashini)! In a review of published literature pertaining to image segmentation of breast cancer, researchers found that k-means was able to identify breast tumors with high accuracy (73%) at a speed much faster than most algorithms (Hassan, et al.).  
             

##### Spectral clustering
Another popular method of image segmentation is spectral clustering, an algorithm that utilizes aspects of linear algebra in tandem with k-means and which is known to produce better results than just k-means alone (Tung et al.). Spectral clustering takes in the data <img src="https://render.githubusercontent.com/render/math?math=X_1,X_2,...,X_n">  where n is the total number of pixels in the image that is being segmented (Tung et al.). This method uses weighted graphs, where the weight between nodes on the graph corresponds to the similarity between pixels, which can be expressed as a weighted adjacency matrix, W, in which row i and column j contains a value <img src="https://render.githubusercontent.com/render/math?math=w_{i,j}">  which represents the similarity between the pixels <img src="https://render.githubusercontent.com/render/math?math=x_i"> and <img src="https://render.githubusercontent.com/render/math?math=x_j">(Tung et al.).  For each pixel, similarities are calculated only for pixels in a small radius (in our examples, similarities are only calculated for pixels that are 2 or fewer pixels apart, but you can change this value in our shiny app if you want to explore its effect on the results!). The similarity <img src="https://render.githubusercontent.com/render/math?math=s_{i,j}"> between pixel i and pixel j is determined by the exponential decay function where <img src="https://render.githubusercontent.com/render/math?math=s_{i,j}=exp(-\alpha(I(x_i)-I(x_j))^2)"> when the pixels are in the same neighborhood and 0 otherwise, where  <img src="https://render.githubusercontent.com/render/math?math=I"> is the intensity of a given pixel with a tuning parameter  <img src="https://render.githubusercontent.com/render/math?math=\alpha">(Tung et al.). In our examples, we use a tuning parameter equal to 100, but you can also play with changing this in our app!

The degree of the weights, used to form the diagonal nxn degree matrix, D, are calculated using the formula <img src="https://render.githubusercontent.com/render/math?math=d_i=\sum_{j=1}^n w_{ij}">  (Tung et al.). The Laplacian Matrix is then calculated by subtracting the similarity matrix from D, yielding L=D-W (Tung et al.). Once the Laplacian Matrix is constructed, we calculate the first k eigenvectors with the k smallest eigenvalues of the Laplacian matrix (Tung et al.). K-means is then applied to the matrix of eigenvectors, as described above, and the results are plotted.

Though this method can be used to perform clustering well, it is more complicated than k-means and thus more computationally expensive, as the size of the Laplacian matrix is n x n, which makes the computation of eigenvectors and eigenvalues very costly in terms of efficiency (Tung et al.). This computational burden can be reduced by only calculating each pixel’s similarity to other pixels in a small neighborhood and setting all other similarity values to zero, as previously described. But, for large enough images, this adjustment may not be enough, and the size of the image still presents a problem (Tung et al.). In order to further increase efficiency, one can reduce the size of the image, making it more pixelated but resulting in a much faster algorithm (in our examples, we decrease the dimensions of the image by a factor of 10 by averaging pixel values, as suggested in other implementations online (Landgraf). Again, computation time for images with spectral clustering is a general problem, but by reducing the size of the image in the way described above and only calculating similarity for a small neighborhood around each pixel, the algorithm is feasible. This algorithm is sensitive to noise and distortions that are present in the pixels of an image, because spectral clustering learns within regions that are often homogenous in their color, intensity, and texture and different from surrounding regions (Liu et al.). Current research on spectral clustering aims to extend the algorithm to help with its sensitivity to such noise (Liu et al.). Importantly, spectral clustering has the ability to capture clusters that are of different shapes and is generally able to find the globally optimal solution (Zhang et al.).     

##### Fuzzy C-means clustering
In general, clustering looks at "hard" boundaries between the subgroups, which means that pixels are only allowed to belong to a single cluster (Bezdeck et. al.). In fuzzy clustering we extend our definition of clustering to include a membership function, which allows for pixels to be assigned to different clusters with different probabilities (Chuang et al.). This is different from most other clustering algorithms, as spectral clustering and k-means use hard boundaries (Chuang et al.). The use of fuzzy c-means can be helpful, as the algorithm yields the probability that pixels belong to a given cluster, so we can observe the likelihood of pixels being classified into a given cluster  (Chuang et al.).  We have  <img src="https://render.githubusercontent.com/render/math?math=X=(x_1,...,x_N)">, where <img src="https://render.githubusercontent.com/render/math?math=J=N"> is the number of pixels to be partitioned and c is the number of clusters (Chuang et al.). The algorithm performs optimization by minimizing the objective function <img src="https://render.githubusercontent.com/render/math?math=J=\sum_{j=1}^N\sum_{i=1}^c u_{ij}^m||x_j-x_v_i||^2"> (Chuang et al.). Here, <img src="https://render.githubusercontent.com/render/math?math=u_{i,j}"> is the representation of the membership of the pixel <img src="https://render.githubusercontent.com/render/math?math=x_j"> in cluster i, with <img src="https://render.githubusercontent.com/render/math?math=v-i"> being the center of the <img src="https://render.githubusercontent.com/render/math?math=i^{th}"> cluster (Chuang, et al.). This means that the probability of membership is dependent upon the distance between the pixel and the center of the cluster it is assigned to (Chuang et al.).The membership function is updated iteratively with this function:  <img src="https://render.githubusercontent.com/render/math?math=u_{ij}=\frac{1}{\sum_{k=1}^c \(\frac{||x_j-v_i||}{||x_j-v_k||})^{2/(m-1)\}}">
, while the cluster centers are updated with the function: <img src="https://render.githubusercontent.com/render/math?math=v_i=\frac{\sum_{j=1}^N u_{ij}^m x_j}{\sum_{j=1}^N u_{ij}^m}">  (Chuang et al.). This algorithm generally converges to a saddle point, or a locally optimal solution (Chuang et al.).  
Fuzzy C-Means has been proven to perform well for medical data and even for images that are deemed to be “bad” and “corrupt” (Norouzi et al.). This is due to the fact that usually there are pixels that could probably be assigned to several different clusters in images that are gray-scale (Norouzi et al.). The use of fuzzy-c-means improves flexibility by allowing a sort of “overlap” in these images to be accounted for when segmenting images by looking at the probability of a pixel’s membership in each cluster (Norouzi et al.). This algorithm is also sensitive to noise to differences in intensity of pixels (Norouzi et al.). Neighboring pixels in an image are highly correlated with each other, so the information in surrounding pixels can be important in forming clusters, which is not taken into account unless we use fuzzy c-means (Chuang et al.). But, because this algorithm returns the probability of a pixel belonging to a cluster, rather than a discrete cluster membership, the results can be less straightforward in terms of interpretation (Chuang et al.). Further, because k probabilities need to be calculated for each pixel, this algorithm can take quite a bit of time: thus, in our examples below and in our app, images are rescaled as described in the spectral clustering section of this post before Fuzzy-C-Means is applied.


### Application to images 
###### K-means applications
In all of the algorithms (spoiler alert) that we use as demonstrations in this post, we must select a number of clusters that we want to segment our images into. Examining Figure 1, it is noted that we would like to extract a cluster that contains Birman and possibly clusters that segment the background into the different gradients of grass that are observed, so we set the number of clusters to be 3. For the picture of the boxer in Figure 2, we note that there is a stark amount of contrast between the dog and the snow that surrounds him, so we set the number of clusters to be 2. Lastly is Figure 3, the image of the brain: given the heterogeneity in this image, we expect that a higher number of clusters would better capture the complexities of this image, so we select the number of clusters to be 5. 

<img width="289" alt="Screen Shot 2022-05-13 at 8 43 16 PM" src="https://user-images.githubusercontent.com/71342657/168449127-40c8f5c6-723e-4fd1-9bfc-36b6263a8838.png">

Figure 4. Result of k-means clustering on Figure 1 (Birman) 

<img width="297" alt="Screen Shot 2022-05-14 at 3 10 01 PM" src="https://user-images.githubusercontent.com/71342657/168449226-4903fc2e-a39f-41f1-a3d7-a020016b0836.png">

Figure 5. Result of k-means clustering on Figure 2 (Boxer) 

![Screen Shot 2022-05-13 at 8 44 30 PM](https://user-images.githubusercontent.com/71342657/168449223-c53020fa-f3bf-4d4c-abd9-3031131e4e01.png)
Figure 6. Result of k-means clustering on Figure 3 (Brain MRI) 



We look at the resulting clusters from applying k-means to our three images and notice that this clustering algorithm does not perform optimally for our friend Birman, shown in Figure 4. K-means is able to classify most of his body as a single cluster but classifies his face, as well as other darker parts of his fur (including his ears and some of his back) as belonging to other clusters. Further, some of the white flowers in the grass are clustered with the white fur from his coat. This result makes sense as these flowers are closer in color to most of Birman’s body, and thus the algorithm clusters them together. However, k-means is able to capture the layout of the boxer and the brain (Figures 5 and 6 respectively) pretty well with our set number of clusters. Most of the boxer’s body is clearly segmented from the snow, though his collar and white patch are put into the cluster with the snow, while the grass is clustered with his body. This is highly likely due to the fact that the collar and white patch show much closer color gradients to the snow, while the grass is much closer, in color to the boxer. Though not perfect k-means was able to extract a pretty good segmented version of this boxer. The best result appears to be the segmentation performed in Figure 6, as we observe that the clustering performed is able to match the image in Figure 3 extremely well. This result makes sense, given that there appears to be, at least in our opinion, minimal noise and outliers in terms of intensity in the image. This is likely why this algorithm performs well on medical imaging data such as MRIs, as observed  by Hassan, et al.. But, again, we note that this algorithm is sensitive to the number of prespecified clusters, so when we set the algorithm to only use two clusters we observe (shown below in Figure 7) that it segments the image into the back and white space successfully, but fails to capture any other information, which is what would be of interest.   
  
<img width="291" alt="Screen Shot 2022-05-14 at 8 19 49 AM" src="https://user-images.githubusercontent.com/71342657/168449258-9c1ebb9c-2627-46b7-9f23-6b6960120800.png">
 
Figure 7. Results of k-means when only 2 clusters are used on Figure 3


###### Spectral applications 

![Screen Shot 2022-05-14 at 5 56 12 PM](https://user-images.githubusercontent.com/71342657/168449304-56a731fa-d685-402f-90d6-831107777a6b.png)

Figure 8. Result of spectral clustering on Figure 1 (Birman) 

<img width="309" alt="Screen Shot 2022-05-14 at 5 55 28 PM" src="https://user-images.githubusercontent.com/71342657/168449287-38aca27e-6975-4b9c-a1e4-0ccdbfc38402.png">

Figure 9. Result of spectral clustering on Figure 2 (Boxer) 
<img width="303" alt="Screen Shot 2022-05-14 at 5 56 49 PM" src="https://user-images.githubusercontent.com/71342657/168449320-46eec781-4118-4e95-80c5-3047398af94a.png">

Figure 10. Result of spectral clustering on Figure 3 (Brain MRI) 



In the clustering results above, we can see that the spectral clustering method performs relatively well for our friend Birman, shown in Figure 8, as it captures most of Birman in the foreground, and finds two clusters that constitute the background. We note that this is likely due to the intensity of the pixels for the background (and the upper part of his face) are significantly different than the rest of his body. The middle region of his body does not get clustered with the background, likely due to the fact that these pixels are in the neighborhood of the much lighter (and thus less intense pixels).  The spectral clustering algorithm also efficiently clusters the Boxer picture, shown in Figure 9, into a dog and a background. However, spectral clustering, when applied to the MRI image of the brain, forms clusters that do not capture the represented image at all, shown in Figure 10. This is likely the opposite of what we are observing with birman: the intensity of the pixels is likely to be similar, which leads to the algorithm performing significantly worse than k-means.     

##### Fuzzy C-means application 

<img width="895" alt="Screen Shot 2022-05-13 at 8 57 32 PM" src="https://user-images.githubusercontent.com/71342657/168449336-a0f06bc4-fb23-4cc6-9090-467b99ff184a.png">

Figure 11. Result of Fuzzy C-means clustering on Figure 1 (Birman) 

![Screen Shot 2022-05-13 at 9 19 05 PM](https://user-images.githubusercontent.com/71342657/168449345-68dac969-5041-42f3-b836-5c0dffd822f7.png)

Figure 12. Result of Fuzzy C-means clustering on Figure 2 (Boxer) 

<img width="592" alt="Screen Shot 2022-05-14 at 3 10 11 PM" src="https://user-images.githubusercontent.com/71342657/168449350-921b1a79-bcfc-4ce4-81e9-2563aed3a922.png">

Figure 13. Result of Fuzzy C-means clustering on Figure 3 (Brain MRI) 

We note that the resulting output of this algorithm are the probabilities of membership in each respective cluster (pixels shown in lighter shades of blue have higher probabilities of belonging to a given cluster). As you can see in Figure 11, the pixels with high probabilities of membership to the first cluster correspond to most of the Birman’s body, while the pixels with high probabilities of membership in the second and third clusters correspond to various regions of the grass. But, similar to the k-means results, the darker areas of fur on Birman’s body have high probabilities of being in different clusters than the lighter areas of fur. In Figure 12, we can see that the fuzzy c-means algorithm does a good job of separating the Boxer from the snowy background. In terms of the brain image results, shown in Figure 13, we can see that the Fuzzy-C-Means algorithm extracts and separates key parts of the brain very well. It appears that this clustering is able to capture distinct regions of the brain image, and that this clustering technique is a good choice for noisy images.

### Overall Comparisons

Above, we discussed three different algorithms, k-means, spectral clustering, and fuzzy c-means clustering, and their applications to image segmentation. In summary, k-means is computationally inexpensive, but its results can be limited by the randomness of initialization and its simpler methodology. Spectral clustering is able to better extract unusual patterns in images and find globally optimal solutions, but it falls prey to computational complexity and even forces us to limit the size of images in the applications we showed above. Fuzzy c-means allows for better exploration of images that contain noisy overlap, but it is sensitive to the intensity of pixels and outputs probabilities of cluster membership, making the results less straightforward, and also requires a rescaling of the images to speed up computation time. A disadvantage of all three methods is that the user has to select a number of clusters before the analysis. Thus, there are strengths and weaknesses to each method at both an algorithmic and practical level. In terms of applying these algorithms to images, spectral clustering was not able to segment the image of the brain well, but performed relatively well on the Birman cat. In contrast, k-means and fuzzy c-means performed decently in terms of segmenting the white part of Birmans body, but performed very well for the brain image, when the number of clusters is large enough. Fuzzy-c-means performed especially well for the noisier images, while all methods successfully segmented the high-contrast dog image.

### Application and discussion
Now that you have an understanding of the algorithms as well as their strengths and weaknesses, you can check out our [shiny app](https://timhedspeth1.shinyapps.io/imagesegmentationproject/0). In this app, you can select from some existing examples or even upload your own image to see how these algorithms perform! You can also play with changing the number of clusters or the tuning parameter and neighborhood distance parameters in the spectral clustering algorithm to see how these affect the results. The [R file](function.R), containing the code used for the shiny app, is available to download here, for the sake of reproducibility!

                                                           Works Cited 

Bezdek, James C., Robert Ehrlich, and William Full. "FCM: The fuzzy c-means clustering algorithm." Computers & geosciences 10.2-3 (1984): 191-203.

Burney, SM Aqil, and Humera Tariq. "K-means cluster analysis for image segmentation." International Journal of Computer Applications 96.4 (2014).

Chuang, Keh-Shih, et al. "Fuzzy c-means clustering with spatial information for image segmentation." computerized medical imaging and graphics 30.1   
  (2006): 9-15.

Dass, Rajeshwar, and Swapna Devi. "Image segmentation techniques 1." (2012).
 
Dhanachandra, Nameirakpam, Khumanthem Manglem, and Yambem Jina Chanu. "Image segmentation using K-means clustering algorithm and subtractive clustering 
  algorithm." Procedia Computer Science 54 (2015): 764-771.

Gareth, James, et al. An Introduction to Statistical Learning with Applications in R, edited by Daniela Witten, 2nd ed., Springer , New York Heidelberg 
  Dordrecht London, 2013, pp. 385–399. Springer Texts in Statistics. 

Hassan, Noor Salah, et al. "Medical Images Breast Cancer Segmentation Based on K-Means Clustering Algorithm: A Review." Ultrasound 27 (2021): 28.

Lalitha, M., M. Kiruthiga, and C. Loganathan. "A survey on image segmentation through clustering algorithm." International Journal of Science and Research 
  2.2 (2013): 348-358. Landgraf, Andrew. 
  
“Unsupervised Image Segmentation with Spectral Clustering with R: R-Bloggers.” R-Bloggers, 12 Feb. 2012, 
  https://www.r-bloggers.com/2012/02/unsupervised-image-segmentation-with-spectral-clustering-with-r/. 
  Liu, H. Q., L. C. Jiao, and Feng Zhao. "Non-local spatial spectral clustering for image segmentation." Neurocomputing 74.1-3 (2010): 461-471.

Norouzi, Alireza, et al. "Medical image segmentation methods, algorithms, and applications." IETE Technical Review 31.3 (2014): 199-213.

Parkhi, O. M., Vedaldi, A., Zisserman, A., & Jawahar, C. V. (2012, June). Cats and dogs. In 2012 IEEE conference on computer vision and pattern 
  recognition (pp. 3498-3505). IEEE.

Suryanarayana, S. V., G. Venkateswara Rao, and G. Veereswara Swamy. "A Survey: Spectral Clustering Applications and its Enhancements." International 
  Journal of Computer Science and Information Technologies 6.1 (2015): 185-189.

“T2-Weighted MRI .” Brain Imaging: What Are the Different Types?, Brainline, https://www.brainline.org/slideshow/brain-imaging-what-are-different-types. 

Tung, Frederick, Alexander Wong, and David A. Clausi. "Enabling scalable spectral clustering for image segmentation." Pattern Recognition 43.12 (2010): 
  4069-4076.

Vijay, J., and Jagu Subhashini. "An efficient brain tumor detection methodology using K-means clustering algoriftnn." 2013 International conference on    
  communication and signal processing. IEEE, 2013.

Zhang, Xiangrong, et al. "Spectral clustering ensemble applied to SAR image segmentation." IEEE Transactions on Geoscience and Remote Sensing 46.7 (2008): 
  2126-2136.
