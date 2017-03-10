autocmd FileType perl call <SID>def_perl_syntax()

function! s:def_perl_syntax()
    syn match perlVarialbe "\%($\w\+#\|\$\w\+\|@\w\+\|%\w\+\)" containedin=PerlString
    syn match perlVarType "\%($#\|\$\|@\|%\)" contained containedin=perlVarialbe
    syn match perlStatementIncludeUse "use" contained containedin=perlStatementInclude
endfunction
