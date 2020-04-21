#!/bin/bash

cd ${HOME}/darknet
./darknet detector test \
cfg/coco.data \
cfg/yolov3.cfg \
yolov3.weights \
-ext_output dog.jpg
