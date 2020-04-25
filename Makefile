build:
	docker build -t docker.io/bosonproject/node-function-runtime:v0.0.1 .

publish: build
	docker push docker.io/bosonproject/node-function-runtime:v0.0.1
