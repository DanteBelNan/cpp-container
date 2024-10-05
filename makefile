IMAGE_NAME := cpp
PERSISTENT_VOLUME_DIR := $(shell pwd)

build:
	docker build -t $(IMAGE_NAME) .

start:
	docker run -it --name $(IMAGE_NAME) -v $(PERSISTENT_VOLUME_DIR):/app $(IMAGE_NAME) bash -c "source compile.sh; export -f compile; bash"

up:
	docker start $(IMAGE_NAME) && docker exec -it $(IMAGE_NAME) bash -c "source compile.sh; bash"

down:
	docker stop $(IMAGE_NAME)
	docker rm $(IMAGE_NAME)

.PHONY: all
all: rebuild run