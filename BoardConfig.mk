#
# Copyright 2014 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Use the non-open-source parts, if they're present
-include vendor/asus/a400cg/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
TARGET_CPU_ABI := x86
TARGET_CPU_VARIANT := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
TARGET_CPU_SMP := true
TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := EeePad

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1782579200 # 1.7GByte
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 # MByte
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 # MByte
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

BOARD_KERNEL_BASE := 0x11000000
BOARD_KERNEL_PAGESIZE := 2048
cmdline_extra  := kmemleak=off androidboot.bootmedia=sdcard androidboot.hardware=redhookbay
cmdline_extra1 := ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on vmalloc=384M androidboot.wakesrc=06 androidboot.mode=main loglevel=0
cmdline_extra2 := watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789
cmdline_extra3 := androidboot.selinux=enforcing ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on vmalloc=384M
cmdline_extra4 := androidboot.selinux=permissive build_version=3 bootboost=1 androidboot.wakesrc=06 androidboot.mode=main
BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=logk0 earlyprintk=nologger $(cmdline_extra)  $(cmdline_extra1) $(cmdline_extra2) $(cmdline_extra3) $(cmdline_extra4)

# Wifi
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER        := NL80211
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcmdhd.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/asus/a400cg/bluetooth