# load /etc/shells into a var
fishconfig=$(grep '/usr/local/bin/fish' /etc/shells)
echo $fishconfig
if [[ ! $fishconfig ]]; then
  echo 'fish not found in /etc/shells, adding it in...'
  echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
else
  echo 'fish found in /etc/shells.'
fi

# set fish as the default shell if it isn't already
defaultshell=$SHELL
if [[ $defaultshell = '/usr/local/bin/fish' ]]; then
  echo 'fish is already the default shell.'
else
  echo 'setting fish as default shell...'
  chsh -s /usr/local/bin/fish
fi

# set custom fish configuration
echo 'exporting fish config from this repo to local setup...'
scriptpath="$(cd "$(dirname "$0")" && pwd)"
cp -rf $scriptpath/../fish/ ~/.config/fish
source ~/.config/fish/*.fish
echo 'done.'
