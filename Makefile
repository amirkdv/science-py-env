IMAGE=amirkdv/science-py
build:
	cat Dockerfile | docker build -t $(IMAGE) -

test:
	cat test.sh | docker run -i $(IMAGE) sh -
