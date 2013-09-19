#!/bin/sh

if [ $UID -ne 0 ]; then
	echo "$0: You need to be root." >&2
	echo "Try: sudo $0" >&2
	exit 1
fi

if [ -e /System/Library/Extensions/rf2500.kext ]; then
	echo '/System/Library/Extension/rf2500.kext already exists.' >&2
	echo 'You must uninstall it before installing a new version.' >&2
	exit 1
fi

dir=`dirname "$0"`
if ! cp -r "$dir/rf2500.kext" /System/Library/Extensions; then
	echo 'Failed to install the kernel extension.' >&2
	exit 1
fi
if ! chown -R root:wheel /System/Library/Extensions/rf2500.kext; then
	echo 'Failed to set the owner of the kernel extension.' >&2
	exit 1
fi
if ! chmod -R u=rwX,og=rX /System/Library/Extensions/rf2500.kext; then
	echo 'Failed to set the permissions of the kernel extension.' >&2
	exit 1
fi
if kextutil -q /System/Library/Extensions/rf2500.kext; then
	echo 'Installed and loaded.'
else
	echo 'Kernel extension installed but not loaded.'
	echo 'Try restarting your computer to load the extension.'
fi
