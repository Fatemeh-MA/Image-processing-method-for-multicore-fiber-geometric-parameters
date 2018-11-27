# Image-processing-method-for-multicore-fiber-geometric-parameters


in this program, I implemented the method of the article " Image processing method for multicore fiber geometric parameters" 
you can find this article in https://www.sciencedirect.com/science/article/pii/S1068520016300098 

This program divided into four Steps:
 
* 1- Image pre-processing  (filter and remove noise)
* 2- Image segmentation
* 3- Image edge detection 
* 4- fitting and calculate

# 1- Pre-Processing

![alt tag](http://uupload.ir/files/1icg_untitled.jpg "Pre-Processing")

In the process of segmentation, the key is the selection of threshold ‘T’.
then choose a suitable threshold ‘T’, and the image segmentation can be described by the following formula :


![alt tag](http://uupload.ir/files/w74a_sd.png "selection of threshold")

this is the best threshold 

![alt tag](http://uupload.ir/files/3ba_ss.png "calculate the best threshold using Gradation histogram")



# 2- Image segmentation

The Result: 

![alt tag](http://uupload.ir/files/brv0_e.png "Image segmentation")




# 3- Image edge detection 


![alt tag](http://uupload.ir/files/sgk8_fh.png "Edge detection using Canny filter")


![alt tag](http://uupload.ir/files/g47l_gg.png "Separate outline of the cores with radius smaller than 5 (pixels) and greater than 60")



# 4- fitting and calculate


![alt tag](http://uupload.ir/files/gulj_hj.png "Separate outline of the cores with radius smaller than 5")


![alt tag](http://uupload.ir/files/g0qn_hk.png "compare different filters")

