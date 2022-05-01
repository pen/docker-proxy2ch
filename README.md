# docker-proxy2ch

[proxy2ch](https://notabug.org/NanashiNoGombe/proxy2ch) をコンテナ化したものです。

## 使い方

Dockerhubでは公開していないので、まずリポジトリをコピーしてください。

```shell
git clone https://github.com/pen/docker-proxy2ch
cd docker-proxy2ch
```

とりあえず動かすならそのまま次を。

```shell
docker compose up -d
```

引数は環境変数で渡せます。
docker-compose.yaml と rootfs/etc/rc.entry を参照。


## Ubuntuベース版

```shell
docker compose --profile ubuntu up -d
```

ポート9081で動き始めます。
