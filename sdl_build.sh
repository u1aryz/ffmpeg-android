#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd SDL-1.2.15

make clean

./configure \
  --with-pic \
  --host="arm-eabi-linux" \
  --disable-shared \
  --enable-static \
  --disable-joystick \
  --with-x=no \
  --prefix="${TOOLCHAIN_PREFIX}" || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd
