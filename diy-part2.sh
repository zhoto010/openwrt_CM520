#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
theme_argon='https://github.com/sypopo/luci-theme-argon-mc.git'             # 主题地址
openClash_url='https://github.com/vernesong/OpenClash.git'                  # OpenClash包地址
filter_url='https://github.com/destan19/OpenAppFilter.git'                  # AppFilter 地址

echo '添加主题argon'
git clone $theme_argon package/lean/luci-theme-argon-mc
echo 'CONFIG_PACKAGE_luci-theme-argon-mc=y' >>.config

echo '添加OpenClash'
git clone $openClash_url package/lean/luci-app-openclash

#  OpenClash
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >>.config
echo 'CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y' >>.config

echo '添加filebrowser'
echo 'CONFIG_PACKAGE_luci-app-filebrowser=y' >>.config
echo 'CONFIG_PACKAGE_luci-i18n-filebrowser-zh-cn=y' >>.config

echo '添加OpenAppFilter过滤器'
git clone $filter_url package/OpenAppFilter
echo 'CONFIG_PACKAGE_luci-app-oaf=y' >>.config
echo 'CONFIG_PACKAGE_kmod-oaf=y' >>.config
echo 'CONFIG_PACKAGE_appfilter=y' >>.config
echo 'CONFIG_PACKAGE_luci-i18n-oaf-zh-cn=y' >>.config
