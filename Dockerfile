FROM quay.io/fedora/fedora:38
MAINTAINER bjozsa bjozsa@jinkit.com

ENV WORKDIR=/opt/AmiiboConverter/
ENV DATA=/opt/AmiiboConverter/data

RUN mkdir -p $DATA
COPY AmiiboConverter.py requirements.txt /opt/AmiiboConverter/ 

RUN yum install python3-pip -yy && \
    python3 -m pip install -r /opt/AmiiboConverter/requirements.txt

WORKDIR $DATA

ENTRYPOINT ["python3", "/opt/AmiiboConverter/AmiiboConverter.py"]

CMD ["-h"]
