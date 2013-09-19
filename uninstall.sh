#!/bin/sh

if [ $UID -ne 0 ]; then
	echo "$0: You need to be root." >&2
	echo "Try: sudo $0" >&2
	exit 1
fi

if [ ! -e /System/Library/Extensions/rf2500.kext ]; then
	echo 'rf2500.kext is not installed; nothing to do.'
	exit 0
fi

kextunload -q /System/Library/Extensions/rf2500.kext
if ! rm -rf /System/Library/Extensions/rf2500.kext; then
	echo 'Failed to remove /System/Library/Extensions/rf2500.kext' >&2
	exit 1
fi
echo 'Uninstalled.'
