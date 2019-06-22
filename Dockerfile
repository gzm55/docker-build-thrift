FROM phusion/holy-build-box-64:2.0.1

## Ref: https://thrift.apache.org/docs/install/centos

ADD content /

RUN set -eux \
    && echo Installing flex ... \
    && yum install -y flex \
    && /hbb_exe_gc_hardened/activate-exec /install-bison.sh \
    && /install-boost.sh \
    && cd / \
    && yum clean -y all \
    && rm -rf /tmp/* /install-*.sh
