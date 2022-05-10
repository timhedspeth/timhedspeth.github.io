
---

title = "Clustering"

---

#### Project by Joanna Walsh and Timothy Hedspeth for PHP 2650

Example of equations: <img src="https://render.githubusercontent.com/render/math?math=e^{i \pi} = -1">

## What is clustering? 
Clustering is a general technique in statistical learning, where we are trying to identify clusters (subgroups) in our data. A clustering algorithim takes in unlabeled data, making it an unsupervised learning technique. These clusters are groups that are partitions of the input data where membership in clusters are associated with similarity between the observations that are in a cluster. This technique allows for us to capture grouping that seem natural such as finding grouping of hand written digits based on the value of the pixel, groups of pictures of different people (all photographed many times) to capture groups where the same indvidual is identified in a cluster, etc. There are many applications of clustering that extend beyond these basic examples. We extend our knoweldge of clustering to examine the process of image segmentation. 

## What is image segmentation?
Image segmetation at the base level, is when a machine is tryin learn and extract different parts of an image, and is a crucial step in the process of image processing (Dass & Devi). What does this practically mean though? Us humans (that are able to see) can look at an image and clearly identify the distinict objects that are present. Take the images below as an example:
![Birman_22](https://user-images.githubusercontent.com/71342657/167688081-fec9f247-5b44-4e8e-bbe6-f9362cc3ead6.jpg)

![image](https://user-images.githubusercontent.com/71342657/167689885-0e5e1a24-193a-482e-85f7-95ad033f2119.png)

In the first image we can clearly see that Birman, the siammese cat, is sitting in a beautiful bed of grass. On the contrary in the second image we see a CT scan of the Opharanx (a part of the throat). In both of these images we are able to observe disticit objects birman and the grassy background, though we may not be able to note what parts of the Ophranx are shown (and which regions are indicative of 




## Algorithims we can use for image segmentation. 
### K-means clustering 


### Spectral clustering 


### Fuzzy c-means clustering 
In general clustering looks at "hard" boundaries between the subgroups that are found (i.e. data only belongs to a single cluster) (Bezdeck & Ehrlich & Full, 1983). In fuzzy clustering we consider something called a memmbership function which allows for data to be assigned to different clusters with different levels of membership (chuang). This is an important distinction between other clustering algroithims, as the nebighoring pixels in an image are highly correlated, so the information in surrounding pixels can be important in forming clusters. 

Objective function: <img src="https://render.githubusercontent.com/render/math?math=J=minimize(\sum_{j=1}^N\sum_{i=1}^C u_{ij}^m ||x_j-v_i||)">

## How do we implement these methods? 
We use gray scale, 
For this project we apply the clustering methods that are discussed above to image data for both animals and medical imaging. The [R file] is attached here for refrence in case anyone wants to follow the code to get a more speifific idea of what we do 



#### Refrences 

Bezdek, James C., Robert Ehrlich, and William Full. "FCM: The fuzzy c-means clustering algorithm." Computers & geosciences 10.2-3 (1984): 191-203. 

Chuang, Keh-Shih, et al. "Fuzzy c-means clustering with spatial information for image segmentation." computerized medical imaging and graphics 30.1 (2006): 9-15.

Dhanachandra, Nameirakpam, Khumanthem Manglem, and Yambem Jina Chanu. "Image segmentation using K-means clustering algorithm and subtractive clustering algorithm." Procedia Computer Science 54 (2015): 764-771.

A SURVEY O N EVALUATION METHODS FOR
IMAGE SEGMENTATION Zhang 
