#!/usr/bin/env bash

PHP=php@8.1

xcode-select --install

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor

brew update

brew install wget

if brew ls --versions $PHP > /dev/null; then
  brew link --overwrite $PHP
else
  brew install $PHP
fi

brew install composer

export PATH=$PATH:~/.composer/vendor/bin

brew install dbngin

if brew ls --versions yarn > /dev/null; then
  brew link --overwrite yarn
else
  brew install yarn
fi

composer global require laravel/valet --with-all-dependencies

valet install

valet use $PHP

brew cleanup
