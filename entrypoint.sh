#!/bin/bash

cd /etc/dovecot-source

./autogen.sh
./configure --enable-maintainer-mode
make
make install

cd /usr/local/sbin
./dovecot