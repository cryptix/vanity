
NAME := kkn.fi/vanity

GOMETALINTER := $(GOPATH)/bin/gometalinter

.PHONY: build
build:
	go build $(NAME)

.PHONY: test
test:
	go test -v $(NAME)

.PHONY: lint
lint: $(GOMETALINTER)
	gometalinter ./...

$(GOMETALINTER):
	go get -u github.com/alecthomas/gometalinter
	gometalinter --install

.PHONY: cover
cover:
	go test -coverprofile=coverage.out $(NAME)
	go tool cover -html=coverage.out
	@rm -f coverage.out

.PHONY: heat
heat:
	go test -covermode=count -coverprofile=count.out $(NAME)
	go tool cover -html=count.out
	@rm -f count.out
