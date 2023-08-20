# TWRP 小米平板5 Pro系列
基于[小米平板5Pro橙狐设备树](https://github.com/ymdzq/OFRP-device_xiaomi_elish)修改的TWRP设备树  
参考了sk佬[k40 twrp设备树](https://github.com/sekaiacg/device_xiaomi_alioth-TWRP)，试图把小米平板5 Pro（elish）、小米平板5 Pro 5G（enuma）、小米平板5 Pro 12.4（dagu）都放进来  
所使用的内核源代码来自于[eva内核](https://github.com/mvaisakh/alioth)并且已打上[修复画面显示补丁](https://github.com/ymdzq/scripts/blob/main/0001-HACK-Disable-dynamic-fps-and-set-refresh-rate-104.patch)  
enuma、dagu无设备所以未测试  
由于小米开源的内核代码过于远古并且从未更新，用了第三方内核还必须要刷配套的[dtb](https://github.com/ymdzq/device_xiaomi_elish-TWRP/blob/android-13.0/prebuilt/elish/dtb)才能开机  
dtb在vendor_boot分区里面，所以刷twrp要同时刷vendor_boot，需要自己提取设备的vendor_boot.img替换dtb重新打包  

# 如何构建
下载TWRP源代码，克隆这个仓库放到相应的位置  
例如TWRP源代码根目录为~/twrp，则保存为~/twrp/device/xiaomi/elish/:  
```bash
cd ~/twrp
mkdir -p device/xiaomi
cd device/xiaomi
git clone https://github.com/ymdzq/device_xiaomi_elish-TWRP.git elish
```
打开源代码根目录按设备选择运行:  
小米平板5Pro（elish）  
```bash
. build/envsetup.sh && lunch twrp_elish-eng && mka bootimage
```
小米平板5Pro 5G（enuma）  
```bash
. build/envsetup.sh && lunch twrp_enuma-eng && mka bootimage
```
小米平板5Pro 12.4（dagu）  
```bash
. build/envsetup.sh && lunch twrp_dagu-eng && mka bootimage
```
