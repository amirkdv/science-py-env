IMAGE=amirkdv/science-py-env
build:
	cat Dockerfile | docker build -t $(IMAGE) -

test:
	cat test.py | docker run -i $(IMAGE) sh -c '. /$$SCI_PY_ENV/bin/activate && python -'
