run: 
	docker run -it --privileged \
	--name=intel-aero-docker \
	--network=host \
	-e QT_GRAPHICSSYSTEM="native" \
	-e DISPLAY \
	-e QT_X11_NO_MITSHM=1 \
	-u acfr \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	--device=/dev/dri:/dev/dri \
	lkm1321/intel-aero-acfr:latest
#	xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerId` \
#	docker start $containerId

attach: 
	docker exec -it intel-aero-docker /ros_entrypoint.sh

commit:
	docker commit intel-aero-docker lkm1321/intel-aero-acfr:latest

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

