echo This is TinySU root install for SM-G530U
echo This script supports both Windows and bash install.

adb remount

echo Cleaning up Knox thingies
adb shell rm -r /system/priv-app/SmartManager_v5_DeviceSecurity
adb shell rm -r /system/priv-app/Chameleon
adb shell rm -r /system/app/KnoxAppsUpdateAgent
adb shell rm -r /system/app/KnoxAttestationAgent 
adb shell rm -r /system/app/KnoxFolderContainer2
adb shell rm -r /system/app/KnoxRemoteContentsProvider
adb shell rm -r /system/app/KnoxSetupWizardClient 
adb shell rm -r /system/app/KnoxSwitcher
adb shell rm -r /system/app/BBCAgent
adb shell rm -r /system/app/SecurityLogAgent
adb shell rm -r /system/app/UniversalMDMClient

echo Fixing fingerprint for eng kernel 
adb push fingerprint-fix/lib/libbauthserver.so /system/lib/
adb push fingerprint-fix/lib/libbauthtzcommon.so /system/lib/
adb push fingerprint-fix/lib64/libbauthserver.so /system/lib64/
adb push fingerprint-fix/lib64/libbauthtzcommon.so /system/lib64/

echo Installing TinySU
adb push init.sec.boot.sh /etc/
adb push launch.tinysu.sh /etc/
adb shell chmod 0700 /system/etc/launch.tinysu.sh
adb shell chcon u:object_r:su_exec:s0 /system/etc/launch.tinysu.sh
adb push tinysu /system/bin/su
adb shell chcon u:object_r:su_exec:s0 /system/bin/su
adb install -r TinySU-v0.2.apk

echo Rebooting
adb shell reboot
