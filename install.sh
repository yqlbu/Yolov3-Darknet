#!/bin/bash

# Export CUDA Path
export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Download Darkent and Yolo
cd ${HOME}
sudo apt-get update
git clone https://github.com/AlexeyAB/darknet
cd darknet
wget https://objectstorage.ca-toronto-1.oraclecloud.com/n/yzpqsgba6ssd/b/bucket-20200415-0121/o/yolov3.weights -q --show-progress
wget https://objectstorage.ca-toronto-1.oraclecloud.com/n/yzpqsgba6ssd/b/bucket-20200415-0121/o/yolov3-tiny.weights -q --show-progress

#Enable the GPU
sed -i 's/GPU=0/GPU=1/g' Makefile
sed -i 's/CUDNN=0/CUDNN=1/g' Makefile
sed -i 's/OPENCV=0/OPENCV=1/g' Makefile

#Download demo files
wget https://upload.wikimedia.org/wikipedia/commons/d/dd/Golden_Retriever_Hund_Dog.JPG -O ${HOME}/darknet/dog.jpg -q --show-progress
wget https://objectstorage.ca-toronto-1.oraclecloud.com/n/yzpqsgba6ssd/b/bucket-20200415-0121/o/shinjuku.mp4 -O ${HOME}/darknet/shinjuku.mp4 -q --show-progress

#Compile the Darknet
make

#Grant permission for demo scripts
sudo chmod +x image.sh
sudo chmod +x camera.sh
sudo chmod +X video.sh

