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
cabbrev Qa! qa!

" disable keybindings
inoremap <esc> <nop>

call plug#begin('~/.neovim-plugins')

" Tooling Plugins
Plug 'scrooloose/nerdtree'
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'

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
Plug 'hashivim/vim-terraform'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'rhysd/git-messenger.vim'
Plug 'pangloss/vim-javascript'
Plug 'puremourning/vimspector'

Plug 'LnL7/vim-nix'

call plug#end()

" Theme Customization
set background=dark
let base16colorspace=256
autocmd vimenter * ++nested colorscheme gruvbox " default gruvbox

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" GUI Settings
set noerrorbells
set vb t_vb= " remove beeping sound
set showcmd " show cmd command
set mouse=a " enable mouse usage
set showtabline=1
set guioptions+=e
" set guifont=Monospace\ 9
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
nnoremap <Leader>h :call CocAction('doHover')<cr>
nnoremap <Leader>j :call CocAction('diagnosticNext')<cr>
nnoremap <Leader>k :call CocAction('diagnosticPrevious')<cr>
nnoremap <Leader>es :CocCommand eslint.executeAutofix<cr>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


filetype plugin indent on

" ======= coc settings
set updatetime=300
set shortmess+=c

nnoremap <leader>fl :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('&lt;cword&gt;')
  else
    call CocAction('doHover')
  endif
endfunction

let s:LSP_CONFIG = {
\  'flow': {
\    'command': exepath('flow'),
\    'args': ['lsp'],
\    'filetypes': ['javascript', 'javascriptreact'],
\    'initializationOptions': {},
\    'requireRootPattern': 1,
\    'settings': {},
\    'rootPatterns': ['.flowconfig']
\  }
\}

let s:languageservers = {}
for [lsp, config] in items(s:LSP_CONFIG)
  let s:not_empty_cmd = !empty(get(config, 'command'))
  if s:not_empty_cmd | let s:languageservers[lsp] = config | endif
endfor

if !empty(s:languageservers)
  call coc#config('languageserver', s:languageservers)
  endif

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

" Default feature enable
set backspace=indent,eol,start

" Neovide
if exists("g:neovide")
  let g:neovide_input_use_logo=v:true
  map <D-v> "+p<CR>
  map! <D-v> <C-R>+
  tmap <D-v> <C-R>+
  vmap <D-c> "+y<CR>
endif


" Vimspector
nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval
nnoremap <Leader>bp <Plug>VimspectorToggleBreakpoint
nnoremap <Leader>vi :call vimspector#Launch()<CR>
