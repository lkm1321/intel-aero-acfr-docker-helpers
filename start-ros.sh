#!/bin/bash

docker run --privileged --name=intel-aero-docker --net=host -u=root --device=/dev/dri:/dev/dri --entrypoint=/ros_entrypoint_standalone.sh lkm1321/intel-aero-acfr:latest roslaunch intel-aero-acfr intel-aero-acfr.launch >> /log.txt

