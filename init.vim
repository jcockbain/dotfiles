set relativenumber
set number
set noswapfile 
set nobackup
set clipboard=unnamedplus

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'wadackel/vim-dogrun'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v1.*'}
Plug 'chriskempson/base16-vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'hashivim/vim-terraform'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'  " git change information
Plug 'tpope/vim-fugitive'  " various git functions
Plug 'RRethy/vim-illuminate'  " highlight work under cursor
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'marcuscaisey/please.nvim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons' " this must be last!
call plug#end()

"================================================
" Key mappings, shortcuts
"================================================
let mapleader = "\<Space>" "change the leader key from the default backslash to space

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :vs $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>p :Files<cr>

map <silent> [b :bprevious<cr>
map <silent> ]b :bnext<cr>
map <silent> [B :bfirst<cr>
map <silent> ]B :blast<cr>
map <C-n> :NERDTreeToggle<CR>

" Remap for rename curent word
nmap <leader>r <Plug>(coc-rename)

" For moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""================================================
" NERDTree
" "================================================
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=60

" reveal current file
nmap <leader>m :NERDTreeFind <CR> 
" show function all function and struct names in file
nmap <leader>gd :GoDecls <CR>

" nerd tree devicons font
set guifont=FiraCode\ Nerd\ Font\ Retina\ 11


"""================================================
"  Visual
" "================================================
set termguicolors
syntax on
colorscheme PaperColor
hi normal guibg=none ctermbg=none

set ts=4 sts=4 sw=4 expandtab
set cursorline

let g:airline_theme='bubblegum'
filetype on 
filetype plugin on
filetype indent on
let g:indentLine_char = '⦙'
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

""""================================================
"  Python
" "================================================
set expandtab
set tabstop=4
set shiftwidth=4
set expandtab
let python_highlight_all = 1
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

""""================================================
"  Go
" "================================================
let g:go_fmt_command = "goimports"
" syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_fmt_autosave = 1
" status bar
let g:go_auto_type_info = 1
" matching identifiers
let g:go_auto_sameids = 1
let g:go_auto_type_info
" goinfo quickly
set updatetime=100

" vim-airline 
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

" plz plugin
nnoremap <silent> <leader>pj<cmd>Please jump_to_target<cr>
nnoremap <silent> <leader>pb<cmd>Please build<cr>
nnoremap <silent> <leader>pt<cmd>Please test<cr>
nnoremap <silent> <leader>pct<cmd>Please test under_cursor<cr>
nnoremap <silent> <leader>pr<cmd>Please run<cr>
nnoremap <silent> <leader>py<cmd>Please yank<cr>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

lua require('configure-treesitter')

au BufRead,BufNewFile BUILD,*.build_def set filetype=please
au BufRead,BufNewFile BUILD,*.build_def,*.build_defs set syntax=python

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'yaml': ["yamlfix"],
\}
