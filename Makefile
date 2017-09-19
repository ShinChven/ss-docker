
build:
	@docker build -t ssserver .

run:
	@docker-compose up -d

up:build
	@docker-compose up -d
	
pre-install:
	@bash install-docker-ubuntu-xenial-amd64