#!/bin/bash
# Raspbian Buster with desktop 2019-09-26

# install tensorflow

install_tensorflow(){
  sudo apt-get update
  sudo apt-get install -y libhdf5-dev libc-ares-dev libeigen3-dev
  sudo pip3 install keras_applications==1.0.8 --no-deps
  sudo pip3 install keras_preprocessing==1.1.0 --no-deps
  sudo pip3 install h5py==2.9.0
  sudo apt-get install -y openmpi-bin libopenmpi-dev
  sudo apt-get install -y libatlas-base-dev
  python3 -m pip install -U six wheel mock
  wget https://github.com/lhelontra/tensorflow-on-arm/releases/download/v1.14.0-buster/tensorflow-1.14.0-cp37-none-linux_armv7l.whl
  sudo pip3 uninstall tensorflow
  sudo pip3 install install tensorflow-1.14.0-cp37-none-linux_armv7l.whl
  sudo pip3 install keras==2.2.5
}


START_TIME=`date +%s`

install_tensorflow

END_TIME=`date +%s`

SS=`expr ${END_TIME} - ${START_TIME}`
HH=`expr ${SS} / 3600`
SS=`expr ${SS} % 3600`
MM=`expr ${SS} / 60`
SS=`expr ${SS} % 60`

echo "Total Time: ${HH}:${MM}:${SS} (h:m:s)"
