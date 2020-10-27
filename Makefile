version := $(shell git describe --tags --always --dirty)

build: docker-machine-driver-yandex

test: $(shell find . -name '*.go')
	go test -v -race ./...

docker-machine-driver-yandex: $(shell find . -name '*.go')
	go build -a -v -ldflags "-X main.Version=${version} $(GO_LDFLAGS) -extldflags -static" -o $@

clean:
	rm -fv docker-machine-driver-yandex

.PHONY: test build clean
