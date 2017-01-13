" Vim Configuration

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
set incsearch
set exrc
set listchars=eol:\ ,tab:╾-,space:·
hi SpecialKey ctermfg=DarkGray
set list
" set colorcolumn=80

" Vundle Plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
Plugin 'embear/vim-localvimrc'

call vundle#end()
filetype plugin indent on

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

" localvimrc
let g:localvimrc_whitelist='\(/home/ryan/dev/.*\|/home/ryan/Dropbox/Ryan/School/CurrentClasses/.*\|/srv/http/.*\)'
let g:localvimrc_sandbox=0

" Environment Setups

map <F5> :Make!<CR>

function! BuildTypescript()
	set makeprg=tsc
	execute "Make"
endfunction

function! BuildCordova()
	set makeprg=cordova\ run\ android
	execute "Make!"
endfunction

function! BuildAngular()
	set makeprg=npm\ run\ js
	execute "Make!"
endfunction

function! BuildScss()
	set makeprg=npm\ run\ sass
	execute "Make!"
endfunction

function! Preprocess()
	set makeprg=npm\ run\ pp
	execute "Make!"
endfunction

function! TypescriptProject()
	let g:ctrlp_custom_ignore = {
				\ 'dir': '\v[\/](\.?(node_modules|sass_cache|platforms|typings)|(plugins?))$',
				\ 'file': '\v((\.js(\.map)?)|empty)$'
				\ }
	command! BuildTsc call BuildTypescript()
	command! BuildS call BuildScss()
	map <F5> :BuildTsc<CR>
	map <F4> :BuildS<CR>
endfunction

function! CordovaProject()
	command! BuildC call BuildCordova()
	map <F2> :BuildC<CR>
endfunction

function! Angular1Project()
	let g:ctrlp_custom_ignore = {
				\ 'dir': '\v[\/](\.?(node_modules|sass_cache|app))$',
				\ 'file': '\v[\/](empty|\.keep)$'
				\ }
	command! BuildAng call BuildAngular()
	command! BuildS call BuildScss()
	command! Prep call Preprocess()
	map <F5> :BuildAng<CR>
	map <F4> :BuildS<CR>
	map <F3> :Prep<CR>
endfunction

set secure

