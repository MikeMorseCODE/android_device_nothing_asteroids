#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from qssi_64 device
$(call inherit-product, device/qualcomm/qssi_64/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := qssi_64
PRODUCT_NAME := lineage_qssi_64
PRODUCT_BRAND := qti
PRODUCT_MODEL := qssi system image for arm64
PRODUCT_MANUFACTURER := qualcomm

PRODUCT_GMS_CLIENTID_BASE := android-nothing

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="qssi_64-user 16 BQ2A.250721.001-BP2A.250605.031.A3 2604141749 release-keys" \
    BuildFingerprint=qti/qssi_64/qssi_64:16/BQ2A.250721.001-BP2A.250605.031.A3/2604141749:user/release-keys
