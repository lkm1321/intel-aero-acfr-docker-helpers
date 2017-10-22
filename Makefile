run: 
	docker run -it --privileged \
	--name=intel-aero-docker-withdata \
	--network=host \
	-e QT_GRAPHICSSYSTEM="native" \
	-e DISPLAY \
	-e QT_X11_NO_MITSHM=1 \
	-e ROS_IP=$(hostname -i) \
	-e ROS_HOSTNAME=$(hostname) \
	-u acfr \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	--device=/dev/dri:/dev/dri \
	lkm1321/intel-aero-acfr:withdata
#	xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerId` \
#	docker start $containerId

attach: 
	docker exec -it intel-aero-docker /ros_entrypoint.sh
 
run-root: 
	docker run -it --privileged \
	--name=intel-aero-docker \
	-p 5700:5700 -e QT_GRAPHICSSYSTEM="native" \
	-e DISPLAY \
	-e QT_X11_NO_MITSHM=1 \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	--device=/dev/dri:/dev/dri \
	lkm1321/intel-aero-acfr:latest

