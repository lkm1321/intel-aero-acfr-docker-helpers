#!/bin/bash 

wget 'https://sourceforge.net/projects/opencvlibrary/files/opencv-unix/3.3.0/opencv-3.3.0.zip' -O opencv-3.3.0.zip 
unzip opencv-3.3.0.zip
cd opencv-3.3.0
git clone https://github.com/opencv/opencv_contrib.git
mkdir -p release && cd release 
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
-D BUILD_PYTHON_SUPPORT=ON -D WITH_XINE=ON -D WITH_TBB=ON \
-D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules/ \
-D BUILD_EXAMPLES=ON ../
make -j $(($(nproc) + 1)) && make install
# Use relative path
cd ../../ 
# Disable source hiding until we're sure we don't need other defines. 
# rm -rf opencv-3.3.0

