# setup a centos image with bellcore binary components
FROM centos:latest
MAINTAINER Chris Kleeschulte <chrisk@bitpay.com>
RUN yum -y install git curl which xz tar findutils
RUN groupadd bellcore
RUN useradd bellcore -m -s /bin/bash -g bellcore
ENV HOME /home/bellcore
USER bellcore
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
RUN /bin/bash -l -c "nvm install v4 && nvm alias default v4"
RUN /bin/bash -l -c "npm install git://github.com/yutotetuota/bellcore.git -g"

