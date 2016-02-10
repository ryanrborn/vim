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

" Environment Setups

map <F5> :Make!<CR>

function! BuildTypescript()
	set makeprg=tsc
	execute "Make"
endfunction

function! TypescriptProject()
	let g:ctrlp_custom_ignore = {
				\ 'dir': '\v[\/](\.?(node_modules|sass_cache|platforms|typings)|(plugins?))$',
				\ 'file': '\v((\.js(\.map)?)|empty)$'
				\ }
	command! BuildTsc call BuildTypescript()
	map <F5> :BuildTsc<CR>
endfunction

function! BuildCordova()
	set makeprg=cordova\ run\ android
	execute "Make!"
endfunction

function! CordovaProject()
	command! BuildC call BuildCordova()
	map <F4> :BuildC<CR>
endfunction

" autocmd
function! SetupEnvironment()
	let l:path = expand('%:p')
	if l:path =~ '/srv/http/crewtracks/cordova'
		call TypescriptProject()
		call CordovaProject()
	endif
	if l:path =~ '/srv/http/docntrack/cordova-app'
		call TypescriptProject()
		call CordovaProject()
	endif
	if l:path =~ '/home/ryan/Dropbox/Ryan/School/CurrentClasses/cs5200/player'
		call TypescriptProject()
	endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()

