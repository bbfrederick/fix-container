# Use Ubuntu 20.04 LTS
FROM ubuntu:20.04

# Prepare environment
RUN df -h
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get install -y --no-install-recommends \
                    autoconf \
                    curl \
                    wget \
                    bzip2 \
                    ca-certificates \
                    xvfb \
                    build-essential \
                    libtool \
                    gnupg \
                    pkg-config \
                    lsb-release \
                    git \
                    bc \
                    dc \
                    file \
                    libfontconfig1 \
                    libfreetype6 \
                    libgl1-mesa-dev \
                    libgl1-mesa-dri \
                    libglu1-mesa-dev \
                    libgomp1 \
                    libice6 \
                    libopenblas-base \
                    libxcursor1 \
                    libxft2 \
                    libxinerama1 \
                    libxrandr2 \
                    libxrender1 \
                    libxt6 \
                    nano \
                    sudo

# Install FSL
RUN curl -sSL https://fsl.fmrib.ox.ac.uk/fsldownloads/fsl-6.0.5.1-centos7_64.tar.gz && \
    tar -xvzf fsl-6.0.5.1-centos7_64.tar.gz -C /opt/ && \
    rm fsl-6.0.5.1-centos7_64.tar.gz

RUN apt-get install -y octave
RUN apt-get install -y liboctave-dev

RUN octave --eval 'pkg install -forge io;'
RUN octave --eval 'pkg install -forge statistics;' 
RUN octave --eval 'pkg install -forge general;'
RUN octave --eval 'pkg install -forge control;'
RUN octave --eval 'pkg install -forge signal;'
#RUN octave --eval 'pkg install -forge specfun;'


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV IS_DOCKER_8395080871=1

RUN git clone https://github.com/jelman/FSL_FIX.git
#RUN cd /FSL_FIX; ./setup_octave.sh

#RUN /FSL_FIX/setup_octave.sh

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
