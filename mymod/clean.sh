#!/bin/bash

cd $1
cd aes-perf
git clean -xdf
cd ../arm-trusted-firmware
git clean -xdf
#cd ../build
#git clean -xdf
#git reset --hard
cd ../burn-boot
git clean -xdf
cd ../busybox
git clean -xdf
cd ../edk2
git clean -xdf
cd ../gen_rootfs
git clean -xdf
cd ../grub
git clean -xdf
cd ../linux
git clean -xdf
cd ../l-loader
git clean -xdf
cd ../optee_client
git clean -xdf
#cd ../optee_linuxdriver
#git clean -xdf
cd ../optee_os
git clean -xdf
cd ../optee_test
git clean -xdf
cd ../patches_hikey
git clean -xdf
cd ../sha-perf
git clean -xdf
cd ../strace
git clean -xdf
