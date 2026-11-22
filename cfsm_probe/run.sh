#!/bin/sh
echo "[cfsm] 启动脚本开始"; uname -a
ls -l /usr/local/bin/cf-probe || echo "[cfsm] 二进制不存在"
if [ -z "${SECRET}" ]; then
    echo "[cfsm] 未配置 secret，退出"; exit 1
fi
URL="${WORKER_URL:-https://monitor.haowx.top/update}"
NAME="${NAME:-haos}"
echo "[cfsm] name=${NAME} url=${URL}"
/usr/local/bin/cf-probe install -secret="${SECRET}" -url="${URL}" -name="${NAME}" || echo "[cfsm] install 退出码=$?（容器内无 systemd，可忽略）"
echo "[cfsm] 开始 run"
exec /usr/local/bin/cf-probe run
