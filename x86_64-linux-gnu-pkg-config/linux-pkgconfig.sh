#!/bin/sh

# Derived from http://www.mega-nerd.com/erikd/Blog/CodeHacking/MinGWCross/pkg-config.html
# This file has no copyright assigned and is placed in the Public Domain.

export PKG_CONFIG_LIBDIR=/usr/@TRIPLE@/lib/pkgconfig:/usr/@TRIPLE@/share/pkgconfig
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH_CUSTOM}:${PKG_CONFIG_LIBDIR}

exec pkg-config "$@"
