FROM centos:6

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6

COPY php-5.2.17_el6.x86_64.tar.gz /tmp
RUN tar xf /tmp/php-5.2.17_el6.x86_64.tar.gz -C /usr/local && rm -f /tmp/php-5.2.17_el6.x86_64.tar.gz
COPY etc/init.d/php-fpm /etc/init.d/php-fpm
RUN useradd --home-dir /usr/local/php-5.2.17/var/lib/php --create-home --user-group --shell /sbin/nologin --comment "PHP-FPM User" php

RUN yum install -y epel-release \
    && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6 \
    && yum install -y libmcrypt freetype mhash mysql-libs libtool-ltdl libpng gd libjpeg-turbo

RUN yum clean all

COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod -R 777 /usr/local/bin/docker-entrypoint.sh /etc/init.d/php-fpm

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

