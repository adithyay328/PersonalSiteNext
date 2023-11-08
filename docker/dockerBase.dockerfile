# Inherit from ubuntu 22.04
FROM ubuntu:22.04

# Change bash to sh
SHELL ["/bin/bash", "-c"]

# Workdir = root
WORKDIR /

# Run any apt installs and cleanup after
RUN apt update -y && apt install -y \
    curl \
    python3 \
    python3-pip \
    git \
    && apt clean

# Install nvm
# Setting environment variable that lets us use NVM
ENV NVM_DIR /.nvm
ENV NODE_VERSION 20.9.0

# Creating the NVM_DIR folder so nvm doens't complain
RUN mkdir ${NVM_DIR}

# Getting and installing NVM for node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

#add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# # Init pyenv; we do this manually since pyenv is a bit weird

# # 0. Install pyenv
# RUN curl https://pyenv.run | bash

# # 1. Set environment variable to pyenv binary location
# ENV PYENV_BIN = ~/.pyenv/bin/pyenv

# # 2. Run pyenv init
# RUN ~/.pyenv/bin/pyenv init -

# RUN echo 'export PYENV_ROOT="~/.pyenv"' >> ~/.bashrc
# RUN echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
# RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc

# RUN echo 'export PYENV_ROOT="~/.pyenv"' >> ~/.profile
# RUN echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
# RUN echo 'eval "$(pyenv init -)"' >> ~/.profile

# RUN echo 'export PYENV_ROOT="~/.pyenv"' >> ~/.bash_profile
# RUN echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
# RUN echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

# RUN exec "$SHELL"

# # Add pyenv root to path
# ENV PATH $PYENV_ROOT/bin:$PATH

# # Install python 3.11.5
# RUN source ~/.bashrc

# RUN ~/.pyenv/bin/pyenv install 3.11.5