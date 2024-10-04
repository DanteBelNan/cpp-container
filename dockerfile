FROM ubuntu:latest

RUN apt-get update && apt-get install -y build-essential

WORKDIR /app

COPY . .


#Tengo que poder hacer que por defecto se lea el compile_cpp.sh
