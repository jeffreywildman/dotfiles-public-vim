Clone:

    git clone git://github.com/jeffreywildman/dotvim.git ~/.vim

Create symlink:

    ln -s ~/.vim/vimrc ~/.vimrc

Install submodules:

    cd ~/.vim
    git submodule update --init

Update submodules:

    git submodule foreach git pull origin master

More info: [Vimcasts](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)