FROM crosbymichael/golang
MAINTAINER omri@iluz.net

RUN apt-get update && apt-get install --no-install-recommends -y dnsutils

ADD . /go/src/github.com/skynetservices/skydns
RUN go get github.com/skynetservices/skydns

EXPOSE 53
ENTRYPOINT skydns -machines="http://etcd${DOMAIN}:4001" -domain="${DOMAIN#.}." -addr="0.0.0.0:53"
