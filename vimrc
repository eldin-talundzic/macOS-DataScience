set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

Plugin 'vim-scripts/indentpython.vim'

Plugin 'scrooloose/syntastic'


Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'

Plugin 'kien/ctrlp.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable advanced searching
set incsearch 		      " start searching as you type
set hlsearch		      " highlight search strings

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za


"enables auto-indentation for python
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

highlight BadWhitespace guibg=red ctermbg=darkred

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd ColorScheme * highlight BadWhitespace guibg=red ctermbg=darkred

colorscheme torte

"enables UTF8 for python3 
set encoding=utf-8

"python with virtualenv support
"py << EOF
"import os
"import sys

"if 'VIRTUAL_ENV' in os.environ:
"	project_base_dir = os.environ['VIRTUAL_ENV']
"	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"	execfile(activate_this, dict(__file__=activate_this))
"EOF


"line numbering
set nu 

if has('gui_running')
	set background=dark
	colorscheme solarized
	
else
	 colorscheme zenburn
 endif


