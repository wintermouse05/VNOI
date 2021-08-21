syntax enable
syntax on
set number relativenumber
set tabstop=4
set autoindent
set expandtab
set clipboard=unnamedplus
set  shiftwidth=4
set cursorline
" Gọi đầu tiên
call plug#begin('~/.vim/plugged')

" Cài plugin Shorthand notation;  https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Hoặc sử dụng đường dẫn trực tiếp luôn
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Cài đặt nhiều Plugin bằng cách sử |
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Loading sau khi cài Plugin. 
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Cài plugin với branch tùy chọn
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Cài plugin bằng tag released
Plug 'fatih/vim-go', { 'tag': '*' }

" Tùy chọn khi cài plugin
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
" Cài plugin từ bên ngoài ~/.vim/plugged với post-update
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'

" Kết thúc việc cài plugin
call plug#end()
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()          
filetype plugin indent on
