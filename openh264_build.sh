#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd openh264

make clean
git clean -fdx .

case $1 in
	armeabi-v7a | armeabi-v7a-neon)
		ARCH=arm
		APP_ABI=armeabi
	;;
	x86)
		ARCH=x86
		APP_ABI=x86
	;;
esac

make -j${NUMBER_OF_CORES} OS=android PREFIX=${TOOLCHAIN_PREFIX} NDKROOT=${ANDROID_NDK_ROOT_PATH} TARGET=android-15 ARCH=${ARCH} APP_ABI=${APP_ABI} install-shared || exit 1

popd
