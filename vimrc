" Vim Configuration

execute pathogen#infect()

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
set expandtab
set scrolloff=3
set autoindent
set showmatch
set wrap
set linebreak
set number
" set colorcolumn=80

" Aesthetics

" colorscheme solarized
set background=dark

" Mappings and shortcuts

" Basics

inoremap jk <ESC>
let mapleader = ","


" Spelling
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=red term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SepllLocal term=underline cterm=underline

