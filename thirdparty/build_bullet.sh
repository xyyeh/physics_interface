#!/bin/bash 

git clone https://github.com/bulletphysics/bullet3.git
echo "adsf"
cd bullet3
git checkout 196d0645b13e51a0a392e831a96778d8823731a8

mkdir build -p && cd build
cmake .. -DBUILD_PYBULLET=OFF $@
make -j3
make install