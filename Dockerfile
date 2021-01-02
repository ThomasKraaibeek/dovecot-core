FROM ubuntu:latest

# Oder git clone git@github.com:ThomasKraaibeek/dovecot-core.git
ADD assets/ /etc/dovecot-source/  
ADD entrypoint.sh /
ADD certs/localhost.pem /opt/ssl/localhost.pem
ADD certs/localhost-key.pem /opt/ssl/localhost-key.pem
ADD dovecot.conf /usr/local/etc/dovecot/dovecot.conf
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
RUN apt-get update && apt-get install autotools-dev autoconf wget libtool pkg-config gettext pandoc make build-essential git bison flex openssl libssl-dev dovecot-sieve dovecot-managesieved -y

RUN useradd -ms /bin/bash dovecot || echo "user already exists"
RUN useradd -ms /bin/bash dovenull || echo "user already exists"
RUN useradd --create-home -s /sbin/nologin admin || echo "user already exists"
RUN echo 'admin:pass' | chpasswd

CMD [ "/bin/bash", "entrypoint.sh"]
#RUN service dovecot restart
