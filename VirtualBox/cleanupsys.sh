#!/bin/bash
#set -x

while read hostname ipmi  nic1 mac1 ip1 gw1  nic2 ip2 gw2  nic3 ip3 gw3  nic4 ip4 gw4; do 
	if [[ "#" == "$hostname" ]]; then
		continue
	fi
	echo $hostname
        cobbler system remove --name $hostname
done
