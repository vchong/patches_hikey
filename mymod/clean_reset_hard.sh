#!/bin/bash

cd $1
echo "aes-perf"
cd aes-perf
git clean -xdf
git reset --hard
echo "atf"
cd ../arm-trusted-firmware
git clean -xdf
git reset --hard
echo "build"
cd ../build
git clean -xdf
git reset --hard
echo "burn-boot"
cd ../burn-boot
git clean -xdf
git reset --hard
echo "busybox"
cd ../busybox
git clean -xdf
git reset --hard
echo "edk2"
cd ../edk2
git clean -xdf
git reset --hard
echo "gen_rootfs"
cd ../gen_rootfs
git clean -xdf
git reset --hard
echo "grub"
cd ../grub
git clean -xdf
git reset --hard
echo "linux"
cd ../linux
git clean -xdf
git reset --hard
echo "l-loader"
cd ../l-loader
git clean -xdf
git reset --hard
echo "client"
cd ../optee_client
git clean -xdf
git reset --hard
#echo "driver"
#cd ../optee_linuxdriver
#git clean -xdf
#git reset --hard
echo "os"
cd ../optee_os
git clean -xdf
git reset --hard
echo "xtest"
cd ../optee_test
git clean -xdf
git reset --hard
echo "patches"
cd ../patches_hikey
git clean -xdf
git reset --hard
echo "sha-perf"
cd ../sha-perf
git clean -xdf
git reset --hard
echo "strace"
cd ../strace
git clean -xdf
git reset --hard
