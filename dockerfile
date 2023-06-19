FROM debian:12.0-slim

# --- input ---------------------------------- #

ARG USER_NAME=osmium

ARG USER_GROUP_NAME=osmium_group

ARG GHC_VERSION="9.2.8"

# --- constants ------------------------------ #

ENV GHCUP_CURL_OPTS="-k"

ENV BOOTSTRAP_HASKELL_NONINTERACTIVE="1"

ENV BOOTSTRAP_HASKELL_GHC_VERSION="$GHC_VERSION"

ENV BOOTSTRAP_HASKELL_CABAL_VERSION="recommended"

# --- ghcup installation preparation --------- #

RUN apt update

RUN apt-get -y install \
    gcc \
    libgmp-dev \
    libnuma-dev \
    curl \
    make

# --- non-root user creation ----------------- #

RUN groupadd "$USER_GROUP_NAME"

RUN useradd -g "$USER_GROUP_NAME" -m "$USER_NAME"

USER "$USER_NAME"

# --- ghcup installation --------------------- #

RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

ENV PATH="/home/$USER_NAME/.cabal/bin:/home/$USER_NAME/.ghcup/bin:/home/$USER_NAME/.local/bin:$PATH"