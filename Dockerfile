FROM ubuntu:18.04
LABEL maintainer="Jérôme Prinet"

ENV PATH /opt/jfrog/bin:$PATH
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq \
        wget \
        curl \
        python-pip \
        python2.7-dev \
        default-jdk \
        git-all \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/jfrog/bin \
    && wget -nv https://api.bintray.com/content/jfrog/jfrog-cli-go/1.26.1/jfrog-cli-linux-amd64/jfrog?bt_package=jfrog-cli-linux-amd64 -O jfrog \
    && chmod +x jfrog \
    && mv jfrog /usr/bin/jfrog
