FROM alpine
RUN apk add \
  bash \
  curl \
  busybox-extras \
  jq

RUN curl -Lo /k3s https://github.com/rancher/k3s/releases/download/v0.10.0/k3s \
    && chmod +x /k3s

ADD ./index.html /web/
ADD ./cgi-bin /web/cgi-bin
RUN chmod +x /web/cgi-bin/*

CMD httpd -v -f -h /web