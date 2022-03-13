#!/bin/bash

DATESTAMP=`date +"%Y%m%d_%H%M"`

btrfs subvolume snapshot -r /sdcard/frigate /sdcard/snapshots/frigate@$DATESTAMP
btrfs subvolume snapshot -r /sdcard/src /sdcard/snapshots/src@$DATESTAMP
