#!/usr/bin/env bash
# mostly centos7

# python3 version
PYTHON_VERSION="3.6.8"

# install basic
yum install -y gcc make zlib-dev openssl-devel sqlite-devel bzip2-devel epel-release

# install python3
curl -SLO https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz \
  && tar xvf Python-${PYTHON_VERSION}.tgz \
  && cd Python-${PYTHON_VERSION} \
  && ./configure --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -rf Python-${PYTHON_VERSION}* \
  && yum install -y python3-pip python3-dev \
  && yum clean all

# check version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" \
  && echo -n "[+] Python2 version: " && python -V && echo "" \
  && echo -n "[+] Python3 version: " && python3 -V && echo "" \
  && echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

# install finished
