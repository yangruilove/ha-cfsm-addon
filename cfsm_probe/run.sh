#!/bin/sh
set -e

if [ -z "${SECRET}" ]; then
    echo "[cfsm] 未配置 secret，请在加载项配置里填写后重启"
    exit 1
fi

URL="${WORKER_URL:-https://monitor.haowx.top/update}"
NAME="${NAME:-haos}"

echo "[cfsm] 初始化探针 name=${NAME} url=${URL}"
# install 会写 /etc/config/cf-probe/config.conf；容器内没有 systemd，服务注册失败可忽略
/usr/local/bin/cf-probe install -secret="${SECRET}" -url="${URL}" -name="${NAME}" || true

echo "[cfsm] 启动探针"
exec /usr/local/bin/cf-probe run
