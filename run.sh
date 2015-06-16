#!/bin/bash -v

WORK_DIR=$PWD/wd

IMG_NAME=centos71
IMG_ARCH=$IMG_NAME.tar
USR_NAME=antik486

mkdir -p $WORK_DIR && cd $_

supermin --prepare yum -o supermin.d
supermin --build --format chroot supermin.d -o appliance.d

cd appliance.d
mv usr/share/locale/en usr/share/locale/en_US tmp
rm -rf usr/share/locale/*
mv tmp/en tmp/en_US usr/share/locale/
mv usr/share/i18n/locales/en_US tmp
rm -rf usr/share/i18n/locales/*
mv tmp/en_US usr/share/i18n/locales/
echo 7 > etc/yum/vars/releasever
cd ..

tar --numeric-owner -cpf $IMG_ARCH -C appliance.d .
cat $IMG_ARCH | docker import - $USR_NAME/$IMG_NAME
