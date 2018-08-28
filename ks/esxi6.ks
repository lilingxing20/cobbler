# accept the vmware End User License Agreement
vmaccepteula
# rootpw --iscrypted $default_password_crypted
rootpw password01!
clearpart --firstdisk=remote  --overwritevmfs
# install --disk=/vmfs/devices/disks/naa.600605b00caae7f0207e50e909f8f2f8  --overwritevmfs
install --firstdisk --overwritevmfs
network --bootproto=static  --device=vmnic1 --ip=172.30.126.28 --gateway=172.30.126.254 --nameserver=172.16.180.1 --netmask=255.255.255.0  --hostname=esxi28
reboot --noeject

# %pre
# $SNIPPET('kickstart_start')
# $SNIPPET('pre_install_network_config')
# %end
# 
# %post
# $SNIPPET('post_install_network_config')
# $SNIPPET('kickstart_done')
# %end
