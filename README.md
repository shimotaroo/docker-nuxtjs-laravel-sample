## 概要
Nuxt.js + Laravel（API）のDocker開発環境構サンプル

## バージョン

|名称|バージョン|
|:--:|:--:|
|Nginx|1.19|
|MySQL|8.0|
|PHP|7.4|
|Node.js|14.17|
|Nuxt.js|2.x|
|Laravel|7.30.4|
|Xdebug|3.x|
|Composer|2.0.14|

## 開発環境立ち上げ
### .env作成
.env.exampleをコピーして.envを作成します。<br>
.envの各値は適宜変更してください。（特にNGINX_PORT、DB_PORT）

## ビルド＆コンテナ起動

```
$ docker-compose up -d --build
```

## Frontend
下記のコマンドでNuxtプロジェクトを作成します。
./frontというディレクトリにNuxtプロジェクトが一式準備されます。

### プロジェクトの作成

```
$ docker-compose exec front yarn create nuxt-app ./
```

### 監視
通常、下記コマンドで常時ビルドするようにしますが、本環境では`.docker/front/entrypoint.sh`にビルドコマンドを追記しているので、コンテナ起動中は常にビルドされます。よって、下記コマンド実行は不要です。

```
$ docker-compose exec front yarn dev
```

## Backend
下記のコマンドでLaravel7.xプロジェクトを作成します。
./apiディレクトリにLaravelプロジェクトが一式が準備されます。

### プロジェクト作成

```
$docker-compose exec api composer create-project --prefer-dist laravel/laravel ./ "7.*"
```

### URL

- トップページ：http://localhost:80
- API：http://localhost:80/api
- Swagger UI：http://localhost:8082/

### Composer 追加パッケージ

- [fruitcake/laravel-cors](https://github.com/fruitcake/laravel-cors)
- [zircote/swagger-php](https://github.com/zircote/swagger-php)
- [barryvdh/laravel-ide-helper](https://github.com/barryvdh/laravel-ide-helper)
- [barryvdh/laravel-debugbar](https://github.com/barryvdh/laravel-debugbar)

## 参考記事

### Docker環境構築
- [docker-composeを利用して同一リポジトリでNuxt(web) + Laravel(API)な開発環境を準備する](https://qiita.com/nagi125/items/09ddbbfa923c0999494e)
- [DockerとXdebug3を使ってVSCodeでLaravelのデバッグをする](https://inframenma.com/laravel-xdebug3-vscode-ondocker/)
- [【Docker/Laravel6】Xdebug3を使ってデバックをする方法（VSCode）](https://programming.sincoston.com/docker-laravel6-xdebug/)
- [php-alpineコンテナにxdebugをインストールする時にハマったメモ](https://qiita.com/ucan-lab/items/fbf021bf69896538e515)
- [Laradock使わないでdocker-composeでnginx,laravel(php-fpm),mysql,redis,swaggerの開発環境を整える](https://qiita.com/geerpm/items/d040090f0c4065e7b86d)

### Nuxt.js
- [いつの間にかNuxt.jsで実行時環境変数が使えるようになっていた件](https://zenn.dev/kouchanne/articles/83466e36e1c30f174ae8)
- [dotenvはもう古い！最新Nuxtの環境変数管理方法](https://qiita.com/taai/items/cbc61b9b4a18aacad57e)
- [Laravel（API）とNuxt.jsの連携を行う【Laravel6+Nuxt.jsで作る管理画面】](https://deha.co.jp/magazine/admin-laravel-nuxt-setup/)
### Larvel

- [OpenAPI (Swagger) 超入門](https://qiita.com/teinen_qiita/items/e440ca7b1b52ec918f1b)
- [補完でサクサク！Laravel IDE Helperを使う](https://r-tech14.com/laravel-ide-helper/)
