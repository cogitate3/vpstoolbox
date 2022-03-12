#!/usr/bin/env bash

## Hexo模组 Hexo moudle

install_hexo(){
set +e
TERM=ansi whiptail --title "安装中" --infobox "安装Hexo中..." 7 68
  colorEcho ${INFO} "Install Hexo ing..."
  cd /usr/share/nginx
  npm install -g npm
  npm install hexo-cli -g
  npm update
  hexo init hexo
  cd /usr/share/nginx/hexo
  npm audit fix
  npm prune
  hexo new page ${password1}
  cd /usr/share/nginx/hexo/themes
  apt-get install git -y
  git clone https://github.com/theme-next/hexo-theme-next next
  cd /usr/share/nginx/hexo
  npm install hexo-generator-feed --save
  npm install hexo-filter-nofollow --save
  npm install hexo-migrator-rss --save
    cat > '/usr/share/nginx/hexo/_config.yml' << EOF
#title: xxx's Blog
#author: xxx
#description: xxx的博客。
language: zh-CN
url: https://${domain}
theme: next
post_asset_folder: true
feed:
  type: atom
  path: atom.xml
  limit: 20
  hub:
  content: true
  content_limit: 140
  content_limit_delim: ' '
  order_by: -date
  icon: icon.png
  autodiscovery: true
  template:
nofollow:
  enable: true
  field: site
  exclude:
    - 'exclude1.com'
    - 'exclude2.com'
EOF

## Enable CC license (by-nc-sa)

sed -i '0,/sidebar: false/s//sidebar: true/' /usr/share/nginx/hexo/themes/next/_config.yml
sed -i '0,/post: false/s//post: true/' /usr/share/nginx/hexo/themes/next/_config.yml
sed -i '0,/darkmode: false/s//darkmode: true/' /usr/share/nginx/hexo/themes/next/_config.yml
sed -i '0,/lazyload: false/s//lazyload: true/' /usr/share/nginx/hexo/themes/next/_config.yml
sed -i '0,/lazyload: false/s//lazyload: true/' /usr/share/nginx/hexo/themes/next/_config.yml

cd /usr/share/nginx/hexo/source/${password1}
if [[ -f index.md ]]; then
  rm index.md
fi
cat > "index.md" << EOF
---
title: VPS Toolbox Result
---
Welcome to [VPSToolBox](https://github.com/johnrosen1/vpstoolbox)! This page is generated by [Hexo](https://hexo.io/zh-tw/docs/) and you can ask me on [Telegram](https://t.me/vpstoolbox_chat).

欢迎使用[VPSToolBox](https://github.com/johnrosen1/vpstoolbox) ! 此页面由[Hexo](https://hexo.io/zh-tw/docs/)全自动生成,如果你在使用VPSToolBox时遇到任何问题,请仔细阅读以下所有链接以及信息或者**通过 [Telegram](https://t.me/vpstoolbox_chat)请求支援** !

如果觉得好用，欢迎打钱帮助开发或者尝试以下服务，😃❤️🤣：

ETH：0x9DB5737AB34E1F5d1303E9eD726776eebba3BF16

[Namesilo](https://www.namesilo.com/?rid=685fb47qi)

[阿里云](https://www.aliyun.com/daily-act/ecs/activity_selection?userCode=fgdncdz2)


***⚠️WARNING⚠️请不要自行修改默认配置,除非你知道你在做什么 ❗❗❗***

---

### Trojan-GFW

*默认安装: ✅*

#### Trojan-GFW client config profiles(客户端配置文件)

1. <a href="https://$domain/client1-$password1.json" target="_blank" rel="noreferrer">Profile 1</a>
2. <a href="https://$domain/client2-$password2.json" target="_blank" rel="noreferrer">Profile 2</a>

#### Trojan-GFW Share Links

1. trojan://$password1@$domain:${trojanport}
2. trojan://$password2@$domain:${trojanport}

#### 相关链接(重要!)

1. <a href="https://github.com/trojan-gfw/igniter/releases" target="_blank" rel="noreferrer">Android client</a> 安卓客户端
2. <a href="https://apps.apple.com/us/app/shadowrocket/id932747118" target="_blank" rel="noreferrer">ios client</a>苹果客户端
3. <a href="https://github.com/trojan-gfw/trojan/releases/latest" target="_blank" rel="noreferrer">windows client</a>windows客户端
4. <a href="https://github.com/NetchX/Netch" target="_blank" rel="noreferrer">https://github.com/NetchX/Netch</a>推荐的**游戏**客户端
5. <a href="https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif" target="_blank" rel="noreferrer">Proxy SwitchyOmega</a>
6. <a href="https://github.com/gfwlist/gfwlist/blob/master/gfwlist.txt" target="_blank" rel="noreferrer">Gfwlist(请配合SwichyOmega食用)</a>

---

### Trojan(Grpc)/Vless(Grpc)

地址：$domain

端口：${trojanport}

用户UD(id): ${uuid_new}

path：/${path_new}

Vless(grpc)快速链接(vless grpc links)

vless://${uuid_new}@${myip}:${trojanport}?mode=gun&security=tls&encryption=none&type=grpc&serviceName=/${path_new}&sni=${domain}#vless(grpc_direct_${myip})

Vless(grpc)支持Cloudflare CDN链接(vless grpc links)

vless://${uuid_new}@${domain}:${trojanport}?mode=gun&security=tls&encryption=none&type=grpc&serviceName=/${path_new}&sni=${domain}#vless(grpc_cdn_${myip})

Trojan(grpc)快速链接(trojan grpc links)

trojan://${uuid_new}@${myip}:${trojanport}?encryption=none&security=tls&type=grpc&sni=${domain}&alpn=h2&serviceName=/${path_new}_trojan#Trojan(grpc_direct_${myip})

Trojan(grpc)支持Cloudflare CDN链接(trojan grpc links)

trojan://${uuid_new}@${domain}:${trojanport}?encryption=none&security=tls&type=grpc&sni=${domain}&alpn=h2&serviceName=/${path_new}_trojan#Trojan(grpc_cdn_${myip})

---

### Shadowsocks-rust

*默认安装: ❎*

ss://aes-128-gcm:${password1}@${domain}:8388#iplc-only
ss://$(echo "aes-128-gcm:${password1}@${domain}:8388" | base64)#iplc-only

PS: 仅推荐用于[iplc](https://relay.nekoneko.cloud?aff=2257)落地,不推荐直连使用。

---

### Nextcloud

*默认安装: ❎*

<a href="https://$domain/nextcloud/" target="_blank" rel="noreferrer">https://$domain/nextcloud/</a>
- 用户名(username): **admin**
- 密碼(password): **${password1}**

---

### Hexo

*默认安装: ✅*

#### Hexo location

{% blockquote %}
cd /usr/share/nginx/hexo/source/_posts/
{% endblockquote %}

{% blockquote %}
hexo new post title(标题)
{% endblockquote %}

{% blockquote %}
hexo g && hexo d
{% endblockquote %}

#### Docs

1. <a href="https://hexo.io/zh-tw/docs/" target="_blank" rel="noreferrer">Hexo docs</a>
2. <a href="https://www.typora.io" target="_blank" rel="noreferrer">A new way to read & write Markdown</a>

---

### Rsshub + Miniflux

*默认安装: ❎*

#### RSSHUB

<a href="https://$domain/rsshub/" target="_blank" rel="noreferrer">https://$domain/rsshub/</a>

#### Miniflux

- <a href="https://$domain/miniflux/" target="_blank" rel="noreferrer">https://$domain/miniflux/</a>
- 用户名(username): **admin**
- 密碼(password): **${password1}**

---

### Qbittorrent Enhanced Version

*默认安装: ❎*

- <a href="https://$domain/qbt/" target="_blank" rel="noreferrer">https://$domain/qbt/</a>
- 用户名(username): admin
- 密碼(password): ${password1}

---

### Aria2

*默认安装: ❎*

#### AriaNG

- <a href="https://$domain:443/ariang/" target="_blank" rel="noreferrer">https://$domain/ariang/</a>

> 系统设定-->rpc-->填入下方内容(端口修改为443,填入Aria2 RPC金钥)即可。

#### Aria2

- https://$domain:443$ariapath
- 密碼(Aria2 RPC金钥,token): **$ariapasswd**
- <a href="https://play.google.com/store/apps/details?id=com.gianlu.aria2app" target="_blank" rel="noreferrer">Aria2 for Android</a>

---

### Filebrowser

*默认安装: ❎*

- <a href="https://$domain:443/file/" target="_blank" rel="noreferrer">https://$domain/file/</a>
- 用户名(username): **admin**
- 密碼(token): **admin**

> *请自行修改初始用户名和密码！*

---

### 影音

*默认安装: ❎*

- <a href="https://$domain:443/emby/" target="_blank" rel="noreferrer">https://$domain/emby/</a>
- <a href="https://$domain:443/jellyfin/" target="_blank" rel="noreferrer">https://$domain/jellyfin/</a>
- <a href="https://$domain:443/sonarr/" target="_blank" rel="noreferrer">https://$domain/sonarr/</a>
- <a href="https://$domain:443/radarr/" target="_blank" rel="noreferrer">https://$domain/radarr/</a>
- <a href="https://$domain:443/lidarr/" target="_blank" rel="noreferrer">https://$domain/lidarr/</a>
- <a href="https://$domain:443/bazarr/" target="_blank" rel="noreferrer">https://$domain/bazarr/</a>
- <a href="https://$domain:443/chinesesubfinder/" target="_blank" rel="noreferrer">https://$domain/chinesesubfinder/</a>
- <a href="https://$domain:443/jackett/" target="_blank" rel="noreferrer">https://$domain/jackett/</a>

---

### Speedtest

*默认安装: ❎*

- <a href="https://$domain:443/${password1}_speedtest/" target="_blank" rel="noreferrer">https://$domain/${password1}_speedtest/</a>

---

### Netdata

*默认安装: ✅*

> 简介: 一款 **实时效能监测工具** 应用。

#### Netdata

- <a href="https://$domain:443/${password1}_netdata/" target="_blank" rel="noreferrer">https://${domain}/${password1}_netdata/</a>

---

### Rocket Chat

*默认安装: ❎*

- <a href="https://$domain:443/chat/" target="_blank" rel="noreferrer">https://$domain/rocketchat/</a>

---

### Mail Service

*默认安装: ❎*

***⚠️WARNING⚠️请不要自行修改任何邮件配置,除非你知道你在做什么 ❗❗❗***

> 简介: 邮件软件。

PS: 不支援自定义证书,仅支援全自动申请的let证书!

#### Roundcube Webmail

- <a href="https://${domain}/mail/" target="_blank" rel="noreferrer">Roundcube Webmail</a>
- 用户名(username): ${mailuser}
- 密碼(password): ${password1}
- 收件地址: **${mailuser}@${domain}**

#### Tips:

1. 阿里云，gcp等厂商默认不开放25(包括对外访问)端口，不能发邮件，请注意。
2. 请自行添加SPF(TXT) RECORD: v=spf1 mx ip4:${myip} a ~all
3. 请自行运行sudo cat /etc/opendkim/keys/${domain}/default.txt 来获取生成的DKIM(TXT) RECORD

---

### Bittorrent-trackers

*默认安装: ❎*

udp://$domain:6969/announce

#### Info link

<a href="https://$domain/tracker/" target="_blank" rel="noreferrer">https://$domain/tracker/</a>

---

### Typecho

*默认安装: ❎*

请自行注释掉*/etc/nginx/conf.d/default.conf*中的Hexo部分并去掉Typecho的注释以启用Typecho。

---

### 相关链接

##### Qbt相关链接

1. <a href="https://www.qbittorrent.org/download.php" target="_blank" rel="noreferrer">win等平台下载页面</a>
2. <a href="https://github.com/qbittorrent/qBittorrent" target="_blank" rel="noreferrer">Github页面</a>
3. <a href="https://play.google.com/store/apps/details?id=com.lgallardo.qbittorrentclientpro" target="_blank" rel="noreferrer">Android远程操控客户端</a>
4. <a href="https://www.qbittorrent.org/" target="_blank" rel="noreferrer">https://www.qbittorrent.org/</a>
1. <a href="https://thepiratebay.org/" target="_blank" rel="noreferrer">https://thepiratebay.org/</a>
2. <a href="https://sukebei.nyaa.si/" target="_blank" rel="noreferrer">https://sukebei.nyaa.si/</a></li>
3. <a href="https://rarbgprx.org/torrents.php" target="_blank" rel="noreferrer">https://rarbgprx.org/torrents.php</a>

##### Rsshub相关链接

1. <a href="https://docs.rsshub.app/" target="_blank" rel="noreferrer">RSSHUB docs</a>
2. <a href="https://github.com/DIYgod/RSSHub-Radar" target="_blank" rel="noreferrer">RSSHub Radar</a>(推荐自行将默认的rsshub.app换成上述自建的)
3. <a href="https://docs.rsshub.app/social-media.html" target="_blank" rel="noreferrer">RSSHUB路由</a>

##### Aria相关链接

1. <a href="https://github.com/aria2/aria2" target="_blank" rel="noreferrer">https://github.com/aria2/aria2</a>
2. <a href="https://aria2.github.io/manual/en/html/index.html" target="_blank" rel="noreferrer">https://aria2.github.io/manual/en/html/index.html</a> 官方文档
3. <a href="https://github.com/mayswind/AriaNg/releases" target="_blank" rel="noreferrer">AriaNG</a>

##### Filebrowser相关链接

1. <a href="https://github.com/filebrowser/filebrowser" target="_blank" rel="noreferrer">https://github.com/filebrowser/filebrowser</a>
2. <a href="https://filebrowser.xyz/" target="_blank" rel="noreferrer">https://filebrowser.xyz/</a>


##### Speedtest相关链接

1. <a href="https://github.com/librespeed/speedtest" target="_blank" rel="noreferrer">https://github.com/librespeed/speedtest</a>

##### Netdata相关链接

1. <a href="https://play.google.com/store/apps/details?id=com.kpots.netdata" target="_blank" rel="noreferrer">https://play.google.com/store/apps/details?id=com.kpots.netdata</a>安卓客户端
2. <a href="https://github.com/netdata/netdata" target="_blank" rel="noreferrer">https://github.com/netdata/netdata</a>

##### Mail服务相关链接

1. <a href="https://www.mail-tester.com/" target="_blank" rel="noreferrer">https://www.mail-tester.com/</a>
2. <a href="https://lala.im/6838.html" target="_blank" rel="noreferrer">Debian10使用Postfix+Dovecot+Roundcube搭建邮件服务器</a>(仅供参考!)

<iframe src="https://snowflake.torproject.org/embed.html" width="320" height="240" frameborder="0" scrolling="no"></iframe>

EOF
cd /usr/share/nginx/hexo/
hexo g
hexo d
cd
hexo_location=$(which hexo)
    cat > '/etc/systemd/system/hexo.service' << EOF
[Unit]
Description=Hexo Server Service
Documentation=https://hexo.io/zh-tw/docs/
After=network.target

[Service]
WorkingDirectory=/usr/share/nginx/hexo
ExecStart=${hexo_location} server -i 127.0.0.1
LimitNOFILE=65536
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable hexo
systemctl restart hexo
}
