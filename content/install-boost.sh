#!/bin/sh

set -eux

BOOST_VERSION=1.70.0
VARIANTS='exe exe_gc_hardened shlib'

function install_boost() (
  set -ex

  local VARIANT="$1"
  local PREFIX="/hbb_$VARIANT"

  echo "Installing boost $BOOST_VERSION static libraries: $VARIANT ..."

  cd /tmp

  tar xjf boost_*.tar.bz2

  cd boost_*

  source "$PREFIX/activate"

  export CFLAGS="$STATICLIB_CFLAGS"
  export CXXFLAGS="$STATICLIB_CXXFLAGS"

  ./bootstrap.sh --prefix="$PREFIX"

  ./b2 variant=release link=static cflags="$CFLAGS" cxxflags="$CXXFLAGS" linkflags="$LDFLAGS" install

  cd /tmp

  rm -rf boost_*/
)


cd /tmp

curl --fail -L -O https://dl.bintray.com/boostorg/release/$BOOST_VERSION/source/boost_`echo $BOOST_VERSION | tr . _`.tar.bz2

for VARIANT in $VARIANTS; do
  install_boost $VARIANT
done

cd /tmp

rm -rf boost_*
