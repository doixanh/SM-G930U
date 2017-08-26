#!/system/bin/sh

setenforce 0

me=`id`
log -p i -t TinySUStart "I am $me"

log -p i -t TinySUStart "remounting /"
mount -o rw,remount rootfs /
me=$?
log -p i -t TinySUStart "mount returned $me"

log -p i -t TinySUStart "creating /su"
mkdir /su
me=$?
log -p i -t TinySUStart "mkdir returned $me"

ls -la | while read -r line; do
        log -p i -t TinySUStart "$line"
done

mount | grep rootfs | while read -r line; do
        log -p i -t TinySUStart "Mounted $line"
done

