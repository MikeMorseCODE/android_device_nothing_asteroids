#
# SPDX-FileCopyrightText: The Paranoid Android Project
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Device
$(call inherit-product, device/nothing/asteroids/device.mk)

# AOSPA
$(call inherit-product, vendor/aospa/config/aospa.mk)

PRODUCT_DEVICE := asteroids
PRODUCT_NAME := aospa_asteroids
PRODUCT_BRAND := nothing
PRODUCT_MODEL := A059P
PRODUCT_MANUFACTURER := Nothing

PRODUCT_GMS_CLIENTID_BASE := android-nothing

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="asteroids-user 15 AP3A.241005.015 2604141749 release-keys" \
    BuildFingerprint=nothing/asteroids/asteroids:15/AP3A.241005.015/2604141749:user/release-keys
