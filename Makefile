all:
	$(MAKE) build-docs

.PHONY: build-docs
build-docs:
	docker compose -f infra/docker-compose.yaml --profile build run docs-builder

.PHONY: run-docs-live-reload
run-docs-live-reload:
	docker compose -f infra/docker-compose.yaml up --build

.PHONY: clean
clean:
	rm -f $(shell pwd)/tmp/*.map $(shell pwd)/tmp/*.png && \
	rm -rf $(shell pwd)/tmp/assets