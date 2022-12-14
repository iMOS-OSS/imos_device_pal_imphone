#!/bin/bash

rom_script=''
if [ -n "$1" ];then
	if echo "$1" | grep -qF /;then
        rom_script=''
        for i in "$@";do
            rom_script="$rom_script"$'\n''$(call inherit-product, '$i')'
        done
    else
		rom_script='$(call inherit-product, device/pal/imphone/'$1'.mk)'
	fi
fi

echo 'PRODUCT_MAKEFILES := \' > AndroidProducts.mk

for part in a ab;do
	for apps in gapps;do
		for arch in arm64 arm a64;do
			for su in yes no;do
				apps_suffix=""
				apps_script=""
				apps_name=""
				extra_packages=""
                vndk="vndk.mk"
		optional_base=""
        if [ "$apps" == "gapps" ];then
					apps_suffix="g"
					apps_script='$(call inherit-product, device/pal/imphone/gapps.mk)'
				fi
				if [ "$arch" == "arm" ];then
					vndk="vndk-binder32.mk"
				fi
				if [ "$arch" == "a64" ];then
					vndk="vndk32.mk"
				fi

				su_suffix='N'
				if [ "$su" == "yes" ];then
					su_suffix='S'
					extra_packages+=' phh-su me.phh.superuser'
				fi

				part_suffix='a'
				if [ "$part" == 'ab' ];then
					part_suffix='b'
				else
					optional_base='$(call inherit-product, device/pal/imphone/base-sas.mk)'
				fi

				target="iMOS_${arch}_${part_suffix}${apps_suffix}${su_suffix}"

				baseArch="$arch"
				if [ "$arch" = "a64" ];then
					baseArch="arm"
				fi

				zygote=32
				if [ "$arch" = "arm64" ];then
					zygote=64_32
				fi

				cat > ${target}.mk << EOF
\$(call inherit-product, device/pal/imphone/base-pre.mk)
include build/make/target/product/aosp_${baseArch}.mk
\$(call inherit-product, device/pal/imphone/base.mk)
$optional_base
$apps_script
$rom_script

PRODUCT_NAME := $target
PRODUCT_DEVICE := imos_${arch}_$part
PRODUCT_BRAND := pal
PRODUCT_SYSTEM_BRAND := pal
PRODUCT_MODEL := iM4

# Overwrite the inherited "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

PRODUCT_PACKAGES += $extra_packages

EOF
echo -e '\t$(LOCAL_DIR)/'$target.mk '\' >> AndroidProducts.mk
			done
		done
	done
done
echo >> AndroidProducts.mk
