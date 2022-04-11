# docker-proxy2ch

[proxy2ch](https://notabug.org/NanashiNoGombe/proxy2ch) をコンテナ化したものです。

## 使い方

Dockerhubでは公開していないので、まずリポジトリをコピーしてください。

```
git clone https://github.com/pen/docker-proxy2ch
cd docker-proxy2ch
```

とりあえず動かすならそのまま次を。

```
docker compose up -d
```

引数は環境変数で渡せます。
docker-compose.yaml と rootfs/etc/rc.entry を参照。


## ベースをUbuntu版に

```
ln -sf Dockerfile.ubuntu Docker
docker compose build --no-cache
```

Luaのバージョンは5.3になります。

## その他

Dockerhubでは公開していません。
