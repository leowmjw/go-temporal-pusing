run:
	@cd cmd/pusinger && go run *.go

test:
	@gotest ./...

tools:
	@echo "Downloading tools ..."

