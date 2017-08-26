#!/system/bin/sh

setenforce 0
mount -o rw,remount rootfs /
rm -rf /su
mkdir -p /su
chmod 777 /su
su -d &
