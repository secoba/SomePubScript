#!/usr/bin/env bash
# mostly centos7

# install basic
yum install -y gcc make zlib-dev openssl-devel sqlite-devel bzip2-devel epel-release

# install redis-stable
curl -SLO http://download.redis.io/redis-stable.tar.gz \
    && tar -xvzf redis-stable.tar.gz \
    && mv redis-stable/ redis \
    && rm -f redis-stable.tar.gz \
    && cd redis \
    && make \
    && make install \
    && mkdir -p /var/log/redis \
    && mv redis.conf /etc/redis.conf \
    && yum clean all

# check version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" \
  && echo -n "[+] redis version: " && redis-server --version \
  && echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

# install finished
