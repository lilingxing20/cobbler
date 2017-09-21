#!/bin/bash
#set -x

while read hostname ipmi  interface1 mac1 ip1 gateway1  interface2 ip2 gateway2  interface3 ip3 gateway3  interface4 ip4 gateway4; do 
    if [[ "#" == "$hostname" ]]; then
        continue
    fi
    echo $hostname
    ipmitool -I lanplus -H $ipmi -U USERID -P PASSW0RD chassis bootdev pxe;
    ipmitool -I lanplus -H $ipmi -U USERID -P PASSW0RD power reset;
done
