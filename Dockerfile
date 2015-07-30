# VERSION:       0.1
# DESCRIPTION:   Containerized OpenCV Python & C++ module

FROM python:2.7.10
MAINTAINER John Andersen johnandersenpdx@gmail.com

# Copy the application
COPY . /opt/opencv-ndarray-conversion

# Run the install script
RUN export DEBIAN_FRONTEND=noninteractive && \
    export no_proxy=".intel.com" && \
    export NO_PROXY=".intel.com" && \
    export http_proxy="http://10.7.211.16:911" && \
    export HTTP_PROXY="http://10.7.211.16:911" && \
    export https_proxy="http://10.7.211.16:911" && \
    export HTTPS_PROXY="http://10.7.211.16:911" && \
    apt-get update -y && \
    apt-get install -y python-numpy libopencv-dev libboost-all-dev && \
    ln /dev/null /dev/raw1394 && \
    cd /opt/opencv-ndarray-conversion && \
    make

# Run the tests
CMD ["/usr/bin/python", "/opt/opencv-ndarray-conversion/test.py"]

