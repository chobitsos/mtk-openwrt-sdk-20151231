#!/bin/sh

id=`cat /sys/devices/virtual/net/eth0/address|tr a-z A-Z|sed -e 's#:##g'`
sign=`dd bs=1 skip=256 count=13 if=/dev/mtd1 | hexdump -C | cut -c 10-49 | sed 's/ //g'`

# check device id
check_device()
{
	echo 'check device'
    device_auth -s $sign -d $id
}

# check mac
check_mac()
{
	echo 'check mac'
    # mac_start = 1; mac_end = 2; if (id < mac_start || id > mac_end) { do device_deny.sh; }
}

# check settings
check_settings()
{
	echo 'check settings'
    admLogin=`nvram_get 2860 Login`
    if [ "$admLogin" != "jarxi" ]; then
        ralink_init clear 2860
        reboot
    fi
}

check_date()
{
	echo 'check date'
}

# some setings is allow change. following check did not need to do every boot
check_authed()
{
	echo 'check authed'
    check=`nvram_get 2860 device_checkd`
    if [ "$check" = "1" ]; then
        echo "------ ok jarxi ------"
        exit 0
    fi
}

# check hostname
check_hostname()
{
	echo 'check hostname'
    #name-set.sh
}

# all check ok, mark
mark_authed()
{
	echo 'mark authed'
    nvram_set device_checkd 1
}

auth_device()
{
    check_device
    check_mac
    #check_settings
    check_date
    #check_authed
    #check_hostname
    #mark_authed
}

auth_device
