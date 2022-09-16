$(call inherit-product, device/pal/imphone/base-pre.mk)
include build/make/target/product/aosp_arm64.mk
$(call inherit-product, device/pal/imphone/base.mk)
$(call inherit-product, device/pal/imphone/base-sas.mk)
$(call inherit-product, device/pal/imphone/gapps.mk)


PRODUCT_NAME := iMOS_arm64_agS
PRODUCT_DEVICE := imos_arm64_a
PRODUCT_BRAND := pal
PRODUCT_SYSTEM_BRAND := pal
PRODUCT_MODEL := iM4

# Overwrite the inherited "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

PRODUCT_PACKAGES +=  phh-su me.phh.superuser

