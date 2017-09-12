set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'wesQ3/vim-windowswap'
Plugin 'Yggdroot/indentLine'
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'mxw/vim-jsx'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'mkitt/tabline.vim'
Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()
"

helptags ~/.vim/doc
syntax enable
filetype plugin indent on
autocmd FileType javascript setlocal omnifunc=js#CompleteJS
colorscheme default
imap <Nul> <C-X><C-U>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-e>" : "\<Tab>"

inoremap <leader>§ <C-x><C-o>

imap § <C-P>

" Show indents
" :IndentLinesToggle to enable
let g:indentLine_char = '·'
let g:indentLine_color_term = 8
let g:indentLine_enabled = 0
vnoremap <silent><leader>c :call Comment()<Enter>
vnoremap <silent><leader>u :call UnComment()<Enter>
imap  <silent><C-w> ``''<left><left>
map <silent>ш i
map <silent>г u
map <silent>т n
map <silent>Т N
map q: :q
vmap <C-c> "+yi
cmap w!! w !sudo tee %
"vmap <C-z> "+c
"vmap <C-v> c<ESC>"+p
"imap <C-v> <ESC>"+pa
set encoding=utf-8
set noswapfile
set fileencoding=utf-8
set showtabline=2
set mouse=a
set foldmethod=syntax
set nofoldenable
set splitright
"set foldlevel=1
"set foldcolumn=1
set backspace=indent,eol,start
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set undofile
set lisp
set autochdir
set number
set colorcolumn=120
set hlsearch
set showmatch
set fillchars+=vert:\ "
set ignorecase
set lazyredraw
"set laststatus=0
highlight link xmlEndTag xmlTag

autocmd Filetype php set filetype=html
au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd BufRead,BufNewFile *.pl set filetype=perl

function Comment()
        if &filetype != ''
                if &filetype == 'perl'
                        :s/^/#
                elseif &filetype == 'c'
                        :s/^/\/\/
                elseif &filetype == 'cpp'
                        :s/^/\/\/
                elseif &filetype == 'matlab'
                        :s/^/%
		elseif &filetype == 'javascript'
			:s/^/\/\/
                elseif &filetype == 'javascript.jsx'
                        :s/^/\/\/
		else
		        :s/^/#
                endif
        else
                :s/^/#
        endif
endfunction

function UnComment()
        if &filetype != ''
                if &filetype == 'perl'
                        :s/^#/
                elseif &filetype == 'c'
                        :s/^\/\//
                elseif &filetype == 'cpp'
                        :s/^\/\//
                elseif &filetype == 'matlab'
                        :s/^%/
		elseif &filetype == 'javascript'
			:s/^\/\//
                elseif &filetype == 'javascript.jsx'
                        :s/^\/\//
		else
		        :s/^#/
                endif
        else
                :s/^#/
        endif
endfunction

function LeadingSpaces()
    :%s/^\s*/&&
    :noh
endfunction

nmap <leader>s :call LeadingSpaces() <cr>

map <C-z> <ESC>u
map <C-Up> mzMkzz`z
map <C-Down> mzMjzz`z
imap <C-Up> <ESC>mzMkzz`zi<Right>
imap <C-Down> <ESC>mzMjzz`zi<Right>
set pastetoggle=<leader>p

nmap <leader>n :set number! number?<cr>
nmap <leader>i :IndentLinesToggle<cr>

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" delete spces in end of file
autocmd BufWritePre * :%s/\s\+$//e

if &diff
	syntax off
endif

augroup Shebang
	autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env sh\<nl>\<nl>\"|$
augroup END

" Set scripts to be executable from the shell
function MakeExecutable()
	if getline(1) =~ "^#!"
		silent !chmod +x <afile>
	endif
endfunction

au BufWritePost * :call MakeExecutable()

set iskeyword+=_

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd FileType * call <SID>def_basic_syntax()

function! s:def_basic_syntax()
    syn match extraOperator "\%(=\|;\| > \| < \| != \| + \| - \| \* \|\.\|:\| / \| % \)"
    syn match extraOperatorLong "\%(=>\|->\|::\|=>\|*=\|!==\|>>\|<<\|++\|--\|<=\|>=\|%=\|+=\|-=\|=\~\|&&\|/=\)"
    syn match perlMethodArrow "->" contained containedin=perlMethod
    syn match perlMethodArrow "->" contained containedin=perlIdentifier
    syn match perlMethodArrow "->" contained containedin=perlVarSimpleMember
endfunction

"let g:windowswap_map_keys = 0 "prevent default bindings
"nnoremap <silent> <C-w> :call WindowSwap#EasyWindowSwap()<CR>
nmap <leader>w :call WindowSwap#EasyWindowSwap() <cr>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'
