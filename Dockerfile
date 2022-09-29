# Use Ubuntu 20.04 LTS
FROM ubuntu:20.04

# Prepare environment
RUN df -h
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get install -y --no-install-recommends \
                    curl \
                    bzip2 \
                    ca-certificates \
                    xvfb \
                    build-essential \
                    autoconf \
                    libtool \
                    gnupg \
                    pkg-config \
                    lsb-release \
                    git


RUN apt-get install -y octave=3.6.4

RUN octave --eval 'pkg install -auto -forge io; pkg install -auto -forge statistics; \
    pkg install -auto -forge specfun; pkg install -auto -forge general; \
    pkg install -auto -forge control; pkg install -auto -forge signal;'


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV IS_DOCKER_8395080871=1

RUN git clone https://github.com/jelman/FSL_FIX.git
RUN cd /FSL_FIX; ./setup_octave.sh

RUN /FSL_FIX/setup_octave.sh

RUN ldconfig
#ENTRYPOINT ["/bin/bash"]

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="fix-container" \
      org.label-schema.description="fix container" \
      org.label-schema.url="http://nirs-fmri.net" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/bbfrederick/fix-container" \
      org.label-schema.version=$VERSION
