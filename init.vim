" File loads and Default Settings
let mapleader = ","

" Shortcuts
nnoremap <Leader>erc :split $MYVIMRC<cr>
nnoremap <Leader>src :source $MYVIMRC<cr>
nnoremap <Leader>t :vsplit <bar> :set nonumber <bar> :terminal <CR>i
inoremap jk <esc>

call plug#begin('~/.neovim-plugins')

" Tooling Plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/bash-support.vim'
Plug 'vim-scripts/netrw.vim'
Plug 'vim-scripts/ctags.vim--Johnson'
Plug 'jlanzarotta/bufexplorer'
Plug 'rking/ag.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
" Plug 'Valloric/YouCompleteMe'

call plug#end()

" WSL Only
let uname = substitute(system('uname'),'\n','','')
if uname == 'Linux'
    if system('$PATH')=~ '/mnt/c/WINDOWS'
        set clipboard=unnamedplus " sync system and wsl2 clipboard
    endif
endif

" Theme Customization
set background=dark
let base16colorspace=256
set termguicolors
autocmd vimenter * ++nested colorscheme gruvbox " default gruvbox

" GUI Settings
set noerrorbells
set vb t_vb= " remove beeping sound
set showcmd " show cmd command
set mouse=a " enable mouse usage
set showtabline=1
set guioptions+=e
set guifont=Monospace\ 9
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set number
set history=1000
set nowrap
set tw=0
syntax on

" Tabbing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Autoformatters
let g:rustfmt_autosave=1

" coc config
nnoremap <Leader>h :call CocAction('doHover')<cr>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>

" resize" resize current buffer by +/- 5 
" nnoremap <Up>    :resize -2<CR>
" nnoremap <Down>  :resize +2<CR>
" nnoremap <Left>  :vertical resize -2<CR>
" nnoremap <Right> :vertical resize +2<CR>

" Folds
set nofoldenable
set foldmethod=syntax

" NERDTree Config
let g:NERDTreeWinPos = "left"

nnoremap <Leader>n ::NERDTreeToggle<cr>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Navigation Shortcuts

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <leader>wh :topleft  vnew<CR>
nmap <leader>wl :botright vnew<CR>
nmap <leader>wk :topleft  new<CR>
nmap <leader>wj :botright new<CR>

nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

" default feature enable
set backspace=indent,eol,start

" disable keybindings
inoremap <esc> <nop>
