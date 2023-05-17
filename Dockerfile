FROM  ubuntu:latest
MAINTAINER joseangarcia3@gmail.com

#RUN cd /etc/yum.repos.d/
#RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
#RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
#RUN yum -y install java
#CMD /bin/bash

RUN systemctl daemon-reload
RUN systemctl restart docker

RUN "sh" "-c" "echo nameserver 8.8.8.8 >> /etc/resolv.conf"
RUN apt-get update && apt-get install -y apache2 \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
