#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor

# Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Rootdir
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.crda.sh \
    init.mdm.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.chg_policy.sh \
    init.qti.dcvs.sh \
    init.qti.media.sh \
    init.qti.qcv.sh \
    qca6234-service.sh

PRODUCT_PACKAGES += \
    fstab.default \
    init.drstrange.rc \
    init.hq.dfx.common.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.qti.ufs.rc \
    init.target.rc \
    init.recovery.qcom.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.default:$(TARGET_COPY_OUT_RAMDISK)/fstab.default

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29
