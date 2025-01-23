# TWRP 小米平板5 Pro系列
基于[小米平板5Pro橙狐设备树](https://github.com/ymdzq/OFRP-device_xiaomi_elish)修改的TWRP设备树  
参考了sk佬[k40 twrp设备树](https://github.com/sekaiacg/device_xiaomi_alioth-TWRP)，试图把小米平板5 Pro（elish）、小米平板5 Pro 5G（enuma）、小米平板5 Pro 12.4（dagu）、小米平板6（pipa）都放进来  
# 目前进度
elish基本功能可用，解密安卓14澎湃OS1.0的data分区正常(理论上支持安卓15未测试)，触摸控制正常，并且可以正常刷入HyperOS完整包  
enuma、dagu基本功能可用，pipa无设备所以未测试  
# 如何使用
进入[Release](https://github.com/ymdzq/device_xiaomi_elish-TWRP/releases)中，根据标题上的twrp_elish、twrp_enuma、twrp_dagu、twrp_pipa区分机型，点开Assets选项，点击boot.img文件名下载  
需要平板连接电脑线刷，请自备[fastboot工具](https://developer.android.google.cn/studio/releases/platform-tools?hl=zh-cn)  
也可以使用已root手机通过甲壳虫adb助手等app使用c to c数据线otg刷机，  
手动重启平板至bootloader模式（橙色fastboot字样）  
使用fastboot工具临时启动boot镜像进入rec，命令：  
```bash
fastboot boot boot.img
```
（禁止刷入boot分区，因为会导致你无限进入recovery，无法正常进入系统）  
临时启动成功之后，可以通过“高级”>“刷入当前的TWRP”>滑动滑块确认，把TWRP固化进boot分区，替换掉官方recovery，  
也可以通过“安装recovery ramdisk”选择保存在内置存储上的boot.img来完成其他版本的rec固化，  
固化会替换掉当前的ramdisk，所以magisk的root权限会掉，  
需要刷入magisk的zip重新root，  
或者备份当前boot之后用备份出来的boot文件重新修补root，即可实TWRP、magisk共存。  
apatch不受固化影响，安装顺序不分先后。  
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
