#Makefile

include ./include.mk

help:
	@echo "$(TAG) will build for $(CI_PROJECT_NAME)"
	@echo "make build    = build docker images"
	@echo "make push     = push image to repository"

build-app:
	@echo "build image for $(IMG)/app"
	docker build -t "$(IMG):$(TAG)" \
		-f build/Dockerfile .
	docker tag "$(IMG):$(TAG)" "$(IMG):latest"

push:
	docker push $(IMG):latest
	docker push $(IMG):$(TAG)

build: build-app
	@echo "done building image for $(CI_PROJECT_NAME)"

deploy:
	$(MAKE) -C docker deploy