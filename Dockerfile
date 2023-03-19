# importing the environmet
FROM python:3.8-slim-buster

# updating apk-tools
RUN apk -U upgrade

# making working directory inside docker
RUN mkdir /b2_fly

# seting the working directory
WORKDIR /b2_fly

# copy packahe.json to working diectory
COPY package.json .

# installing all production dependencies in docker
RUN npm install --only=production


# copying all files in current directory to docker working directory
COPY . .
RUN apk add curl
RUN apk update && apk add bash
EXPOSE 3000

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8
# Define the version of OpenJDK we want
ENV PYTHON_VERSION=3.8.16
ENV FLYWAY_VERSION 8.4.3
