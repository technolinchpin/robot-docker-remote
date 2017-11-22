FROM gliderlabs/alpine:3.3

MAINTAINER "Daniel Whatmuff" <danielwhatmuff@gmail.com>

LABEL name="Docker image for the Robot Framework http://robotframework.org/"
LABEL usage="docker run -e ROBOT_TESTS=/path/to/tests/ --rm -v $(pwd)/path/to/tests/:/path/to/tests/ -ti robot-docker"
 
#RUN export http_proxy=$HTTP_PROXY
#RUN export https_proxy=$HTTPS_PROXY
RUN echo "http://dl-1.alpinelinux.org/alpine/3.3/main" >> /etc/apk/repositories; \
    echo "http://dl-4.alpinelinux.org/alpine/3.3/main" >> /etc/apk/repositories; \
    echo "http://dl-5.alpinelinux.org/alpine/3.3/main" >> /etc/apk/repositories


# Install Python Pip and the Robot framework
# RUN apt-get update

RUN apk-install  bash -y py-pip  gcc dbus socat openssh && \
    pip install --upgrade pip && \
    pip install robotframework robotframework-selenium2library selenium && \
    python --version
    
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD ["run.sh"]
