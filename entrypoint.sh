#!/bin/bash

cp /opt/ssl/localhost.pem /usr/local/etc/dovecot/cert.pem
cp /opt/ssl/localhost-key.pem /usr/local/etc/dovecot/key.pem

cd /etc/dovecot-source

./autogen.sh
./configure --enable-maintainer-mode --with-ssl=openssl
make
make install

cd /usr/local/sbin
./dovecot
service dovecot start

tail -f /var/log/lastlog # TODO enable logging

# TODO PAM https://doc.dovecot.org/configuration_manual/authentication/pam/#authentication-pam
# TODO CHECK (https://noknow.info/it/os/install_dovecot_from_source)

# conf.d/10-auth.conf

# # Disable LOGIN command and all other plaintext authentications unless SSL/TLS is used.
# disable_plaintext_auth = yes
# # plaintext and login are enabled authentication mechanisms.
# auth_mechanisms = plain login
# # Include the extension file.
# !include auth-system.conf.ext




# conf.d/10-mail.conf

# # The mail location is ~/Maildir
# mail_location = maildir:~/Maildir
# # Defining namespace sections.
# namespace inbox {
#     # There can be only one INBOX
#     inbox = yes
# }
# # System user and group used to access mails.
# mail_uid = dovecot
# mail_gid = dovecot
# protocol !indexer-worker {
# }



