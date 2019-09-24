#!/bin/sh

export RBENV_VERSION=$(cat RBENV)
export RUBY_VERSION=$(cat VERSION)

echo "rbenv version: $RBENV_VERSION"
echo "ruby version: $RUBY_VERSION"

docker build -t sheenidgs/rbenv:$RBENV_VERSION-$RUBY_VERSION \
--build-arg RBENV_VERSION=$RBENV_VERSION \
--build-arg RUBY_VERSION=$RUBY_VERSION .

# docker push sheenidgs/rbenv:$RBENV_VERSION-$RUBY_VERSION