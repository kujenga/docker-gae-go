# configuration variables
USER = kujenga
REPO = docker-gae-go

build:
	docker build -t $(USER)/$(REPO) .

push: build
	docker push $(USER)/$(REPO)
