#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
# cdrom
# Use network installation
url --url=$tree
# Use graphical install
graphical
# Run the Setup Agent on first boot
# firstboot --enable
firstboot --disable
ignoredisk --only-use=$disk
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8 --addsupport=zh_CN.UTF-8

# Network information
# network  --bootproto=static --device=enp0s3 --gateway=10.200.0.1 --ip=10.200.0.7 --nameserver=114.114.114.114 --netmask=255.255.255.0 --ipv6=auto --activate
# network  --bootproto=dhcp --device=enp0s8  --ipv6=auto --activate
# network  --bootproto=dhcp --device=enp0s9 --onboot=off --ipv6=auto
# network  --bootproto=static --device=enp0s10 --gateway=10.0.0.1 --ip=192.168.0.10 --netmask=255.255.255.0 --ipv6=auto --activate
network  --bootproto=static --device=$nic1 --gateway=$gw1 --ip=$ip1 --netmask=255.255.255.0 --ipv6=auto --activate
network  --bootproto=static --device=$nic2 --gateway=$gw2 --ip=$ip2 --netmask=255.255.255.0 --ipv6=auto --activate
network  --bootproto=static --device=$nic3 --gateway=$gw3 --ip=$ip3 --netmask=255.255.255.0 --ipv6=auto --activate
network  --bootproto=static --device=$nic4 --gateway=$gw4 --ip=$ip4 --netmask=255.255.255.0 --ipv6=auto --activate
network  --nameserver=114.114.114.114
network  --hostname=$hostname

# Root password 123456
#  by openssl passwd -1 or python -c 'import crypt; print(crypt.crypt("MyPassword"))'
# rootpw --iscrypted $6$qFpo5Mosja1IrZoJ$sgsSDXZrA7VHUiIgMNG9kVmTTn22wAPcW/ENvEDVuxwCN/9JnpgfHp51/UJtwsxMonkBY1tZZxJrCNx48mmB9.
rootpw --iscrypted $default_password_crypted
# System services
services --disabled="chronyd"
# System timezone
timezone Asia/Shanghai --isUtc --nontp
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=$disk
# Partition clearing information
clearpart --all --initlabel --drives=$disk
# Disk partitioning information
autopart --type=lvm
# Reboot after installation
reboot

%packages
@^minimal
@core
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end
