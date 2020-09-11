#!/usr/bin/env sh

get_uuid() {
    echo $UUID
}

get_port() {
    echo $PORT
}

rm /opt/config/v2ray.json -f
sed "s/\${UUID}/$(get_uuid)/g" /opt/template/v2ray.json > /opt/config/v2ray.json

rm /etc/nginx/nginx.conf -f
sed "s/\${PORT}/$(get_port)/g" /opt/template/nginx.conf > /etc/nginx/nginx.conf

/usr/bin/supervisord -c /etc/supervisor.conf