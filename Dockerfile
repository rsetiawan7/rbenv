FROM ubuntu:bionic

LABEL "Maintainer"="Rachmad Setiawan (rsetiawan7@gmail.com)"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y curl git autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev tzdata
RUN apt-get clean

ARG RBENV_VERSION
ARG RUBY_VERSION

RUN git clone -b v${RBENV_VERSION} https://github.com/rbenv/rbenv.git /root/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:$PATH
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

RUN rbenv install ${RUBY_VERSION}
RUN rbenv global ${RUBY_VERSION} && rbenv rehash