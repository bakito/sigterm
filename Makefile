build:
	docker build -t ghcr.io/bakito/sigterm:1.0.0-bash -f bash.Dockerfile .
	docker build -t ghcr.io/bakito/sigterm:1.0.0-bash-exec -f bash-exec.Dockerfile .
	docker build -t ghcr.io/bakito/sigterm:1.0.0-raw -f raw.Dockerfile .
	docker build -t ghcr.io/bakito/sigterm:1.0.0-bash-dumb-init -f bash-dumb-init.Dockerfile .

run-raw:
	docker run --name sigterm --rm ghcr.io/bakito/sigterm:1.0.0-raw
run-bash:
	docker run --name sigterm --rm ghcr.io/bakito/sigterm:1.0.0-bash
run-bash-exec:
	docker run --name sigterm --rm ghcr.io/bakito/sigterm:1.0.0-bash-exec
run-bash-dumb-init:
	docker run --name sigterm --rm ghcr.io/bakito/sigterm:1.0.0-bash-dumb-init

stop:
	docker stop sigterm

kill:
	docker rm -f sigterm
