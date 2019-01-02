FROM alpine:latest

RUN deluser guest ; delgroup users
RUN addgroup -g 985 -S users
RUN adduser -S -G users -u 1000 -s /bin/sh -h /home/mudrii mudrii

# TFlint version https://github.com/wata727/tflint/releases
ENV TFLINT_VERSION=v0.7.3

RUN apk --no-cache update && \
    apk --no-cache add \
    ca-certificates \
    curl && \
    curl -L https://github.com/wata727/tflint/releases/download/${TFLINT_VERSION}/tflint_linux_amd64.zip > tflin_${TFLINT_VERSION}_linux_amd64.zip && \
    unzip tflin_${TFLINT_VERSION}_linux_amd64.zip -d /bin && \
    rm -f tflin_${TFLINT_VERSION}_linux_amd64.zip && \
    apk --purge del curl

USER mudrii
