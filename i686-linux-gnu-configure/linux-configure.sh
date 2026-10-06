#!/bin/bash

. /usr/bin/@TRIPLE@-env

for last; do true; done
if test -x "${last}/configure"; then
  config_path="$last"
else
  config_path=".."
fi

${config_path}/configure \
  --build="${CHOST:-$(uname -m)-unknown-linux-gnu}" --host=@TRIPLE@ \
  --prefix=/usr/@TRIPLE@ --libdir=/usr/@TRIPLE@/lib --includedir=/usr/@TRIPLE@/include \
  --enable-shared --enable-static "$@"
