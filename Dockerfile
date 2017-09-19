FROM alpine:latest


## 设置alpine linux 阿里云源
RUN cp /etc/apk/repositories /etc/apk/repositories.bak
RUN echo "http://mirrors.aliyun.com/alpine/v3.6/main" > /etc/apk/repositories
RUN echo "http://mirrors.aliyun.com/alpine/v3.6/community" >> /etc/apk/repositories

## 设置时区
RUN apk update && apk add curl bash tree tzdata && cp -r -f /usr/share/zoneinfo/PRC /etc/localtime && echo -ne "Alpine Linux 3.6 image. (`uname -rsv`)\n" >> /root/.built

RUN apk add python py-pip && pip install shadowsocks

RUN mkdir -p /etc/shadowsocks/

CMD [ "ssserver" ,"-c","/etc/shadowsocks/config.json"]