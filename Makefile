IMAGE_TAG    = v0.0.1
IMAGE_NAME   = bosonproject/node-function-invoker
DOCKER_IMAGE = docker.io/$(IMAGE_NAME):$(IMAGE_TAG)
QUAY_IMAGE   = quay.io/$(IMAGE_NAME):$(IMAGE_TAG)
TEST_IMAGE   = $(IMAGE_NAME):$(IMAGE_TAG)-candidate

.PHONY: build test clean

build: test
	docker build -t $(DOCKER_IMAGE) .
	docker tag $(IMAGE_NAME):$(IMAGE_TAG) $(TEST_IMAGE)
	# docker build -t $(QUAY_IMAGE) .

test:
	npm test

clean:
	docker rmi -f `docker images $(TEST_IMAGE) -q`
	docker rmi -f `docker images $(IMAGE_NAME) -q`

publish: build
	# docker push $(QUAY_IMAGE)
	docker push $(DOCKER_IMAGE)
