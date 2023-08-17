set encoding=UTF-8
" File loads and Default Settings
let mapleader = ","

" Shortcuts
nnoremap <Leader>erc :vsplit $MYVIMRC<cr>
nnoremap <Leader>src :source $MYVIMRC<cr>
" nnoremap <Leader>t :call InitTerminal() <cr>
nnoremap <Leader>t :FloatermToggle<cr>
nnoremap <leader>b :!./build.sh<CR>
inoremap jk <esc>

" disable keybindings
inoremap <esc> <nop>

call plug#begin('~/.neovim-plugins')

" Tooling Plugins
Plug 'scrooloose/nerdtree'
" Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'voldikss/vim-floaterm'

" Plug 'rust-lang/rust.vim'
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
Plug 'jiangmiao/auto-pairs'
Plug 'Azul3DInc/ClangToStringTemplate', {'rtp': 'cpp-gen/'}

call plug#end()

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
nnoremap <Leader>o :call CocAction('runCommand', 'rust-analyzer.openDocs')<cr>
nnoremap <Leader>e :call CocAction('runCommand', 'rust-analyzer.explainError')<cr>
nnoremap <Leader>h :call CocAction('doHover')<cr>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>

" Folds
set nofoldenable
set foldmethod=syntax

" NERDTree Config
let g:NERDTreeWinPos = "left"

nnoremap <Leader>n :NERDTreeToggle<cr>
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

" WSL only
let g:netrw_wsl_cmd = "wslview"
let g:clipboard = {
  \   'name': 'WslClipboard',
  \   'copy': {
  \      '+': 'clip.exe',
  \      '*': 'clip.exe',
  \    },
  \   'paste': {
  \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \   },
  \   'cache_enabled': 0,
  \ }

" default feature enable
set backspace=indent,eol,start

" Autocommands
" autocmd VimEnter * FloatermNew
autocmd VimEnter * NERDTreeToggle 

