#!/bin/bash
#batch.sh
#Carlos Piza-Palma
#10/11/16
#Purpose: Script for batch processing images through yolo neural net
#Assumptions: 
#	- You have built yolo with the modified yolo.c file
#Use: 
#	1.) You must make the script executable either use chmod 555 batch.sh
#		or chmod +rx batch.sh
#	2.) to run do ./batch.sh path extension name_out_folder
#		ex. ./batch.sh data/ jpg out
#	3.) ./batch.sh -h for help
	
# get the path
path="$1"
extension="$2"
out="$3"
file="paths.txt"

if [ "$#" -ne 3 ] || [ "$1" == "-h" ]; then
	echo "Usage:  $0  /path/to/file .extension out_directory_name"
	echo "Example $0       data/        jpg            out"
	exit 0
fi

#writes paths of images with desired extension to paths.txt for processing
shopt -s nullglob 
for f in $path*.$extension
do
	echo "$f" >> "$file" 
	#filename="${f##*/}"
	#extension="${filename##*.}"
	#filename="${filename%.*}"
	#mkdir -p "$path""$out"
	#mv resized.png "$path""$out"/r"$filename".png
	#mv predictions.png "$path""$out"/p"$filename".png
done

#runs yolo processing on images in paths.txt
/scratch2/${USER}/Darknet/CU-Darknet/darknet yolo test cfg/yolo.cfg weights/yolo.weights < "$file"
#/scratch2/${USER}/Darknet/CU-Darknet/darknet classifier predict cfg/imagenet1k.dataset cfg/extraction.cfg weights/extraction.weights < paths.txt
echo "done"

#makes a directory in path of images and moves them to that directory
mkdir -p "$path""$out"

shopt -s nullglob
for f in *.png
do
	mv $f "$path""$out"
done 
rm "$file"
