#!/bin/sh

## run me : curl -sSL https://public.zhouzhipeng.com/install_codebox.sh | sudo bash

set -eux 

cd /root

curl -sSL https://github.com/zhouzhipeng/public/releases/download/1.0/codebox --output codebox
curl -sSL https://github.com/zhouzhipeng/public/releases/download/1.0/web --output web

chmod +x codebox web

# register service
curl -sSL https://public.zhouzhipeng.com/codebox.service --output /etc/systemd/system/codebox.service

systemctl daemon-reload

systemctl enable codebox.service

systemctl start codebox

systemctl status codebox
