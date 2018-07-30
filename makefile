.PHONY: all

default: build

build:
	CGO_ENABLED=0 go build .

build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o minica-linux .

image: build-linux
	docker build -f Dockerfile -t "dtomcej/minica" .
