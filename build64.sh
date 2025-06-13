#!/bin/sh

mkdir build &&
cd    build &&

meson setup --prefix=/usr         \
            --buildtype=release   \
            -D tests=false        \
            -D udev=false          \
            -D valgrind=disabled  \
            .. &&

ninja

ninja  install
