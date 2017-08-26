#!/bin/bash
adb remount
adb push init.sec.boot.sh /etc/
adb push launch.tinysu.sh /etc/
adb shell chmod 0700 /system/etc/launch.tinysu.sh
adb shell chcon u:object_r:su_exec:s0 /system/etc/launch.tinysu.sh
