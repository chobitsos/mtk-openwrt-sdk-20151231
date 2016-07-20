#!/bin/sh

#killall -9 dnsmasq

uci set wifidog.@wifidog[0].wifidog_enable=0
killall -9 wifidog

uci set wireless.mt7620.radio=0
ifconfig ra0 down

echo 0 > /tmp/device_auth

