FROM sickp/alpine-sshd

MAINTAINER Amar Sood (@tekacs)

RUN apk update && \
    apk add --no-cache man mdocml-apropos python3-dev && \
    rm -f /tmp/* /etc/apk/cache/*
RUN pip3 install xonsh

RUN sed -i -e "s/bin\/ash/usr\/bin\/xonsh/" /etc/passwd
RUN passwd -d root

ENV SHELL /usr/bin/xonsh
