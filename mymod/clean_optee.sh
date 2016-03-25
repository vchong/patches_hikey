#!/bin/bash

if [ -z "$1" ]; then
	echo "Please provide path!"
	exit
fi

cd $1
cd optee_client
git clean -xdf
#cd ../optee_linuxdriver
#git clean -xdf
cd ../optee_os
git clean -xdf
