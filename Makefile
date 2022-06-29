## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

.PHONY: setup

setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.devops
	source ~/.devops/bin/activate

install: requirements.txt
	# This should be run from inside a virtualenv
	pip install --upgrade pip && \
	pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint: Dockerfile app.py
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app.py

validate-circleci: config.yml
	circleci config process .circleci/config.yml

run-circleci-local: config.yml
	circleci local execute

all: install lint test

access-app:
	docker exec -it ml-app bash