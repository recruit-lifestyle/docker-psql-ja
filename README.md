# docker-psql-ja

日本語環境に対応したpsqlクライアントです。

## Requirements
- Docker version 17.x+

## Installation

Docker Hubに公開されている最新版のイメージを取得する場合
```bash
$ docker pull recruit-lifestyle/docker-psql-ja
```

Githubに公開されているDockerファイルを手元でビルドする場合
```bash
$ git clone https://github.com/recruit-lifestyle/docker-psql-ja.git
$ docker build -t docker-psql-ja .
```

## How to use
コンテナ内でのユーザは `europa` となる点に注意。
```
# 適当なSQLファイルを生成
$ echo "SELECT * FROM hoge" > sample.sql
# Dockerを起動しSQLを実行する(ボリュームマッピング経由でファイル渡す)
# 変数${}は自分の接続環境に応じて適宜埋める
$ docker run --rm -v `pwd`:/home/europa/host/ \
  docker-psql-ja:latest \
  psql postgresql://${user_name}:${password}@${host}:${port}/${db_name} ${options} \
  -f /home/europa/host/sample.sql > result.tsv
# 結果の確認
$ head result.tsv
```

## Credits

docker-psql-ja is owned and maintained by [RECRUIT LIFESTYLE CO., LTD.](http://www.recruit-lifestyle.co.jp/)

## Licence

    Copyright (c) 2017 RECRUIT LIFESTYLE CO., LTD.
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0       

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
