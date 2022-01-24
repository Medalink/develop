#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

xcode-select --install

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew install wget

brew install php

brew install composer

brew install dbngin

brew install yarn

composer global require laravel/valet --with-all-dependencies

valet install

valet use php@8.1

brew cleanup
