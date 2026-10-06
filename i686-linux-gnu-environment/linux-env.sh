#!/bin/sh

default_cppflags="-D_FORTIFY_SOURCE=3 -D_GLIBCXX_ASSERTIONS"
default_cflags="$default_cppflags -O2 -pipe -fexceptions -Wformat -Werror=format-security -fstack-protector-strong -fcf-protection"
default_ldflags="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"

export CPPFLAGS="${XLG_CPPFLAGS:-$default_cppflags $CPPFLAGS}"
export CFLAGS="${XLG_CFLAGS:-$default_cflags $CFLAGS}"
export CXXFLAGS="${XLG_CXXFLAGS:-$default_cflags $CXXFLAGS}"
export LDFLAGS="${XLG_LDFLAGS:-$default_ldflags $LDFLAGS}"

export CC="${XLG_CC:-@TRIPLE@-gcc}"
export CXX="${XLG_CXX:-@TRIPLE@-g++}"
export AR="@TRIPLE@-ar"
export RANLIB="@TRIPLE@-ranlib"
export STRIP="@TRIPLE@-strip"

xlg_prefix=/usr/@TRIPLE@
export PKG_CONFIG_SYSROOT_DIR=""
export PKG_CONFIG_LIBDIR="${xlg_prefix}/lib/pkgconfig:${xlg_prefix}/share/pkgconfig"
