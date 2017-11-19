run: 
	docker run -it --privileged \
	--name=intel-aero-docker \
	--net=host \
	-e QT_GRAPHICSSYSTEM="native" \
	-e DISPLAY \
	-e QT_X11_NO_MITSHM=1 \
	-u root \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	--device=/dev/dri:/dev/dri \
	--entrypoint=/ros_entrypoint.sh \
	lkm1321/intel-aero-acfr:latest bash
#	xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerId` \
#	docker start $containerId
#	-v /var/run/dbus:/var/run/dbus \ # If I ever need to mount dbus

run-standalone: # Don't get a shell 
	docker run --privileged \
	--name=intel-aero-docker \
	--net=host \
	-u root \
	--device=/dev/dri:/dev/dri \
	--entrypoint=/ros_entrypoint_standalone.sh \
	lkm1321/intel-aero-acfr:latest roslaunch intel-aero-acfr intel-aero-acfr.launch

attach: 
	docker exec -it intel-aero-docker /ros_entrypoint.sh bash

commit:
	docker commit intel-aero-docker lkm1321/intel-aero-acfr:latest

recover:
	docker run -it --entrypoint=/bin/bash --name=intel-aero-docker -u root lkm1321/intel-aero-acfr:latest --login

clean: 
	docker rm intel-aero-docker 

run-gcs: 
	docker run -it --privileged \
	--name=intel-aero-gcs-docker \
	--network=host \
	-e QT_GRAPHICSSYSTEM="native" \
	-e DISPLAY \
	-e QT_X11_NO_MITSHM=1 \
	-e ROS_IP=$(hostname -I) \
	-e ROS_HOSTNAME=$(hostname) \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	--device=/dev/dri:/dev/dri \
	lkm1321/intel-aero-acfr:demo 
#	xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerId` \
#	docker start $containerId

run-root: 
	docker run -it --privileged \
	--name=intel-aero-docker \
	-p 5700:5700 -e QT_GRAPHICSSYSTEM="native" \
	-e DISPLAY \
	-e QT_X11_NO_MITSHM=1 \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	--device=/dev/dri:/dev/dri \
	lkm1321/intel-aero-acfr:latest

