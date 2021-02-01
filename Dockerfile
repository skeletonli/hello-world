FROM ubuntu:16.04
COPY . /work
WORKDIR /work
RUN python3.7 -m pip install pip --upgrade
RUN pip3 install -r requirements.txt
CMD python3 docker.py