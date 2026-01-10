#!/bin/bash

source poky/oe-init-build-env build

echo "Configuring bblayers.conf and local.conf..."
cp ../configurations/rpi4/local.conf.sample conf/local.conf
cp ../configurations/rpi4/bblayers.conf.sample conf/bblayers.conf

sed -i "s|##OEROOT##|$(dirname $(pwd))|g" conf/bblayers.conf

echo "=================================================="
echo " 설정 완료. 아래 명령어로 빌드하세요:"
echo " bitbake core-image-base"
echo "=================================================="