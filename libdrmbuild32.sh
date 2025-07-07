#!/bin/sh


cd    build &&
rm -rf * &&
CC="gcc -m32" CXX="g++ -m32"         \
PKG_CONFIG_PATH=/usr/lib32/pkgconfig \
meson setup --prefix=/usr            \
            --buildtype=release      \
            --libdir=/usr/lib32      \
            -D tests=false           \
            -D udev=false             \
            -D valgrind=disabled     \
            .. &&

ninja

DESTDIR=$PWD/DESTDIR ninja install                     &&
cp -vr DESTDIR/usr/lib32/* /usr/lib32                  &&
rm -rf DESTDIR                                         &&
ldconfig
