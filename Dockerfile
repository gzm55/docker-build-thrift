FROM phusion/holy-build-box-64:2.0.1

## Ref: https://thrift.apache.org/docs/install/centos

RUN set -ex \
    && cd /tmp \
    && source /hbb/activate \
    && echo Installing flex \
    &&   yum install -y flex \
    && echo Installing bison \
    &&   curl --fail -L -O https://ftp.gnu.org/gnu/bison/bison-3.4.tar.gz \
    &&   tar xzf bison-*.tar.gz \
    &&   cd bison-* \
    &&   ./configure --prefix=/hbb \
    &&   make \
    &&   make install \
    &&   cd .. \
    && echo Installing boost \
    &&   curl --fail -L -O https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.bz2 \
    &&   tar xjf boost_*.tar.bz2 \
    &&   cd boost_* \
    &&   ./bootstrap.sh \
    &&   ./b2 install --prefix=/hbb \
    &&   cd .. \
    && cd / \
    && yum clean -y all \
    && rm -rf /tmp/*
