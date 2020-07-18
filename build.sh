#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018 Raphiel Rollerscaperers (raphielscape)
# Copyright (C) 2018 Rama Bndan Prakoso (rama982)
# Android Kernel Build Script

###################### ONLY FOR DxT ####################

# Main environtment
KERNEL_DIR=$PWD
KERN_IMG=$KERNEL_DIR/out/arch/arm64/boot/Image.gz-dtb
ZIP_DIR=/home/dhinesh/kernel/anykernel
CONFIG=dxt_defconfig
CROSS_COMPILE="aarch64-linux-gnu-"
CROSS_COMPILE_ARM32="arm-linux-gnueabi-"
PATH="/home/dhinesh/kernel/clang/bin:/home/dhinesh/kernel/clang/aarch64-linux-gnu/bin:/home/dhinesh/kernel/clang/aarch64-linux-gnu/bin:${PATH}"

# Export
export ARCH=arm64
export CROSS_COMPILE
export CROSS_COMPILE_ARM32

# Build start
make O=out $CONFIG
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
CROSS_COMPILE=aarch64-linux-gnu-

if ! [ -a $KERN_IMG ]; then
    echo "Build error!"
    exit 1
fi

cd $ZIP_DIR
make clean &>/dev/null
cd ..
cd $ZIP_DIR
cp $KERN_IMG zImage
make normal &>/dev/null
rm -rf DxT-v1.5.zip
zip -r9 DxT-v1.5.zip * -x .git README.md *placeholder
echo "Flashable zip generated under $ZIP_DIR."
cd ..
# Build end
