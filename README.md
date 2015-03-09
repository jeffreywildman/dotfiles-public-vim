This repository contains my vim setup.  It uses pathogen to manage plugins installed as submodules, and uses the dotfiles-framework to link and sync across one or more machines.  Install using dotfiles-framework with some additional steps for submodules.


* Use dotfiles-framework to bring this repo under the fold:

        cd ~/dotfiles
        dotfiles.sh clone public-vim git git@github.com:jeffreywildman/dotfiles-public-vim.git

* Install vim plugin submodules before patching and linking:

        cd ~/dotfiles/public-vim
        git submodule update --init
        cd ~/dotfiles
        dotfiles.sh patch public-vim
        dotfiles.sh link public-vim

* Fetching/updating using the dotfiles-framework:

        cd ~/dotfiles
        dotfiles.sh fetch public-vim
        cd ~/dotfiles/public-vim
        git submodule update --remote


Acknowledgements
================

* [pathogen](https://github.com/tpope/vim-pathogen)
* pathogen combined with submodules from [vimcasts](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)
* [dotfiles-framework](https://github.com/wking/dotfiles-framework)
* .vimrc ideas from [dotfiles](https://github.com/mathiasbynens/dotfiles)
