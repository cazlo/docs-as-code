all:
	$(MAKE) build-docs

.PHONY: build-docs
build-docs:
	cd docs && \
	docker build --progress=plain -f ../infra/docs.Dockerfile -t  docs-as-code .


.PHONY: run-docs
run-docs:
	docker run -p 8000:8000 -it \
		-v $(shell pwd)/docs:/opt/app/docs -v $(shell pwd)/docs/adr_theme:/opt/app/adr_theme \
		-v $(shell pwd)/tmp:/opt/app/tmp  \
		docs-as-code /bin/bash

.PHONY: run-docs-live-reload
run-docs-live-reload:
	docker compose -f infra/docker-compose.yaml up --build

.PHONY: clean
clean:
	rm -f $(shell pwd)/tmp/*.map $(shell pwd)/tmp/*.png && \
	rm -rf $(shell pwd)/tmp/assets