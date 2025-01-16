#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Release name
PRODUCT_RELEASE_NAME := pipa

# 引用默认的编译配置文件，core_64_bit必须先于其他引用，否则不生效
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from elish device
$(call inherit-product, device/xiaomi/elish/device.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := elish
PRODUCT_NAME := twrp_pipa
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi Pad 6
PRODUCT_MANUFACTURER := Xiaomi

# Display
#TARGET_SCREEN_DENSITY := 360
#TARGET_SCREEN_HEIGHT := 2880
#TARGET_SCREEN_WIDTH := 1800
#TW_X_OFFSET := 180
#TW_W_OFFSET := -360
TW_FRAMERATE := 144
