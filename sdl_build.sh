#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd SDL-1.2.15

make clean

case $1 in
  armeabi-v7a | armeabi-v7a-neon)
    HOST=arm-eabi-linux
  ;;
  x86)
    HOST=i686-eabi-linux
  ;;
esac

./configure \
  --with-pic \
  --host="$HOST" \
  --disable-shared \
  --enable-static \
  --disable-joystick \
  --enable-cdrom=no \
  --enable-video-fbcon=no \
  --enable-video-directfb=no \
  --with-x=no \
  --prefix="${TOOLCHAIN_PREFIX}" || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd
