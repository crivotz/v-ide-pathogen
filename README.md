# V-ide

Vim custom configuration, oriented for web developers (rails, ruby, php, html, css, SCSS, javascript).  
I use this repository mainly to keep track of the changes that I made on my Vim configuration.  
But I hope that it will be useful to other

Thanks to the developers of these plugins/color schemes

![v-ide screenshot](https://raw.githubusercontent.com/crivotz/v-ide/master/v-ide_screenshot.png)

---

**ACTIVE PLUGINS**

* [vim-pathogen](https://github.com/tpope/vim-pathogen): One ring to rule them all
* [Vim-Airline](https://github.com/bling/vim-airline): lean & mean status/tabline for vim that's light as air
* [Vim-Airline-theme](https://github.com/vim-airline/vim-airline-themes): A collection of themes for vim-airline
* [Tmuxline](https://github.com/edkolev/tmuxline.vim): Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration
* [Calendar](http://www.vim.org/scripts/script.php?script_id=52): Show a calendar
* [Delimitmate](https://github.com/Raimondi/delimitMate): Provides insert mode auto-completion for quotes, parens, brackets, etc.
* [Gitgutter](https://github.com/airblade/vim-gitgutter): shows a git diff in the gutter (sign column) and stages/reverts hunks.
* [Neocomplete](https://github.com/Shougo/neocomplete.vim): Auto-completion system
* [Neosnippet](https://github.com/Shougo/neosnippet.vim): The Neosnippet plug-In adds snippet support to Vim. Snippets are small templates for commonly used code that you can fill in on the fly
* [Rails](https://github.com/tpope/vim-rails): Ruby on Rails power tools
* [Fugitive](https://github.com/tpope/vim-fugitive): Git wrapper
* [Scss_syntax](https://github.com/cakebaker/scss-syntax.vim): Vim syntax file for scss
* [Tagbar](http://majutsushi.github.io/tagbar/): Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure
* [Abolish](https://github.com/tpope/vim-abolish): easily search for, substitute, and abbreviate multiple variants of a word
* [Numbers](https://github.com/myusuf3/numbers.vim): alternates between relative numbering (relativenumber) and absolute numbering (number) for the active window depending on the mode you are in
* [Searchcomplete](http://www.vim.org/scripts/script.php?script_id=474): Tab completion of words inside of a search ('/')
* [Surround](https://github.com/tpope/vim-surround): quoting/parenthesizing made simple
* [Vim-css-color](https://github.com/ap/vim-css-color.git): color hex codes and color names
* [vim-bundler](https://github.com/tpope/vim-bundler): Lightweight support for Ruby's Bundler
* [vim-json](https://github.com/elzr/vim-json.git): A better JSON for Vim: distinct highlighting of keywords vs values
* [vim-ruby](https://github.com/vim-ruby/vim-ruby.git): ruby toolbox
* [vim-easymotion](https://github.com/Lokaltog/vim-easymotion): Vim motions on speed!
* [gundo](https://github.com/sjl/gundo.vim/): Graph your Vim undo tree in style
* [vim-capslock](https://github.com/tpope/vim-capslock.git): Software capslock (disable hw key via OS)
* [vim-tags](https://github.com/szw/vim-tags.git): Ctags generator for Vim
* [vim-repeat](https://github.com/tpope/vim-repeat.git): enable repeating supported plugin maps with.
* [rainbow parentheses](https://github.com/junegunn/rainbow_parentheses.vim): Simple Rainbow Parentheses
* [emmet-vim](https://github.com/mattn/emmet-vim.git): [emmet](http://emmet.io) for vim
* [vim-endwise](https://github.com/tpope/vim-endwise.git): wisely add "end" in ruby, endfunction/endif/more in vim script, etc
* [vim-rvm](https://github.com/tpope/vim-rvm): Switch Ruby versions from inside Vim
* [vim-signature](https://github.com/kshenoy/vim-signature.git): Plugin to toggle, display and navigate marks
* [indentLine](https://github.com/yggdroot/indentline): A vim plugin to display the indention levels with thin vertical lines
* [far](https://github.com/brooth/far.vim): Find and replace vim plugin
* [vim-rooter](https://github.com/airblade/vim-rooter): Change Vim wd to project root (identified by presence of known directory or file)
* [vimux](https://github.com/benmills/vimux): vim plugin to interact with tmux
* [fzf.vim](https://github.com/junegunn/fzf.vim): fzf loves vim
* [vim-smooth-scroll](https://github.com/terryma/vim-smooth-scroll): Make scrolling in Vim more pleasant
* [startuptime](https://github.com/tweekmonster/startuptime.vim): Breakdown Vim's --startuptime output
* [vim-commentary](https://github.com/tpope/vim-commentary): Comment stuff out
* [vim-searchindex](https://github.com/google/vim-searchindex): display number of search matches & index of a current match
* [vim-dispatch](https://github.com/tpope/vim-dispatch.git): asynchronous build and test dispatcher.
* [ranger.vim](https://github.com/francoiscabrol/ranger.vim): Ranger integration.
* [Ale](https://github.com/w0rp/ale): Asynchronous Lint Engine
* [devdocs](https://github.com/rhysd/devdocs.vim): Open devdocs.io from Vim
* [vim-devicons](https://github.com/ryanoasis/vim-devicons.git): Adds file type glyphs/icons to popular Vim plugins
* [vim-tmux-focus](https://github.com/tmux-plugins/vim-tmux-focus-events.git): Make terminal vim and tmux work better together
* [vim-twiggy](https://github.com/sodapopcan/vim-twiggy.git): Git branch management for Vim
* [vim-dadbod](https://github.com/tpope/vim-dadbod): Modern database interface for Vim
* [vim-prettier](https://github.com/prettier/vim-prettier): A Vim plugin for Prettier
* [NrrwRgn](https://github.com/chrisbra/NrrwRgn): A Narrow Region Plugin for Vim
* [Ctrlsf](https://github.com/dyng/ctrlsf.vim): An ack.vim alternatives mimics Ctrl-Shift-F on Sublime Text 2  
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): True Sublime Text style multiple selections for Vim  

**COLOR SCHEMES**

* [Base16](https://github.com/chriskempson/base16-vim)

**SYNTAX**

* CSS
* Eruby
* Javascript
* Coffeescript
* PHP
* HTML
* Ruby
* SCSS
* JSON

**INSTALLATION**

```console
git clone git://github.com:crivotz/v-ide.git ~/.v-ide
cd ~.v-ide
git submodule update --init --recursive
ln -s ~/.v-ide/_vimrc .vimrc
ln -s ~/.v-ide/vim .vim
ln -s ~/.v-ide/_vimrc_background .vimrc_background
```

**UPDATE**

```console
cd
cd .v-ide
git pull
git submodule update --remote --merge
```

**DEPENDENCIES**

* Vim compiled with ruby and lua
* [BASE16-SHELL](https://github.com/chriskempson/base16-shell)
* [Exuberant ctags](http://ctags.sourceforge.net)
* [FZF](https://github.com/junegunn/fzf)
* [Ranger](http://ranger.nongnu.org)
* [Prettier](https://prettier.io)

**SUGGESTION**

* Font: [Knack Nerd fonts](https://github.com/ryanoasis/nerd-fonts) or DejaVu Sans Mono for Powerline or [Hack](http://sourcefoundry.org/hack)
* [The silver searcher](https://github.com/ggreer/the_silver_searcher.git): A code-searching tool similar to ack, but faster
