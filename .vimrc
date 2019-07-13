"bundle"
" ctrlp.vim gruvbox nerdcommenter syntastic vim-airline
" vim-clang-format vim-ctrlspace vim-fugitive vim-gitgutter
" vim-qml-master vim-surround

"" enable pathogen
call pathogen#infect()
call pathogen#helptags()

set encoding=utf-8
set nocompatible " not compatible with vi
set autoread " detect when a file is changed

"Enable project specific vim config
set secure "disable autocmd
set exrc

"" REMAPS
let mapleader=","

" Vim HARDMODE
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
imap hh <Esc>
cmap w!!  w !sudo tee % >/dev/null
"inoremap <C-w> <C-\><C-o>dB
"inoremap <C-BS> <C-\><C-o>db
"imap <C-BS> <C-W>
"
"allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=1000

" keep 50 lines of command line history
set textwidth=80

set termguicolors

if has('mouse' )
	"set mouse=a
endif

" Make vim faster
set ttyfast

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Default buffer to X clipboard
set clipboard=unnamedplus

" Tab control
set ffs=unix,dos,mac
set sw=8 ts=8 tw=78
set autoindent " automatically set indent of new line
set smartindent

" use filetype plugins to determine indent settings
filetype plugin indent on

" file type specific settings
if has('autocmd') && !exists('autocommands_loaded' )
	let autocommands_loaded = 1
	"Default
	au Syntax * normal zR

	" Text
	au FileType text set tw=78

	" CMake
	au FileType cmake set sw=4 ts=4 et sta ai

	" DTS
	au FileType dts set sw=8 ts=8 sta ai
	au BufEnter *.dts.* setf dts
	au BufEnter *.dtsi.* setf dts

	" Python
	"au FileType python set sw=4 ts=4 sts=4 tw=79 et sta ai fo=croql
	au FileType python set
				\ tabstop=4
				\ softtabstop=4
				\ shiftwidth=4
				\ textwidth=79
				\ expandtab
				\ autoindent
			"	\ fileformat=unix
			"	\ nosmartindent
			"	\ cinot='(@'
			"	\ tags=pythontags

	au BufEnter *.py setf python

	" SLS
	au FileType yaml "set sw=4 ts=4 et sta ai fo=croql
	au BufEnter *.sls setf yaml

	" Scons
	au BufEnter SConstruct setf python
	au BufEnter SConscript setf python

	" Ruby
	au FileType ruby,rdoc,cucumber,yaml set sts=2 sw=2 ts=2
	"au BufEnter *.erb set sw=2 ts=2 et
	"au BufEnter *.rb set sw=2 ts=2 et

	" Jenkinsfile
	au FileType groovy set sts=2 sw=2 ts=2 et tw=200
	au BufEnter Jenkinsfile setf groovy

	" QML
	au FileType qml set sts=4 sw=4 ts=4 et tw=200
	au BufEnter qml setf qml

	" C
	au FileType c set sw=8 ts=8 tw=78 ai
	"aut FileType c set sw=4 ts=4 tw=78 si
	au BufEnter *.c setf c
	au BufEnter *.h setf c
	let c_comment_strings=1
	let c_curly_error=1
	let c_space_errors=1
	let c_syntax_for_h=1

	" XML
	au BufEnter *.qrc setf xml
	au FileType xml set ts=2 sw=2 sts=2

	" JSON
	au BufEnter *.gyp setf json
	au BufEnter *.json setf json
	au FileType json set sw=2 ts=2 et sta ai

	" SHELL
	"au FileType sh set sw=4 ts=4 et sta ai fo=croql
	"au BufEnter *.sh setf sh

	" Makefiles
	"au FileType make set sw=4 ts=4 tw=78 ai et
	"au BufEnter *.mk setf make

	"Markdown
	au BufNewFile,BufReadPost *.md set filetype=markdown sw=4 ts=4 et sta ai tw=78
	let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'c', 'cpp', 'make', 'mk=make', 'Makefile=make', 'sh', 'bash=sh' ]
endif

"code folding settings
set foldmethod=syntax "fold based on indent
set foldnestmax=10 "deepest fauld
set nofoldenable "don't fold by default
set foldlevel=1

" User interface
set so=7 "set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
"set nohidden
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for AirLine
set wildmode=list:longest "complete files linke a shell
set scrolloff=3 " lines of text around cursor
set shell=$SHELL
set cmdheight=1 " command bar height
"set shortmess=a
set title " set terminal title

" Searching
set incsearch " set incremental search, like modern browser
set ignorecase " case insensitive searching
set smartcase " case-sensitive if contains a capital letter
set nolazyredraw " don't redraw while executing macros
set magic " Set magic on, for regex

" Coloring
set t_Co=256
"let basel6colorspace=256 " access colors present in 256 colorspace
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
	"colorscheme gruvbox
	set background=light
	"let g:gruvbox_contrast_light = "hard"

	set showmatch " show matching braces
	set mat=2 " set many thenth of a second to blink

	" Gruvbox dark
	"highlight ColorColumn ctermbg=@ guibg=#2c2d27
	" Gruvbox light
	highlight ColorColumn ctermbg=230 guibg=#f9f5d7
	let &colorcolumn=join(range(81,91),",")
	"let &colorcolumn=81

	highlight CursorMatch ctermfg=Yellow guifg=#878700
	autocmd CursorHold * exe printf('match CursorMatch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
endif

"error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

"set ruler " show the line and column number of the cursor position
set number " show line numbers
set relativenumber " show relative line numbers

set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from the side
set linebreak " set softwrapping
set showbreak=... " show ellipsis at breaking

" Files backups and undo
"set nobackup
"set nowritebackup
set noswapfile
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp, /var/tmp, /tmp
"set directory=~/.vim-tmp,~/.tmp,~/tmp, /var/tmp, /tmp
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=1000

" Clean trailing whitespace on save
au BufWritePre * :%s/\s\+$//e

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'Ctrl1P'
let g:ctrip_extensions = ['line']
"let g:ctrlp_custom_ignore= '\v[\/]\.(git|hg|svn)$'
let g:ctrip_max_height = 40
let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/]\.(git|hg|svn|_*)$',
			\ 'file': '\v\.(alo]depend|exe|so|d11|pyc)$',
			\ }
