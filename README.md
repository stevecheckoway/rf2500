rf2500 Kernel Extension
=======================

This codeless kernel extension can be installed on a Mac OS X system
to enable tools such as [mspdebug][1] to reprogram a [TI MSP430
Launchpad][4].

Unlike other, similar, kernel extensions such as [ez430rf2500][3],
this extension is actually codeless (it consists of a single file
`rf2500.kext/Contents/Info.plist`) and as such does not depend on any
kernel APIs. In theory, this should make it more portable.

# Installation instructions
Run `sudo ./install.sh`

This simple install script copies rf2500.kext to
`/System/Library/Extensions`, sets the owner to `root:wheel`, sets the
permissions appropriately for a kernel extension, and loads the
extension. This means you do not need to restart your computer after
running the install script.

# Uninstallation instructions
Run `sudo ./uninstall.sh`

This even simpler uninstall script unloads the extension from the
kernel and deletes it from `/System/Library/Extensions`. There is no
need to restart your computer after running the uninstall script.

# Getting started with the TI MSP430 Launchpad
The easiest way to get started programming the Launchpad is to install
a toolchain using [MacPorts][2].

1. Download and install [MacPorts][2].
2. Install the msp430 compiler toolchain, libc, and mspdebug

        sudo port install msp430-gcc msp430-libc mspdebug

3. Compile your code using msp430-gcc and download it to the Launchpad
   using mspdebug.

# Sample code -- LED blink
The `sample` directory contains the embedded systems equivalent of
"Hello world." It blinks the two LEDs on the Launchpad. To build and
install, follow these simple steps.

1. Connect the Launchpad to your computer via the USB cable.
2. From inside the `sample` directory, run

        make
        make install

The `Makefile` provides a simple example of how to build a binary for
a particular MSP430 chip using `msp430-gcc` and how to download the
binary to the Launchpad.

[1]: http://mspdebug.sourceforge.net/
[2]: https://www.macports.org/install.php
[3]: https://github.com/colossaldynamics/ez430rf2500
[4]: http://www.ti.com/tool/msp-exp430g2
