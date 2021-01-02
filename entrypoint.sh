#!/bin/bash

cp /opt/ssl/localhost.pem /usr/local/etc/dovecot/cert.pem
cp /opt/ssl/localhost-key.pem /usr/local/etc/dovecot/key.pem

cd /etc/dovecot-source

./autogen.sh
./configure --enable-maintainer-mode --with-ssl=openssl
make
make install

cd /srv
chmod 777 . 

cd /usr/local/sbin
./dovecot
service dovecot start

tail -f /var/log/dovecot.log 

# TODO PAM https://doc.dovecot.org/configuration_manual/authentication/pam/#authentication-pam
# TODO CHECK (https://noknow.info/it/os/install_dovecot_from_source)

