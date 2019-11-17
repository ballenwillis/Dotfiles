# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew install zsh zsh-completions
brew install tmux
brew install reattach-to-user-namespace #tmux requirement"

#Neovim
brew install neovim

# Install `wget` with IRI support.
brew install wget --with-iri

# Github
brew install hub
brew install git

# colored logcat
brew install pidcat

brew install terminal-notifier

# file path picker
brew install fpp

# Yarn package manager to replace npm
brew install yarn --ignore-dependencies

# Remove outdated versions from the cellar.
brew cleanup
