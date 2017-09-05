FROM ros:latest
MAINTAINER Brian Lee <b.lee@acfr.usyd.edu.au>

# For FFMPEG
RUN echo "deb http://ppa.launchpad.net/jon-severinsson/ffmpeg/ubuntu quantal main" >> /etc/apt/sources.list
RUN echo apt-key adv --keyserver keyserver.ubuntu.com -recv-keys 1DB8ADC1CFCA9579

# Installing OpenCV
RUN apt-get update
RUN apt-get install -y -q wget curl
RUN apt-get install -y -q build-essential
RUN apt-get install -y -q cmake
RUN apt-get install -y -q python2.7 python2.7-dev
RUN wget 'https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg' && /bin/sh setuptools-0.6c11-py2.7.egg && rm -f setuptools-0.6c11-py2.7.egg
RUN	curl 'https://raw.github.com/pypa/pip/master/contrib/get-pip.py' | python2.7
RUN	pip install numpy
RUN	apt-get install -y -q libavformat-dev libavcodec-dev libavfilter-dev libswscale-dev
RUN	apt-get install -y -q libjpeg-dev libpng-dev libtiff-dev libjasper-dev zlib1g-dev libopenexr-dev libxine-dev libeigen3-dev libtbb-dev
RUN	build_opencv.sh	/build_opencv.sh
RUN	/bin/sh /install_opencv.sh
RUN	rm -rf /install_opencv.sh

# Installing librealsense + ros

RUN apt-get install -y -q ros-kinetic-mavros iproute2 ros-kinetic-image-view openssh-client
RUN apt-get install -y -q ros-kinetic-librealsense ros-kinetic-realsense-camera
