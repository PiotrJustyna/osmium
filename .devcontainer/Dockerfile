FROM fedora:37

ENV LANG C.UTF-8

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN dnf -y install \
    git \
    numactl-libs \
    gcc \
    gcc-c++ \
    gmp \
    gmp-devel \
    make \
    ncurses \
    ncurses-compat-libs \
    xz \
    perl \
    awscli

ENV TZ=Europe/Dublin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN groupadd --gid $USER_GID $USERNAME
RUN useradd -s /bin/bash --uid $USER_UID --gid $USERNAME -m $USERNAME

USER $USERNAME

ENV GHC_VERSION="recommended"
ENV GHCUP_CURL_OPTS="-k"
ENV BOOTSTRAP_HASKELL_NONINTERACTIVE="1"
ENV BOOTSTRAP_HASKELL_GHC_VERSION="$GHC_VERSION"
ENV BOOTSTRAP_HASKELL_CABAL_VERSION="recommended"

RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

ENV PATH="/workspaces/osmium:/home/$USERNAME/.cabal/bin:/home/$USERNAME/.ghcup/bin:$PATH"