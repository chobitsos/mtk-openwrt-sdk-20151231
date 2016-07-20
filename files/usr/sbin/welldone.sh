#!/bin/sh

if wdctl check 1>/dev/null 2>&1
then
        echo "wifidog is running" 1>/dev/null 2>&1
else
        echo "wifidog is stoped, restart."
        ps | grep wifidog | grep -v grep | grep -v wifidog-init | awk '{print $1}' | xargs kill -9
        /etc/init.d/wifidog reload
fi

if appctl check 1>/dev/null 2>&1
then
        echo "app_control is running" 1>/dev/null 2>&1
else
        echo "app_control is stoped, restart."
        ps | grep app_control | grep -v grep | awk '{print $1}' | xargs kill -9
        /etc/init.d/app_control reload
fi

