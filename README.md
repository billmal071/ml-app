# UDACITY PROJECT 4: ML Microservice

[![CircleCI](https://circleci.com/gh/billmal071/ml-app.svg?style=svg)](https://app.circleci.com/pipelines/github/billmal071/ml-app/3/workflows/40583341-a365-4603-8596-7578b99d766b)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API.

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:

* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

## Summary

This a ML preidction app that is written in python and can be run using docker and kubernetes. The project involves creating a dockerfile to containerize the app, then running the image and then pushing it to docker hub. Then we use kubernetes as container orchestrator to deploy the apps. Then test it on both environments.

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv.
* 

```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```

* Run `make install` to install the necessary dependencies
* The makefile contains all other neccessary commands.

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`
4. Run test against docker and kubernetes:  `./make_prediction.sh`
5. Upload docker image to Docker Hub:  `./upload_docker.sh`

## Kubernetes Steps

### Setup and Configure Docker locally

1. install docker as described in the [link](https://docs.docker.com/engine/install/ubuntu/).
2. create a virtual environment by running `make setup`
3. then run `make install` to install the required things
4. run `make lint` to check Dockerfile
5. run `make build-app` to containerize the app
6. run `./run_docker.sh` to run the docker image
7. finally run `./make_prediction.sh` to query the app in the container
  
### Setup and Configure Kubernetes locally

1. You can install k3s from rancher or use minikube
2. The steps are provided in the run_kubernetes.sh script

### Create Flask app in Container

1. run `make build-app` to containerize the app
2. run `./run_docker.sh` to run the docker image

### Run via kubectl

1. do `chmod +x run_kubernetes.sh` to make it executable
2. then `./run_kubernetes.sh` to run the script
3. finally run `./make_prediction.sh` to query the app in the kubernetes environment

## Files Explained

* *.sh - the shell files are the scripts for running the project
* Makefile: the reusable commands are stored here
* requirements.txt: the list of dependencies is stored here
* output_txt_files: the output data is stored here for the docker and kubernetes logs
* config.yml: the configuration for the circleci
* model_data: the ML model data
* Dockerfile: the Dockerfile for the container
  