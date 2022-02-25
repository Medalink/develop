#!/usr/bin/env bash

echo "Starting the setup process"

echo "Which php version you would like to use?"
PS3="Enter a number (1 or 2): "
select phpversion in 7.4 8.1
do
break;
done

PHP="php@$phpversion"
echo "Using $PHP"

echo "Checking if xcode-select is installed"
if test ! $(which xcode-select); then
  echo "xcode-select not found. Installing"
  xcode-select --install
fi
echo "xcode-select is installed"

echo "Checking if brew is installed"
if test ! $(which brew); then
  echo "homebrew (brew) not found. Installing"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "brew is installed"

echo "Running brew doctor"
brew doctor

echo "Running brew update"
brew update

echo "Checking if wget is installed"
if test ! $(which wget); then
  echo "wget not found. Installing"
  brew install wget
fi
echo "wget is installed"

echo "Checking if $PHP is installed"
if brew ls --versions $PHP > /dev/null; then
  echo "$PHP is installed"
  echo "Setting as default"
  brew link --overwrite $PHP
else
  echo "$PHP not found. Installing"
  brew install $PHP
fi

echo "Checking if composer is installed"
if test ! $(which composer); then
  echo "composer not found. Installing"
  brew install composer
  export PATH=$PATH:~/.composer/vendor/bin
fi
echo "composer is installed"

echo "Checking if dbngin is installed"
if test ! $(which dbngin); then
  echo "dbngin not found. Installing"
  brew install dbngin
fi
echo "dbngin is installed"

echo "Checking if yarn is installed"
if brew ls --versions yarn > /dev/null; then
  echo "yarn is installed. link to /usr/bin"
  brew link --overwrite yarn
else
  echo "yarn not found. Installing"
  brew install yarn
fi

echo "Checking if valet is installed"
if test ! $(which valet); then
  echo "valet not found. Installing"
  composer global require laravel/valet --with-all-dependencies
  valet install
fi

echo "valet is installed"
echo "Set valet to use $PHP version"
valet use $PHP

echo "Installation is complete. Cleaning up"
brew cleanup
