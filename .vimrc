"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)

set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install —all' }
Plugin 'junegunn/fzf.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"n 'pangloss/vim-javascript'Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just
"PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-------------------------------------------------------------------------------------
if (empty($TMUX))
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bf.. >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869.. >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#.. >
if (has("termguicolors"))
set termguicolors
endif
endif
map <C-n> :NERDTreeToggle<CR>
set ruler
set showmode
set t_Co=256
set number
set rtp+=~/.fzf
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight LineNr ctermbg=NONE ctermfg=1
highlight Operator ctermfg=1
highlight Keyword ctermfg=1
highlight CursorLineNr ctermfg=1
highlight Conditional ctermfg=1
set linespace=10
imap <C-Return> <CR><CR><C-o>k<Tab>
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%100v.\+/
set runtimepath^=~/.vim/bundle/ag
let g:ag_working_path_mode="r"
map <C-f> :FZF <Return>
