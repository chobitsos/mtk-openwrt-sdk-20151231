#!/bin/sh

netstate=`cat /tmp/netstate`
baidu_ip='119.75.217.109'
dns_ip='114.114.114.114'
reach=0

set_dns()
{
    if [ $reach -eq 0 ]; then
	    if [ "$netstate" != "0" ]; then
		    echo "address=/#/$baidu_ip" >> /etc/dnsmasq.conf
		    echo "0" > /tmp/netstate
		    killall -9 dnsmasq
		    sleep 2
		    /usr/sbin/dnsmasq -C /var/etc/dnsmasq.conf -k &
	    fi
    else
	    if [ "$netstate" != "1" ]; then
		    echo "" > /etc/dnsmasq.conf
		    echo "1" > /tmp/netstate
		    killall -9 dnsmasq
		    sleep 2
		    /usr/sbin/dnsmasq -C /var/etc/dnsmasq.conf -k &
	    fi
    fi
}

ping -c 2 -W 2 $baidu_ip > /dev/null 2>&1
if [ $? -eq 0 ]; then
    reach=1
    set_dns
    exit 0
fi

ping -c 2 -W 2 $dns_ip > /dev/null 2>&1
if [ $? -eq 0 ]; then
    reach=1
    set_dns
    exit 0
fi

set_dns
exit 0

