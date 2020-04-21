#!/bin/bash

export PATH=${HOME}/darknet
cd ${PATH}
./darknet detector demo \
cfg/coco.data \
cfg/yolov3.cfg \
yolov3.weights \
-width 480 -height 640 \
-c 0
