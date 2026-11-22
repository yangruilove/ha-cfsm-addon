ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apk add --no-cache curl ca-certificates tzdata

# 下载 arm64 探针二进制（国内走 ghfast 加速）
RUN curl -fL --retry 3 --connect-timeout 15 \
      -o /usr/local/bin/cf-probe \
      "https://ghfast.top/https://github.com/huilang-me/cfsm-agent/releases/latest/download/cf-probe-linux-arm64" \
    && chmod +x /usr/local/bin/cf-probe

COPY run.sh /run.sh
RUN chmod a+x /run.sh

# 覆盖 HA 基础镜像的 s6 入口，直接跑我们的脚本
ENTRYPOINT []
CMD [ "/run.sh" ]
