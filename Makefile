build:
	docker build -t docker-sandbox:1.0 .

debug:
	docker container run -it --rm --name "docker-sandbox-container" docker-sandbox:1.0 /bin/bash

remove:
	docker image rm docker-sandbox:1.0
