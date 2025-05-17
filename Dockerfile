FROM ubuntu:24.04

    # https://googlechromelabs.github.io/chrome-for-testing/
ENV CHROME_VERSION=136.0.7103.92 \
    # https://github.com/ovh/venom/releases
    VENOM_VERSION=1.3.0-beta.2

COPY --chown=1000:1000 rootfs /

RUN userdel --remove ubuntu 2>/dev/null && \
    groupadd -g 1000 venom && \
    useradd -u 1000 -g 1000 -m venom -s /bin/bash && \
    /setup.sh && \
    rm -rf /setup.sh

USER venom

WORKDIR /home/venom
