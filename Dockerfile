FROM ubuntu:latest

# Oder git clone git@github.com:ThomasKraaibeek/dovecot-core.git
ADD assets/ /etc/dovecot-source/  
ADD entrypoint.sh /
ADD dovecot.conf /usr/local/etc/dovecot
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
RUN apt-get update && apt-get install autotools-dev autoconf wget libtool pkg-config gettext pandoc make build-essential git bison flex -y

CMD [ "/bin/bash", "entrypoint.sh"]
#RUN service dovecot restart
