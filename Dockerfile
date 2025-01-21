# Use the official Ubuntu base image
FROM ubuntu:22.04
ARG USER_NAME
ARG USER_ID
ARG GROUP_ID
# Update the package lists
RUN apt-get update -y
ENV USER_HOME=/home/${USER_NAME}
# RUN addgroup --gid ${GROUP_ID} docker && \
#     adduser --disabled-password --gecos '' --uid ${USER_NAME} --gid ${GROUP_ID} docker
RUN groupadd -g ${GROUP_ID} ${USER_NAME}
RUN useradd -u ${USER_ID} -g ${USER_NAME} -m -d ${USER_HOME} ${USER_NAME}
#RUN usermod -aG docker ${USER_NAME}
RUN apt-get install -y  gawk wget git diffstat unzip \
texinfo gcc build-essential chrpath socat cpio python3 \
python3-pip python3-pexpect xz-utils debianutils iputils-ping \
python3-git libegl1-mesa libsdl1.2-dev python3-subunit \
mesa-common-dev zstd liblz4-tool file locales libacl1
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y python3-jinja2
RUN locale-gen en_US.UTF-8
RUN apt-get install python2 -y
RUN apt-get install screen -y
RUN ln -s /usr/bin/python2 /usr/bin/python
USER ${USER_NAME}
WORKDIR ${USER_HOME}


