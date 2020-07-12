#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018 Raphiel Rollerscaperers (raphielscape)
# Copyright (C) 2018 Rama Bondan Prakoso (rama982)
# Android Kernel Build Script

cd ..

# Install build package for debian based linux
sudo apt install bc bash git-core gnupg build-essential \
    zip curl make automake autogen autoconf autotools-dev libtool shtool python \
    m4 gcc libtool zlib1g-dev flex bison libssl-dev

# Clone AnyKernel3
git clone https://github.com/DhineshCool/AnyKernel3 anykernel

#Download Clang and ToolChain
git clone https://github.com/kdrag0n/proton-clang.git clang
