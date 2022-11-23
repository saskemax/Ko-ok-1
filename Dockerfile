FROM alpine:edge

ARG AUUID="8d611c10-cad5-4fc7-bb8d-d6e2d51b5a02"
ARG CADDYIndexPage="https://www.free-css.com/assets/files/free-css-templates/download/page217/epic.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
