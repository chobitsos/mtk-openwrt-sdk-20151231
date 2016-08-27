#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/APP04
        NAME:=JARXI APP04
        PACKAGES:=\
                kmod-usb-core kmod-usb2 kmod-usb-ohci \
                kmod-ledtrig-usbdev
endef

define Profile/APP04/Description
	Package set compatible with the JARXI APP04.
endef
$(eval $(call Profile,APP04))

