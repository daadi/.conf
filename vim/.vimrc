set nocompatible
syntax off

if has("gui_macvim")
		set bg=light
		colorscheme macvim
else 
		" enable 256 colors
		set t_Co=256
		if &diff
			colorscheme morning
		endif
endif

filetype on

filetype plugin indent on

" can be turned off for security reasons
"set nomodeline

set title

syntax on

set t_mr=[0;1;37;44m

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
	set t_Co=16
	"set t_Sf=^[[3%dm
	"set t_Sb=^[[4%dm
endif

highlight StatusLine cterm=bold ctermbg=blue ctermfg=white gui=bold guibg=blue guifg=white
highlight StatusLineNC cterm=NONE ctermbg=white ctermfg=blue gui=NONE guibg=darkcyan guifg=darkblue

" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * highlight StatusLine cterm=bold ctermbg=red ctermfg=white gui=bold guibg=blue guifg=white
  au InsertLeave * highlight StatusLine cterm=bold ctermbg=blue ctermfg=white gui=bold guibg=blue guifg=white
endif

set backspace=indent,eol,start	" more powerful backspacing
set textwidth=0

set nobackup

set history=200
set ruler
set cmdheight=2
set laststatus=2
set lazyredraw
set number
map <F1> :set invnumber<CR>
map <F2> :set invpaste<CR>

set report=0

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set noerrorbells
set helpheight=0

set ignorecase
set smartcase
set showcmd
"set showmatch
set noshowmatch
set incsearch
set hlsearch
"set nohlsearch

set noendofline

set vb t_vb=

set visualbell

set ttyfast

if has("autocmd")
	" Enabled file type detection
	" Use the default filetype settings. If you also want to load indent files
	" to automatically do language-dependent indenting add 'indent' as well.
	filetype plugin on

	set autoindent
	set smartindent

	" PostgreSQL
	"autocmd BufEnter *.psql setf psql
	"autocmd BufEnter *.sql  setf psql

	augroup Messages " Mail & news
		autocmd!

		autocmd BufEnter mutt*[0-9],snd.*,bug*,.letter,.followup,.article,.article[0-9] :set textwidth=76 formatoptions=2tcq comments=n:>,n::,n:#,n:%,n:\|
		autocmd BufEnter mutt*[0-9],snd.*,bug*,.letter,.followup,.article,.article[0-9] :normal ,kqs
	augroup END


	augroup PO
		autocmd FileType po compiler po
	augroup END

	augroup PERL
		autocmd FileType perl compiler perl
	augroup END

	augroup PHP
		autocmd!
		"autocmd FileType php syntax sync fromstart
		autocmd FileType php map K :call MyPHPhelp()<CR>
		autocmd FileType php compiler php

		autocmd BufreadPost *.prm  setf php
		autocmd BufreadPost *.pi   setf php
		autocmd BufreadPost *.inc  setf php

		let php_asp_tags = 0
		let php_parent_error_close = 1
		let php_parent_error_open = 1
		let php_sql_query = 0
		let php_htmlInStrings = 0
		let php_noShortTags = 1
		"let php_folding = 1
		let php_sync_method = 0
		let php_alt_assignByReference = 1
	augroup END

	augroup RUBY
		autocmd!

		autocmd FileType {ruby} map <F10> :!rdoc *.rb<CR>
	augroup END

	augroup XML
		autocmd!

		autocmd FileType {xml,xslt} compiler xmllint
		autocmd FileType {xml,xslt} map <F10> :%!xmllint --format %<CR>
		autocmd FileType {xml,xslt} setlocal iskeyword=@,-,\:,48-57,_,128-167,224-235 
	augroup END

	augroup PYTHON
		autocmd!

		autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
	augroup END

	" show cursor position
	"autocmd BufLeave * setlocal nocursorcolumn nocursorline
	"autocmd BufEnter * setlocal cursorline cursorcolumn

	" When editing a file, always jump to the last cursor position.
	augroup ALL
		autocmd!

		autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
	augroup END
endif " has ("autocmd")

function! MyPHPhelp()
	let page=substitute(tolower(expand("<cword>")), '_', '-', 'g')
	if (page != "")
		let inetfile="http://php.net/".page
		let localfile="/usr/share/doc/phpdoc/html/function.".page.".html"
		let elinks="elinks"
		let links="links"
		let lynx="lynx"

		if filereadable(localfile)
			let helpfile="file://".localfile
		else
			let helpfile=inetfile
		endif 

		if executable(elinks)
			exec(":!".elinks." ".helpfile)
		elseif executable(links)
			exec(":!".links." ".helpfile)
		elseif executable(lynx)
			exec(":!".lynx." ".helpfile)
		else
			echo("Supported browser not found in PATH: ".$PATH."!")
		endif
	endif
endfunction

" Programmers settings
syn keyword	cTodo	contained TODO FIXME XXX

"source ~/.vim/justify.vim

set pastetoggle=<F9>

" Y yanks from cursor to $
map Y y$

"map <F1> :

nnoremap <F5> "=strftime("%G-%m-%d %H:%M:%S")<CR>P
map <F6> :cc<CR>
map <F7> :cprev<CR>
map <F8> :cnext<CR>

let g:load_templates="ask"

" bash style completion we don't like vim like completion
set wildmode=longest,list

"set fileencodings=latin1,utf-8
"set termencoding=iso-8859-2
set termencoding=utf-8
set encoding=utf-8

" set tag file searching method to recursive
set tagbsearch
set tags=tags;/

let html_use_css=1
let g:calendar_monday = 1
let g:omni_sql_no_default_maps = 1

set ts=2
set sw=2

set listchars=eol:↵,tab:›·,trail:·,extends:…,precedes:…
map <F11> :set invlist<CR>

set foldmethod=marker

" Taglist
set updatetime=2

let Tlist_Show_One_File=1
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=1
if &diff
	let Tlist_Auto_Open=0
else
	let Tlist_Auto_Open=0
endif
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidth=32
let Tlist_Use_Right_Window=1

map <F3> :TlistToggle<CR>:TlistUpdate<CR>

" Taglist per-language customizations
let tlist_php_settings = 'php;c:class;f:function'

let tlist_sql_settings = 'sql;c:cursor;P:package;r:record;' .
            \ 's:subtype;t:table;V:view;T:trigger;v:variable;f:function;p:procedure'

command W w !sudo tee % > /dev/null

