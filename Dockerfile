FROM alpine:latest 
WORKDIR /
LABEL maintainer="vk@alphacloud.net"

ADD https://raw.githubusercontent.com/silinternational/ecs-deploy/master/ecs-deploy /

RUN chmod a+x /ecs-deploy && \
    ln -s /ecs-deploy /usr/bin/ &&\
    mkdir -p /aws && \
    apk update \
    apk --no-cache add ca-certificates && \
    apk --no-cache add groff && \
    apk --no-cache add less && \
    apk --no-cache add docker && \
    apk --no-cache add curl && \
    apk --no-cache add bash && \
    apk --no-cache add jq && \
    apk --no-cache add py-pip && \
    apk --no-cache add py2-pip && \
    pip --no-cache-dir install awscli && \
    apk --purge -v del py2-pip && \
    rm -rf /var/cache/apk/*
