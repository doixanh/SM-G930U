#!/system/bin/sh

setenforce 0
mount -o rw,remount rootfs /
mkdir /su
chmod 777 /su
su -d &
