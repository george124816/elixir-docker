ELIXIR_IMAGE=elixir
ELIXIR_VERSION=1.13.4

.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

iex: ## run iex
	docker run -it --rm \
	-v $$PWD:/app \
	-v $$PWD:/root/.mix \
	-w /app/ \
	--network host \
	$(ELIXIR_IMAGE):$(ELIXIR_VERSION) iex -S mix phx.server

phx.server: ## run phx.server
	docker run -it --rm \
	-v $$PWD:/app \
	-v $$PWD:/root/.mix \
	-w /app/ \
	--network host \
	$(ELIXIR_IMAGE):$(ELIXIR_VERSION) iex -S mix phx.server

format: ## run format
	docker run -it --rm \
	-v $$PWD:/app \
	-v $$PWD:/root/.mix \
	-w /app/ \
	$(ELIXIR_IMAGE):$(ELIXIR_VERSION) mix format

credo: ## run credo
	docker run -it --rm \
	-v $$PWD:/app \
	-v $$PWD:/root/.mix \
	-w /app/ \
	--network host \
	$(ELIXIR_IMAGE):$(ELIXIR_VERSION) iex -S mix phx.server

sh: ## enter on shell container
	docker run -it --rm \
	-v $$PWD:/app \
	-v $$PWD:/root/.mix \
	-w /app/ \
	--network host \
	$(ELIXIR_IMAGE):$(ELIXIR_VERSION) bash

release: ## generate release
	docker run -it --rm \
	-v $$PWD:/app \
	-v $$PWD:/root/.mix \
	-w /app/ \
	--network host \
	$(ELIXIR_IMAGE):$(ELIXIR_VERSION) mix release
