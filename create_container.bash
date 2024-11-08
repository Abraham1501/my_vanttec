#!/bin/bash

# Variables for docker run
IMAGE_NAME=uuv_imu
CONTAINER_NAME=uuv_imu

DOCKER_COMMAND="docker run"

xhost +

$DOCKER_COMMAND -it -d\
    --device /dev/ttyUSB0 \
    --network=host\
    --privileged \
    -v /dev:/dev \
    -v "$PWD/kalman_filter_localization:/ws/kalman_filter_localization" \
    -v "$PWD/vectornav:/ws/vectornav" \
    -v "$PWD/vectornav_msgs:/ws/vectornav_msgs" \
    --name=$CONTAINER_NAME\
    $IMAGE_NAME\
    bash