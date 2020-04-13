#!/bin/bash 

# git clone https://github.com/xyyeh/bullet3.git
cd bullet3
# git checkout develop

git submodule init
git submodule update
git pull origin develop

mkdir build -p && cd build
cmake .. -DBUILD_PYBULLET=OFF -DBUILD_UNIT_TESTS=OFF $@
make -j8
make install

cd ..
cp build/examples/RobotSimulatorShm/RobotSimulatorShm ../../app_simulation/
cp build/data/checker_blue.png ../../app_simulation/
cp build/data/plane.mtl ../../app_simulation/
cp build/data/plane.obj ../../app_simulation/
cp build/data/plane.urdf ../../app_simulation/
cp -rf build/data/panda ../../app_simulation/

cp build/examples/RobotSimulatorStewart/RobotSimulatorStewart ../../app_simulation/
cp -rf build/data/stewart ../../app_simulation/