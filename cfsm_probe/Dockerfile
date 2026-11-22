ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apk add --no-cache curl ca-certificates tzdata

# 国内走 ghfast 加速下载 arm64 探针二进制
RUN curl -fL --retry 3 --connect-timeout 15 \
      -o /usr/local/bin/cf-probe \
      "https://ghfast.top/https://github.com/huilang-me/cfsm-agent/releases/latest/download/cf-probe-linux-arm64" \
    && chmod +x /usr/local/bin/cf-probe \
    && /usr/local/bin/cf-probe --help >/dev/null 2>&1 || true

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
