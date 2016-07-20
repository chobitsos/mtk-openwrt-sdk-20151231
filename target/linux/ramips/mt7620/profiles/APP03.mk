#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/APP03
        NAME:=JARXI APP03
        PACKAGES:=\
                kmod-usb-core kmod-usb2 kmod-usb-ohci \
                kmod-ledtrig-usbdev
endef

define Profile/APP03/Description
	Package set compatible with the JARXI APP03.
endef
$(eval $(call Profile,APP03))

