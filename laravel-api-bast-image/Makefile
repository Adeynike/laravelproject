.PHONY: help ps build build-prod start fresh fresh-prod stop restart destroy \
	cache cache-clear migrate migrate migrate-fresh tests tests-html

CONTAINER_PHP=api
CONTAINER_REDIS=redis
CONTAINER_DATABASE=database

help: ## Print help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

auth: ##authentication with AWS
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 147726474727.dkr.ecr.us-east-1.amazonaws.com

build-push: ## Run build then push
	make build
	make push

build: ## build our image
	docker build -t laravel-prob-image .

push: ## push to prob
	docker tag laravel-prob-image:latest 147726474727.dkr.ecr.us-east-1.amazonaws.com/laravel-prob-image:latest
	docker push 147726474727.dkr.ecr.us-east-1.amazonaws.com/laravel-prob-image:latest