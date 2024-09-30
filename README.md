# x86_64 Toolchain for Arch GNU/Linux ARM64

Installation order:

1. x86_64-linux-gnu-linux-api-headers
2. x86_64-linux-gnu-binutils

Build and install above two packages. Before building gcc, we need some
intermediary packages to build gcc.

1. x86_64-linux-gnu-gcc-stage1
2. x86_64-linux-gnu-glibc-headers -> needs stage1

Build and install above two packages. Now we can build stage2. After installing
gcc-stage2 we can now build glibc. But when installing gcc-stage2, gcc-stage1
must be uninstalled.

1. x86_64-linux-gnu-gcc-stage2

Before installing x86_64-linux-gnu-glibc you should uninstall
x86_64-linux-gnu-glibc-headers.

1. x86_64-linux-gnu-glibc -> needs gcc-stage2 to build
2. x86_64-linux-gnu-gcc -> remove gcc-stage2 before installing
3. x86_64-linux-gnu-gdb

## Optional

I need openssl-1.1 for some packages. To build openssl we first need zlib.
Build and install zlib, then build and install openssl-1.1

1. x86_64-linux-gnu-zlib
2. x86_64-linux-gnu-openssl-1.1

## Run x86_64 Binaries on Arch GNU/Linux ARM64 using QEMU

```txt
qemu-x86_64 /usr/x86_64-linux-gnu/lib/ld-linux-x86-64.so.2 --library-path /usr/x86_64-linux-gnu:/usr/x86_64-linux-gnu/lib  ./my_binary
```

## Resources

* [Archlinux AUR - arm-linux-gnueabihf-* packages][01]
* [Stackoverflow - How to solve "error while loading shared libraries" Thread][02]
* [Cross Compile openssl for ARM][03]

## Author

BlueDeviL // SCT

## License

AGPLv3

[01]: https://aur.archlinux.org/packages?O=0&K=arm-linux-gnueabihf
[02]: https://stackoverflow.com/a/37281595
[03]: https://medium.com/@everythingismindgame/cross-compile-openssl-for-arm-f138f71486fa
