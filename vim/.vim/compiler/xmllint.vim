" Vim compiler file
" Compiler:     xmllint (http://xmlsoft.org/)
" Maintainer:   Doug Kearns <djkea2@gus.gscit.monash.edu.au>
" URL:          http://gus.gscit.monash.edu.au/~djkea2/vim/compiler/xmllint.vim 
" Last Change:  2004 Oct 05

"if exists("current_compiler")
"  finish
"endif
if (exists("current_compiler") && current_compiler == "xmllint")
	finish
endif

let current_compiler = "xmllint"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=xmllint\ --valid\ --noout\ --format\ %

CompilerSet errorformat=%E%f:%l:\ error\ %\\=:\ %m,
		       \%W%f:%l:\ warning\ %\\=:\ %m,
		       \%E%f:%l:\ element\ %\\w%\\+:\ validity\ error\ %\\=:\ %m,
		       \%E%f:%l:\ validity\ error\ %\\=:\ %m,
		       \%W%f:%l:\ validity\ warning\ %\\=:\ %m,
		       \%E%f:%l:\ parser\ error\ %\\=:\ %m,
		       \%W%f:%l:\ parser\ warning\ %\\=:\ %m,
		       \%-Z%p^,
		       \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
