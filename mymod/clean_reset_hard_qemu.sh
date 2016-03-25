#!/bin/bash

cd $1
cd bios_qemu_tz_arm
git clean -xdf
git reset --hard
cd ../build
git clean -xdf
git reset --hard
cd ../busybox
git clean -xdf
git reset --hard
#cd ../comcast_crypto_ta_example
#git clean -xdf
#git reset --hard
cd ../gen_rootfs
git clean -xdf
#cd ../gp_conf
#git clean -xdf
#git reset --hard
#cd ../lcu14_optee_hello_world
#git clean -xdf
#git reset --hard
cd ../linux
git clean -xdf
git reset --hard
cd ../optee_client
git clean -xdf
git reset --hard
cd ../optee_os
git clean -xdf
git reset --hard
cd ../optee_test
git clean -xdf
git reset --hard
cd ../qemu
git clean -xdf
git reset --hard
cd ../soc_term
git clean -xdf
git reset --hard
