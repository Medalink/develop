#!/usr/bin/env bash

xcode-select --install

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew install wget

brew install php@8.1

brew install composer

brew install dbngin

brew install yarn

composer global require laravel/valet --with-all-dependencies

valet install

valet use php@8.1

brew cleanup
