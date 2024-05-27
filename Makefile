## help: Get more info on available make commands.
help: Makefile
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
.PHONY: help

## test: Run tests.
test:
	@echo "--> Running tests"
	@go test -timeout 5m ./...
.PHONY: test

## lint: Run golangci-lint.
lint:
	@echo "--> Running golangci-lint"
	@golangci-lint run
.PHONY: lint

## build: Build the supply-server binary.
build:
	@echo "--> Building the binary and saving in bin/supply-server"
	@go build -o bin/supply-server
.PHONY: build

## docker-build: Build a docker image. Requires docker to be installed.
docker-build:
	@echo "--> Building the docker image"
	@docker build . --tag "celestiaorg/supply:latest"
.PHONY: docker-build

## docker-tag: Tag the docker image so that it can be pushed to Scaleway.
docker-tag:
	@echo "--> Tagging the docker image so that it can be pushed to Scaleway"
	@docker tag celestiaorg/supply rg.fr-par.scw.cloud/supply/supply:latest
.PHONY: docker-tag

## docker-push: Push the docker image to Scaleway. Requires the user to be logged in to Scaleway.
docker-push:
	@echo "--> Pushing the docker image to Scaleway"
	@docker push rg.fr-par.scw.cloud/supply/supply:latest
.PHONY: docker-push