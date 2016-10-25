#Pseudo Code for Python OpenCV Bounding Boxes
# Courtesy of Carlos Piza-Palma

import cv2 
import numpy as np

#import image
#note: you may wish to make copies of the original image as
#	some functions are destructive.


################Part I Masks#############################################
#Use masks to extract only relevant parts of the image we are interested in
#note: HSV color space mask ranges may become obsolete with original images

#convert image to hsv colorspace

#Red mask (for pedestrians)
#note: red hsv has to color ranges you will need to make two masks and
# 	add them together for the full range

#lower mask (0-10)

#upper mask (170-180)

#final mask in full range

#Yellow mask

#Blue Mask


#restore color
#This restores the original color back to the masked images

#display images
#Note: You could display all the images up to this point here or
#	display them after each step.

#################Part II Contours###############3###########################
#Find contours for the desired objects

#convert image to gray

#blur image

#edge detection (optional)

#erosion (optional)

#thresholding

#closing (optional)

#find contours

#draw contours

################Part III Bounding Boxes######################################
#drawing bounding boxes


#exit stuff
#note:this closes all windows after a keypress
k = cv2.waitKey(0) & 0xFF
if k == 27:
	cv2.destroyAllWindows()

