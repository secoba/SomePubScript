#!/usr/bin/env bash
# mostly centos7

# mongo version
MONGODB_VERSION="4.2"

# install basic
yum install -y gcc make zlib-dev openssl-devel sqlite-devel bzip2-devel epel-release

# install mongodb
echo -e "\
[mongodb]\n\
name=MongoDB Repository\n\
baseurl=https://repo.mongodb.org/yum/redhat/7Server/mongodb-org/${MONGODB_VERSION}/x86_64/\n\
gpgcheck=0\n\
enabled=1\n" > /etc/yum.repos.d/mongodb.repo \
    && yum update -y && yum install -y mongodb-org \
    && mkdir -p /data/mongodb /var/log/mongodb /var/run/mongodb \
    && yum clean all

# check version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" \
  && echo -n "[+] mongodb version: " && /usr/bin/mongod --version \
  && echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

# install finished
