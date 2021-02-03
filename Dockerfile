FROM ubuntu:16.04
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:jonathonf/python-3.6 -y && \
    apt-get update && \
    apt-get install -y git python3.6 python3-pip nginx vim supervisor mongodb libsm6 libxrender1 libxext-dev ffmpeg redis-server && \
    pip3 install --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple pip setuptools && \

RUN apt-get update -y && \
    apt-get install -y locales

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY . /work
WORKDIR /work
RUN pip3 install -r requirements.txt
CMD python3 docker.py