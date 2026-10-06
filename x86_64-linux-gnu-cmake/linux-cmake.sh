#!/bin/bash

if test "$1" = "--system-information"
then
  cmake "$@"
else

. /usr/bin/@TRIPLE@-env

xlg_prefix=/usr/@TRIPLE@

PATH=${xlg_prefix}/bin:$PATH cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=${xlg_prefix} \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_TOOLCHAIN_FILE=/usr/share/@TRIPLE@/toolchain-@TRIPLE@.cmake \
    "$@"

fi
