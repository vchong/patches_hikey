#!/bin/bash

#arm-smccc suprt
git cherry-pick 98dd64f
git cherry-pick b329f95
git cherry-pick 1445745
git cherry-pick e679660

#gendrv
git cherry-pick da81436
git cherry-pick 8f50c11
git cherry-pick 968f7be
git cherry-pick d4dd8d0

#kernel internal clnt intf *not for mainline*
git cherry-pick 2de81a6

#for foundation-v8 and qemu-v8
git cherry-pick 8dfd615
git cherry-pick 5f9c0c5
git cherry-pick 98c3d5a
git cherry-pick 0e45273

#optee node
git cherry-pick d95bf94

