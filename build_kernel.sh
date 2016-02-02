#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=/home/root/arm-eabi-4.8/bin/arm-eabi-
mkdir output

make -C $(pwd) O=output msm8974_sec_defconfig VARIANT_DEFCONFIG=msm8974pro_sec_klte_kdi_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -C $(pwd) O=output -j2

# Add AUTO Generate kernel & DT
tt=$(date)
mkdir "./aafile/$tt"
cp output/arch/arm/boot/zImage "./aafile/$tt/boot.img-kernel"
./tools/dtbTool -o "./aafile/$tt/boot.img-dt" -s 2048 -p ./output/scripts/dtc/ ./output/arch/arm/boot/

# cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage
