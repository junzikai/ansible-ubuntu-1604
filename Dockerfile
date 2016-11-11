FROM ubuntu:16.04

RUN apt-get update -y \
    && apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    acl \
    asciidoc \
    cdbs \
    curl \
    debhelper \
    debianutils \
    devscripts \
    docbook-xml \
    dpkg-dev \
    fakeroot \
    gawk \
    iproute2 \
    libxml2-utils \
    locales \
    lsb-release \
    make \
    mercurial \
    openssh-client \
    openssh-server \
    python-coverage \
    python-dbus \
    python-httplib2 \
    python-jinja2 \
    python-keyczar \
    python-mock \
    python-mysqldb \
    python-nose \
    python-paramiko \
    python-passlib \
    python-pip \
    python-setuptools \
    python-virtualenv \
    python-wheel \
    python-yaml \
    reprepro \
    rsync \
    ruby \
    subversion \
    sudo \
    virtualenv \
    xsltproc \
    && \
    apt-get clean

RUN rm /etc/apt/apt.conf.d/docker-clean
RUN mkdir /etc/ansible/
RUN /bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts
RUN locale-gen en_US.UTF-8
VOLUME /sys/fs/cgroup /run/lock /run /tmp
RUN pip install junit-xml
ENV container=docker
CMD ["/sbin/init"]

