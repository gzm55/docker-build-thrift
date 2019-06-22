#!/bin/sh

set -eux

echo Installing bison from srouce ...

cd /tmp

curl --fail -L -O https://ftp.gnu.org/gnu/bison/bison-3.4.1.tar.gz

tar xzf bison-*.tar.gz

cd bison-*/

./configure

make

make install

cd /tmp

rm -rf bison-*
