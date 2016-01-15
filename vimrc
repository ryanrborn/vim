" Vim Configuration

execute pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
set encoding=utf-8
set spell spelllang=en_us
set guifont=Menlo:h14
set nocompatible
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set scrolloff=3
set autoindent
set showmatch
set wrap
set linebreak
set relativenumber
set noswapfile
set splitbelow
set splitright
" set colorcolumn=80

" Aesthetics

" colorscheme solarized
set background=dark

" Mappings and shortcuts

" Basics

inoremap jk <ESC>
let mapleader = ","
nnoremap <leader>jd :YcmCompleter GoTo<CR>
map <leader>f :Explore<cr>

" Normal Mode Maps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Visual Maps
vnoremap <silent> ,! :s/^ \?/!/<CR>:noh<CR>
vnoremap <silent> ," :s/^ \?/\"/<CR>:noh<CR>
vnoremap <silent> ,# :s/^ \?/#/<CR>:noh<CR>
vnoremap <silent> ,% :s/^ \?/%/<CR>:noh<CR>
vnoremap <silent> ,; :s/^ \?/;/<CR>:noh<CR>
vnoremap <silent> ,/ :s/^\(  \)\?/\/\//<CR>:noh<CR>
vnoremap <silent> ,- :s/^\(  \)\?/--/<CR>:noh<CR>
vnoremap <silent> ,> :s/^\(  \)\?/> /<CR>:noh<CR>

vmap # ,#
vmap ; ,;
vmap / ,/
vmap - ,-

vnoremap ,c :s/^\s*\([!"#%;]\\|\/\/\\|--\\|> \\|\/\*\\|<!--\)//<CR>:'<,'>s/\s*\(\*\/\\|-->\\|\)\s*$//<CR>:noh<CR>`<=`>


" Spelling
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=red term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SepllLocal term=underline cterm=underline

" Commands
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ctp set omnifunc=htmlcomplete#CompleteTags

" YCM
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_extra_conf_globlist = ['~/.ycm_extra_conf.py']

" tests

