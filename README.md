# TWRP 小米平板5 Pro系列
基于[小米平板5Pro橙狐设备树](https://github.com/ymdzq/OFRP-device_xiaomi_elish)修改的TWRP设备树  
参考了sk佬[k40 twrp设备树](https://github.com/sekaiacg/device_xiaomi_alioth-TWRP)，试图把小米平板5 Pro（elish）、小米平板5 Pro 5G（enuma）、小米平板5 Pro 12.4（dagu）、小米平板6（pipa）都放进来  
enuma、dagu、pipa无设备所以未测试  

# 如何构建
下载TWRP源代码，然后用repopick给TWRP源代码打上7679..7683系列补丁，  
偷懒可以直接用[skkk修改的twrp](https://github.com/sekaiacg/twrp_recovery)或者[余空修改的twrp](https://github.com/YuKongA/android_bootable_recovery)替换~/twrp/bootable/recovery文件夹，  
克隆这个仓库放到相应的位置  
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
小米平板6（pipa）  
```bash
. build/envsetup.sh && lunch twrp_pipa-eng && mka bootimage
```