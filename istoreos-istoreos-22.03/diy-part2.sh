#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


# update ubus git HEAD
cp -f $GITHUB_WORKSPACE/configfiles/ubus_Makefile package/system/ubus/Makefile


#修改uhttpd配置文件，启用nginx
# sed -i "/.*uhttpd.*/d" .config
# sed -i '/.*\/etc\/init.d.*/d' package/network/services/uhttpd/Makefile
# sed -i '/.*.\/files\/uhttpd.init.*/d' package/network/services/uhttpd/Makefile
sed -i "s/:80/:81/g" package/network/services/uhttpd/files/uhttpd.config
sed -i "s/:443/:4443/g" package/network/services/uhttpd/files/uhttpd.config
cp -a $GITHUB_WORKSPACE/configfiles/etc/* package/base-files/files/etc/
# ls package/base-files/files/etc/

# Add fine3399 file
cp -f $GITHUB_WORKSPACE/istoreos-istoreos-22.03/uboot/fine3399-rk3399_defconfig package/boot/uboot-rockchip/src/configs/fine3399-rk3399_defconfig
cp -f $GITHUB_WORKSPACE/istoreos-istoreos-22.03/uboot/fine3399-rk3399-u-boot.dtsi package/boot/uboot-rockchip/src/arch/arm/dts/fine3399-rk3399-u-boot.dtsi
cp -f $GITHUB_WORKSPACE/istoreos-istoreos-22.03/uboot/Makefile package/boot/uboot-rockchip/Makefile
cp -f $GITHUB_WORKSPACE/istoreos-istoreos-22.03/uboot/patches/105-fine3399-support-Makefile.patch package/boot/uboot-rockchip/patches/105-fine3399-support-Makefile.patch
cp -f $GITHUB_WORKSPACE/istoreos-istoreos-22.03/kernel/armv8.mk target/linux/rockchip/image/armv8.mk
cp -f $GITHUB_WORKSPACE/istoreos-istoreos-22.03/kernel/patches/910-add-fine3399-dts.patch target/linux/rockchip/target/linux/rockchip/patches-5.10/910-add-fine3399-dts.patch


#开启无线功能
cp -f $GITHUB_WORKSPACE/istoreos-istoreos-22.03/opwifi package/base-files/files/etc/init.d/opwifi
chmod 755 package/base-files/files/etc/init.d/opwifi
sed -i "s/wireless.radio\${devidx}.disabled=1/wireless.radio\${devidx}.disabled=0/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

