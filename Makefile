PACKAGE=gostart
BINARY=gostart
VERSION=1.0.0
DATE=`date +%FT%T%z`
COMMIT = $(shell git rev-parse --short HEAD)

LDFLAGS=-ldflags "-s -w -X main.version=${VERSION} -X main.buildDate=${DATE} -X main.commit=$(COMMIT)"

.PHONY: all
all: clean build

build:
	@echo "编译本地版本"
	go build ${LDFLAGS} -o $(BINARY)
	@file ${BINARY}

build-linux:
	@echo "编译linux版本"
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build ${LDFLAGS} -o $(BINARY)
	@file ${BINARY}

install:
	go install ${LDFLAGS}

clean:
	go clean
