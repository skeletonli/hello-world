FROM ubuntu:16.04
RUN apt-get update -y && \
apt-get install -y vim && \
apt-get install -y software-properties-common && \
add-apt-repository ppa:jonathonf/python-3.6

RUN apt-get update
RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv

# update pip
RUN python3.6 -m pip install pip --upgrade && \
python3.6 -m pip install wheel

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