let g:ctrlp_working_path_mode = 'a'
"let g:ctrlp_working_path_mode = 2
"let g:ctrlp_regexp = 1

" Mappings
" disable Ex mode
noremap Q <NOP>

" clear highlighted search
nmap \q :nohlsearch<CR>

" toggle invisible characters
set invlist
"FIXME set listchars=tab:>\ ,eol:-,trail:-,extends:>,precedes:<¢
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
"FIXME set showbreak=0
set list!
nmap \w :set list!<cr>

"enable . command in visual mode
vnoremap . :normal .<cr>

"scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" silent man pages
"noremap <s-k> :execute "silent " . expand("<cword>")<cr>
nnoremap K K<CR>
vnoremap K K<CR>

" run in bash
nnoremap <Leader>r :.w !bash<CR>

"Syntastic
let g:syntastic_c_checkers = ['clang tidy']
"let g:syntastic_qml_qmllint_exe = ['/usr/lib/x86_64-linux-gnu/qt5/bin/qmllint' ]

nmap \s :SyntasticToggleMode<cr>
let g:syntastic_python_checkers = ['pylint']

" Python with virtualenv support
"let pipenv_venv_path = system('pipenv --venv')

"if shell_error == 0
"	let venv_path = substitute(pipenv_venv_path, '\n', '', '')
"	let g:syntastic_python_python_exec = venv_path . 'bin/python'
"else
"	let g:syntastic_python_python_exec 'python'
"endif

let g:syntastic_python_checkers = ['flake8', 'pep8', 'pylint' ]
let g:syntastic_python_python_exec = '/usr/bin/python3'
"let g:syntastic_python_python_exe = 'python3'
"let g:syntastic_python_flake8_exec = 'python3'
"let g:syntastic_python_python_args = ['-m', 'flake8' ]

" Clang format integration
"map <C-k> :py3f /usr/local/share/clang/clang-format.py<cr>
"imap <C-k> <c-o>:py3f /usr/local/share/clang/clang-format.py<cr>
let g:clang_format#style_options = {
	\	"BasedOnStyle" : "LLVM",
	\	"IndentWidth" : 8,
	\	"UseTab" : "Always",
	\	"BreakBeforeBraces" : "Linux",
	\	"AllowShortIfStatementsOnASingleLine" : "false",
	\	"IndentCaseLabels" : "false",
	\	"Language" : "Cpp",
	\	"AlwaysBreakBeforeMultilineStrings" : "true",
	\	"AllowShortLoopsOnASingleLine" : "false",
	\	"AllowShortFunctionsOnASingleLine" : "false",
	\	"AlignEscapedNewlinesLeft" : "false",
	\	"AlignTrailingComments" : "true",
	\	"AllowAllParametersOfDeclarationOnNextLine" : "false",
	\	"AlignAfterOpenBracket" : "true",
	\	"SpaceAfterCStyleCast" : "false",
	\	"MaxEmptyLinesToKeep" : 2,
	\	"BreakBeforeBinaryOperators" : "NonAssignment",
	\	"BreakStringLiterals" : "false",
	\	"SortIncludes" : "false",
	\	"ReflowComment" : "true",
	\	"ContinuationIndentWidth" : 8 }

augroup ClangFormatSettings
	autocmd!
	" map to <Leader>cf in C++ code
	autocmd FileType c,cpp,objc nnoremap <C-k> :<C-u>ClangFormat<CR>
	autocmd FileType c,cpp,objc vnoremap <C-k> :ClangFormat<CR>
	" if you install vim-operator-user
	"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
augroup END

"map <C-k> :ClangFormat<cr>
"imap <C-k> <c-o>:ClangFormat<cr>
"
"function! FormatOnSave()
"	let 1:formatdiff = 1
"	py3f /usr/local/share/clang/clang-format.py<cr>
"	:ClangFormat<cr>
"endfunction

"autocmd BufWritePre *.h,*.c,*.cc,*.cpp call FormatOnSave()

"Taglist and omnicomplete
"nmap \t :TlistToggle<CR>
"set omnifunc=syntaxcomplete#Complete
"set completeopt+=menu, longest

let Gtags_Auto_Map = 1
let Gtags_Auto_Update = 1
let Gtags_Close_When_Single = 1

set wildignore+=*.o,*.a,*.swp,tags,TAGS,*/.git,*.sln,*.vcxproj*
"set wildignore+=*/_build
"set wildignore+=*/_ninja

" CSCOPE
"if has('cscope' )
"	set cscopetag cscopeverbose
"
"	if has('quickfix' )
"		set cscopequickfix=s-,c-,d-,i-,t-,e-
"		"
"	endif
"
"	cnoreabbrev csa cs add
"	cnoreabbrev csf cs find
"	cnoreabbrev csk cs kill
"	cnoreabbrev csr cs reset
"	cnoreabbrev css cs show
"	cnoreabbrev csh cs help
"
"	command -nargs=@ Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src cscope.out
"endif

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
