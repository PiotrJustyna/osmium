FROM fedora:38

ARG USER_NAME=osmium

ARG USER_GROUP_NAME=osmium_group

RUN dnf -y install \
    xz \
    stack

RUN groupadd $USER_GROUP_NAME

RUN useradd -g $USER_GROUP_NAME -m $USER_NAME

USER $USER_NAME
