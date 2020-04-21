#!/bin/bash

export PATH=${HOME}/darknet
cd ${HOME}/darknet
./darknet detector demo \
cfg/coco.data \
cfg/yolov3.cfg \
yolov3.weights \
-width 416 -height 416 \
-ext_output shinjuku.mp4
