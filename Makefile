# Dockerイメージをビルドする
build:
	docker build -t docker-sandbox:1.0 .

# コンテナを実行しつつ、bashによりコンテナ内に入る
debug:
	docker container run -it --rm --name "docker-sandbox-container" docker-sandbox:1.0 /bin/bash

# バックグラウンドでbashを起動しながらコンテナを実行する
run-container: .env
	docker container run -itd --name "docker-sandbox-container" --env-file ./.env docker-sandbox:1.0 /bin/bash

# run-containerした後に、起動中のコンテナにbashのプロセスで入る
exec:
	docker exec -it docker-sandbox-container /bin/bash

# Dockerコンテナを削除する
# 起動中の場合でも強制終了する
remove-container:
	docker container rm -f docker-sandbox-container

# Dockerイメージを削除する
remove-image:
	docker image rm docker-sandbox:1.0
