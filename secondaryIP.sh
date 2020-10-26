#!/bin/bash
last2mac=$(cat /sys/class/net/eth0/address | cut -c 16-)
mac_converted=$((0x$last2mac))
sudo sed -i '/exit 0/i sleep 60' /etc/rc.local
sudo sed -i '/^exit 0/i sudo ip addr add 192.168.1.'$mac_converted'\/30 dev eth0' /etc/rc.local
echo 'A secondary IP address of 192.168.1.'$mac_converted'/30 has been added to this device'

