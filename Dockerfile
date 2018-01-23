FROM centos:centos7
MAINTAINER Guilherme Viebig <viebig@gmail.com>

RUN \
  yum update -y && \
  yum install -y epel-release && \
  yum install -y iproute python-setuptools hostname inotify-tools initscripts yum-utils which jq perl && \
  yum clean all && \
  easy_install supervisor

WORKDIR /root
ADD . . 
RUN rpm -ivh /root/PMTA/PowerMTA-4.5.rpm

COPY PMTA/license /etc/pmta
VOLUME ["/etc/pmta"]
CMD ["/usr/bin/supervisord", "-c", "/root/config/supervisord.conf"]