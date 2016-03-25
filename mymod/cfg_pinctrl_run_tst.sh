#!/bin/sh

#Usage: devmem ADDRESS [WIDTH [VALUE]]

#Read/write from physical address

#        ADDRESS Address to act upon
#        WIDTH   Width (8/16/...)
#        VALUE   Data to be written

#take SPI0 out of reset
devmem 0xf7030334 32 0x200

#wait until dev out of reset
readval=0
out=1
until [ $out -eq 0 ]; do
	readval="$(devmem 0xf7030338 32)"
	let "out = $readval & 0x200"
done
echo "SPI0 out of reset"

#enable clk
devmem 0xf7030230 32 0x200

#cfg gpio6_0-3 s nopull
devmem 0xf70109b0 32 0
devmem 0xf70109b4 32 0
devmem 0xf70109b8 32 0
devmem 0xf70109bc 32 0

#cfg gpio6_0-3 s spi cep for 2 (cs) as gpio
devmem 0xf70101a0 32 1
devmem 0xf70101a4 32 1
devmem 0xf70101a8 32 0 
devmem 0xf70101ac 32 1

#cfg gpio2_2 s nopull
devmem 0xf7010938 32 0

#cfg gpio2_2 s gpio
devmem 0xf7010128 32 0

#cfg gpio2_2 dir
var="$(devmem 0xf8013400 32)"
echo "gpio2_2bf=$var"
#set bit 2
let "var |= 4"
printf gpio2_2af=0x%x $var
echo
devmem 0xf8013400 32 $var

#cfg sspcr0 - 0x3b07 #speed10k
#cfg sspcr0 - 0x107 #speek500k
let "var = 59<<8"
let "var |= 7"
printf out=0x%X $var
echo
devmem 0xf7106000 32 $var

#cfg sspcr1
devmem 0xf7106004 32 0

#cfg sspcpsr
devmem 0xf7106010 32 250 #speed10k
devmem 0xf7106010 32 150 #speek500k

#cfg gpio6_2 dir
var="$(devmem 0xf7022400 32)"
echo "$var" 
#set bit 2
let "var |= 4"
printf gpio62=0x%X $var
echo 
devmem 0xf7022400 32 $var

#force cs hi
devmem 0xf7022010 32 4

#flush fifo
readval=0
out=1
out2=1
until [ $out -eq 0 ]; do
	while [[ $out2 != 0 ]]; do
        	readval="$(devmem 0xf710600c 32)"
        	let "out2 = $readval & 4"
		echo "$(devmem 0xf7106008 32)"
	done
	readval="$(devmem 0xf710600c 32)"
	let "out = $readval & 16"
done
echo "fifo flushed"

#enable ssp
devmem 0xf7106004 32 2

# for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20; do spidev_test -D /dev/spidev0.0 -p "\x01\x80\x00"; sleep 1; done
# for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20; do spidev_test -D /dev/spidev0.0 -p "\xf5\x00"; sleep 1; done

ledon="RX | FF"
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 
do
	var="$(spidev_test -D /dev/spidev0.0 -p "\x01\x80\x00")"
	echo
	echo "loop $i"
	echo "$var"
	if test "${var#*$ledon}" != "$var"
	then
		devmem 0xf8013010 32 4
		echo "led on"
	else
		devmem 0xf8013010 32 0
		echo "led off"
	fi
	sleep 1
done
