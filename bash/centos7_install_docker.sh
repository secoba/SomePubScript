#!/usr/bin/env bash
# https://www.cnblogs.com/yufeng218/p/8370670.html

# update
yum update

# remove old version
yum remove docker  docker-common docker-selinux docker-engine

# install requirement
yum install -y yum-utils device-mapper-persistent-data lvm2

# add source
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# list all docker version
yum list docker-ce --showduplicates | sort -r

# install stable version
yum install docker-ce

# install other version
# yum install <FQPN>  # 例如：sudo yum install docker-ce-17.12.0.ce

# enable startup
systemctl start docker
systemctl enable docker

# verify docker version
docker version

# install finished
