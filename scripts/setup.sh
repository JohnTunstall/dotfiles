# install spacevim
curl -sLf https://spacevim.org/install.sh | bash

## setup spacevim config
bash ./spacevim_setup.sh

# install homebrew if it isn't installed
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# install nice brew utility packages
brew install tree

# install fish
brew install fish

## setup fish config
bash ./fish_setup.sh
