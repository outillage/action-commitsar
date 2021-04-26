FROM alpine:3.13.5

ARG RELEASE

RUN  apk add --no-cache --virtual=.run-deps ca-certificates git &&\
    mkdir /app

WORKDIR /app

RUN echo "Using Commitsar ${RELEASE}" &&\
    wget -c https://github.com/commitsar-app/commitsar/releases/download/v${RELEASE}/commitsar_${RELEASE}_Linux_x86_64.tar.gz &&\
    tar xf commitsar_${RELEASE}_Linux_x86_64.tar.gz


RUN ln -s $PWD/commitsar /usr/local/bin

ENTRYPOINT commitsar