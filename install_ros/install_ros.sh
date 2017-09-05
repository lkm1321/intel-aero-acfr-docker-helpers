#!/bin/bash

for entry in $(cat install_order.txt); do
	echo Installing $entry
	pacaur -S -a --noconfirm --noedit --needed $entry 
done
