$(call inherit-product, device/pal/imphone/base-pre.mk)
include build/make/target/product/aosp_arm.mk
$(call inherit-product, device/pal/imphone/base.mk)

$(call inherit-product, device/pal/imphone/gapps.mk)


PRODUCT_NAME := iMOS_a64_bgN
PRODUCT_DEVICE := imos_a64_ab
PRODUCT_BRAND := pal
PRODUCT_SYSTEM_BRAND := pal
PRODUCT_MODEL := iM4

# Overwrite the inherited "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

PRODUCT_PACKAGES += 

