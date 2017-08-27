#!/bin/bash

while read -r pkg; do
	pkg=`echo $pkg | sed 's/package://'`
	echo Disabling $pkg
	adb shell pm disable $pkg
done < disabled.txt
