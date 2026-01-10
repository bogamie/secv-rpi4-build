#!/bin/bash

PROJECT_ROOT=$(pwd)

source poky/oe-init-build-env build

echo "Configuring bblayers.conf and local.conf..."

if [ -f "$PROJECT_ROOT/configurations/rpi4/local.conf.sample" ]; then
    cp "$PROJECT_ROOT/configurations/rpi4/local.conf.sample" "$PROJECT_ROOT/build/conf/local.conf"
    cp "$PROJECT_ROOT/configurations/rpi4/bblayers.conf.sample" "$PROJECT_ROOT/build/conf/bblayers.conf"
    
    sed -i "s|##OEROOT##|$PROJECT_ROOT|g" "$PROJECT_ROOT/build/conf/bblayers.conf"

    echo "=================================================="
    echo " 아래 명령어로 빌드하세요."
    echo " bitbake core-image-base"
    echo "=================================================="
else
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo " 에러: 설정 원본 파일을 찾을 수 없습니다."
    echo " $PROJECT_ROOT/configurations/rpi4/ 폴더를 확인하세요."
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
fi