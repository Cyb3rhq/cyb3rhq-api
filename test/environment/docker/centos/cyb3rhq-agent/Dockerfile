FROM centos:latest

RUN yum install which -y

RUN rpm --import http://packages.wazuh.com/key/GPG-KEY-CYB3RHQ
COPY cyb3rhq-repository.txt /etc/yum.repos.d/cyb3rhq.repo

RUN yum install cyb3rhq-agent -y

COPY entrypoint.sh /scripts/entrypoint.sh
