FROM python:3.6-stretch
COPY . /work
WORKDIR /work
RUN pip3 install -r requirements.txt
EXPOSE 5000
CMD python3 test.py