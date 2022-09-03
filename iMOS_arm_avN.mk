$(call inherit-product, device/pal/imphone/base-pre.mk)
include build/make/target/product/aosp_arm.mk
$(call inherit-product, device/pal/imphone/base.mk)
$(call inherit-product, device/pal/imphone/base-sas.mk)



PRODUCT_NAME := iMOS_arm_avN
PRODUCT_DEVICE := imos_arm_a
PRODUCT_BRAND := pal
PRODUCT_SYSTEM_BRAND := pal
PRODUCT_MODEL := iMPhone V1 

# Overwrite the inherited "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

PRODUCT_PACKAGES += 

