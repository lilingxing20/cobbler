#!/bin/bash
#set -x

# # cp ../ks/centos7_lvm.ks /var/lib/cobbler/kickstarts/ks/centos7_lvm.ks
# # cp ../ks/centos7_parted.ks /var/lib/cobbler/kickstarts/ks/centos7_parted.ks
# # cobbler distro list
#    CentOS-7-Minimal-1511-x86_64
#    CentOS-7-Minimal-1611-x86_64
# # cobbler profile add --name centos7-mini-lvm --distro=CentOS-7-Minimal-1611-x86_64 --kickstart=/var/lib/cobbler/kickstarts/ks/centos7_lvm.ks
# # cobbler profile add --name centos7-mini-parted --distro=CentOS-7-Minimal-1611-x86_64 --kickstart=/var/lib/cobbler/kickstarts/ks/centos7_parted.ks
# # cobbler profile list
#    CentOS-7-Minimal-1511-x86_64
#    CentOS-7-Minimal-1611-x86_64
#    centos7-mini-lvm
#    centos7-mini-parted
#
# # ssh-copy-id $vbox_host
vbox_host='172.16.134.33'
profile_name='centos7-mini-parted'

while read hostname ipmi  nic1 mac1 ip1 gw1  nic2 ip2 gw2  nic3 ip3 gw3  nic4 ip4 gw4; do 
	if [[ "#" == "$hostname" ]]; then
		continue
	fi
	echo $hostname
	cobbler system add --name $hostname --profile $profile_name \
		--hostname=$hostname --interface=$nic1 --static=1 \
		--mac-address=$mac1 --ip-address=$ip1 \
		--netmask=255.255.255.0 --gateway=$gateway1 --netboot-enabled=y \
		--ksmeta="disk=sda hostname=$hostname 
		nic1=$nic1 ip1=$ip1 gw1=$gw1
		nic2=$nic2 ip2=$ip2 gw2=$gw2
		nic3=$nic3 ip3=$ip3 gw3=$gw3
		nic4=$nic4 ip4=$ip4 gw4=$gw4";
	cobbler sync;
        vm_name=$hostname
        ssh root@$vbox_host "vboxmanage  controlvm $vm_name reset"
done
