#!/bin/bash

yum update -y
yum upgrade -y

yum install docker supermin5 -y
yum clean all

alternatives --install /bin/supermin supermin /bin/supermin5 1

systemctl status docker.service
systemctl start docker.service
