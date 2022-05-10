
---

title = "Clustering"

---

#### Project by Joanna Walsh and Timothy Hedspeth for PHP 2650


## What is clustering? 
Clustering is a general technique in statistical learning, where we are trying to identify clusters (subgroups) in our data. A clustering algorithim takes in unlabeled data, making it an unsupervised learning technique. These clusters are groups that are partitions of the input data where membership in clusters are associated with similarity between the observations that are in a cluster. This technique allows for us to capture grouping that seem natural such as finding grouping of hand written digits based on the value of the pixel, groups of pictures of different people (all photographed many times) to capture groups where the same indvidual is identified in a cluster, etc. There are many applications of clustering that extend beyond these basic examples. We extend our knoweldge of clustering to examine the process of image segmentation. 

## What is image segmentation?
When we look at a picture we are able to instantly reckognize the distnict entities in an image wheter it be a person, a blotch on a meidcal image, a plane in the sky. But this process is not so simple for a clustering algorithim, these algorihtims take in the data at the pixel level of the image and try to learn the patterns. Image segmentation is the process in which we are trying to learn things about an image, namely what objects present in the image (Zhang). The field of image segmentation is incredibly important and contains many algorithoms and is constantly being furthered, especially as its so importnat for medical imaging. 

<img src="https://render.githubusercontent.com/render/math?math=e^{i \pi} = -1">



## Algorithims we can use for image segmentation. 
### K-means clustering 


### Spectral clustering 


### Fuzzy c-means clustering 
In general clustering looks at "hard" boundaries between the subgroups that are found (i.e. data only belongs to a single cluster) (Bezdeck & Ehrlich & Full, 1983). In fuzzy clustering we consider something called a memmbership function which allows for data to be assigned to different clusters with different levels of membership (chuang). This is an important distinction between other clustering algroithims, as the nebighoring pixels in an image are highly correlated, so the information in surrounding pixels can be important in forming clusters. 


## How do we implement these methods? 
We use gray scale, 
For this project we apply the clustering methods that are discussed above to image data for both animals and medical imaging. The [R file] is attached here for refrence in case anyone wants to follow the code to get a more speifific idea of what we do 



#### Refrences 

Bezdek, James C., Robert Ehrlich, and William Full. "FCM: The fuzzy c-means clustering algorithm." Computers & geosciences 10.2-3 (1984): 191-203. 

Chuang, Keh-Shih, et al. "Fuzzy c-means clustering with spatial information for image segmentation." computerized medical imaging and graphics 30.1 (2006): 9-15.

Dhanachandra, Nameirakpam, Khumanthem Manglem, and Yambem Jina Chanu. "Image segmentation using K-means clustering algorithm and subtractive clustering algorithm." Procedia Computer Science 54 (2015): 764-771.

A SURVEY O N EVALUATION METHODS FOR
IMAGE SEGMENTATION Zhang 
