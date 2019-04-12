FROM ubuntu:latest

LABEL maintainer="Tomoya Tanjo <ttanjo@gmail.com>"

ARG VERSION=1.11
ARG OS=linux
ARG ARCH=amd64
ARG GOPATH=/go
ENV PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin

RUN apt-get update && \
    apt-get install -y build-essential \
                       libssl-dev \
                       uuid-dev \
                       libgpgme11-dev \
                       squashfs-tools \
                       wget git

WORKDIR /tmp

RUN wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz && \
    tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz && \
    mkdir -p $GOPATH/src/github.com/sylabs

WORKDIR $GOPATH/src/github.com/sylabs

RUN git clone https://github.com/sylabs/singularity.git

WORKDIR singularity

RUN go get -u -v github.com/golang/dep/cmd/dep

WORKDIR $GOPATH/src/github.com/sylabs/singularity

RUN ./mconfig && \
    make -C builddir && \
    make -C builddir install

ENTRYPOINT ["singularity"]
