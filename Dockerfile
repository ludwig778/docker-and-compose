FROM dockette/debian:stretch

ARG compose_version=1.20.1

RUN apt-get update && apt-get install -y \
  curl \
  make \
  git

RUN curl -L https://github.com/docker/compose/releases/download/${compose_version}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.03.0-ce.tgz -o /tmp/docker-18.03.0-ce.tgz && \
    tar xzvf /tmp/docker-18.03.0-ce.tgz -C /tmp/ && \
    cp /tmp/docker/* /usr/bin/ && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
