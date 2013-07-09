#!/bin/bash

PKG=xserver-xorg-video-intel

mkdir $PKG
cd $PKG

apt-get source $PKG

cd $PKG-*

cat ../../patches/2.18.0/*.patch | patch -p1
dch -i
debuild

