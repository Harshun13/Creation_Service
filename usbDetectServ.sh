#!/bin/bash
if [ "`lsblk -o name | grep sdb1`" ] #check if a device is connected to the given address "sdb1" 
#if the address is change use the command " sudo fdisk -l " to know the address
then
#code to play a music if usb is detect
{	
	echo -e "\a"
	notify-send "USB Inserted"
	sleep 3s # sleep for 3 second so that there is no interference between the 2 music
}
{
	sudo mkdir /media/MyDriv  	# create the place where to mount the device  
	sudo mount -rw /dev/sdb1 /media/MyDriv  #mount the device with permission to read and write
	cd /media/MyDriv  #enter the device 
	for i in $(seq 0 0)
	do
	{ 
        	echo "[$(date +%H-%M)] here is a log message" >> messages.txt  #write the date on a text m essage on the device 
	}
	done
	echo -e "\a" 
	sudo umount -l /media/MyDriv	# unmount the device
	notify-send "Unmount sucessful"
}
else 
	echo "drive not found"
fi


