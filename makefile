IMAGE_NAME := cpp
PERSISTENT_VOLUME_DIR := $(shell pwd)

build:
	docker build -t $(IMAGE_NAME) .

start:
	docker run -it --name $(IMAGE_NAME) -v $(PERSISTENT_VOLUME_DIR):/app $(IMAGE_NAME) bash

up:
	docker start $(IMAGE_NAME) && docker exec -it $(IMAGE_NAME) bash