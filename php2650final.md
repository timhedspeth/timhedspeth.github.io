
---
title = "Clustering"
---

#### Project by Joanna Walsh and Timothy Hedspeth for PHP 2650


## What is clustering? 
Clustering is a general technique in statistical learning, where we are trying to identify clusters (subgroups) in our data. A clustering algorithim takes in unlabeled data, making it an unsupervised learning technique. These clusters are groups that are partitions of the input data where membership in clusters are associated with similarity between the observations that are in a cluster. This technique allows for us to capture grouping that seem natural such as finding grouping of hand written digits based on the value of the pixel, groups of pictures of different people (all photographed many times) to capture groups where the same indvidual is identified in a cluster, etc. There are many applications of clustering that extend beyond these basic examples. We extend our knoweldge of clustering to examine the process of image segmentation. 

## What is image segmentation?


## How does clustering apply to images 

## Algorithims we can use for image segmentation. 
### K-means clustering 


### Spectral clustering 


### Fuzzy c-means clustering 
In general clustering looks at "hard" boundaries between the subgroups that are found (i.e. data only belongs to a single cluster) (Bezdeck & Ehrlich & Full, 1983). In fuzzy clustering we consider something called a memmbership function which allows for data to be assigned to different clusters with different levels of membership. 


## How do we implement these methods? 
We use gray scale, 
For this project we apply the clustering methods that are discussed above to image data for both animals and medical imaging. The [R file] is attached here for refrence in case anyone wants to follow the code to get a more speifific idea of what we do 



##### Refrences 

Bezdek, James C., Robert Ehrlich, and William Full. "FCM: The fuzzy c-means clustering algorithm." Computers & geosciences 10.2-3 (1984): 191-203. 

Chuang, Keh-Shih, et al. "Fuzzy c-means clustering with spatial information for image segmentation." computerized medical imaging and graphics 30.1 (2006): 9-15.


