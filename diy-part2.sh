#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#移除不用软件包    
rm -rf package/lean/luci-app-dockerman
rm -rf package/lean/luci-app-wrtbwmon
#添加额外软件包
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# 编译 po2lmo (如果有po2lmo可跳过)

git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/brook package/brook
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/chinadns-ng package/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/ssocks package/ssocks
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/tcping package/tcping
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-go package/trojan-go
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-plus package/trojan-plus
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-filebrowser package/luci-app-filebrowser
#svn co https://github.com/esirplayground/Lienol-obsolete/trunk/luci-app-passwall package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/luci-app-passwall

svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-gost package/luci-app-gost
svn co https://github.com/kenzok8/openwrt-packages/trunk/gost package/gost
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-eqos package/luci-app-eqos
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
# cd package/luci-app-serverchan && git reset --hard 6387b3b47b03d95d3f3bcd42ff98db5bb84fd056 && git pull && cd ../..
svn co https://github.com/brvphoenix/wrtbwmon/trunk/wrtbwmon package/wrtbwmon
git clone https://github.com/brvphoenix/luci-app-wrtbwmon
cd luci-app-wrtbwmon
git reset --hard ff7773abbf71120fc39a276393b29ba47353a7e2 && cp -r luci-app-wrtbwmon ../package/
cd ..
# themes
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-opentomato package/luci-theme-opentomato
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-edge package/luci-theme-edge
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argon_new package/luci-theme-argon_new
svn co https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy package/luci-theme-rosy
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/luci-theme-atmaterial
git clone https://github.com/sirpdboy/luci-theme-opentopd package/luci-theme-opentopd

git clone https://github.com/xrouterservice/luci-app-koolddns.git package/luci-app-koolddns
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/luci-app-ssr-plus
svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/naiveproxy
#赋予koolddns权限
chmod 0755 package/luci-app-koolddns/root/etc/init.d/koolddns
chmod 0755 package/luci-app-koolddns/root/usr/share/koolddns/aliddns

#添加subconverter
#git clone https://github.com/tindy2013/openwrt-subconverter.git package/open-subconverter
#mv package/open-subconverter/rapidjson package/
#mv package/open-subconverter/subconverter/ package/
#rm -rf package/open-subconverter
#添加subweb
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/subweb package/subweb
#添加smartdns
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/smartdns package/smartdns
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns package/luci-app-smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

#添加ksmbd
#svn co https://github.com/openwrt/luci/trunk/applications/luci-app-ksmbd package/luci-app-ksmbd
#添加udp2raw
git clone https://github.com/sensec/openwrt-udp2raw package/openwrt-udp2raw
git clone https://github.com/sensec/luci-app-udp2raw package/luci-app-udp2raw
sed -i "s/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=f2f90a9a150be94d50af555b53657a2a4309f287/" package/openwrt-udp2raw/Makefile
sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=20200920\.0/" package/openwrt-udp2raw/Makefile
./scripts/feeds update -a
./scripts/feeds install -a

#readd cpufreq for aarch64
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile

#replace coremark.sh with the new one
rm package/lean/coremark/coremark.sh
cp $GITHUB_WORKSPACE/general/coremark.sh package/lean/coremark/
