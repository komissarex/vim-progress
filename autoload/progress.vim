" Parse ':syn list <type>' output to obtain the list of keywords
"
function! progress#get_keywords(type)
  let l:keywords = execute('syn list ' . a:type)
  return split(matchstr(l:keywords, '\v((' . a:type . ')\s*xxx\s)@<=\_.{-}(links|match)@='))
endfunction

" Replace keyword with its uppercase version (outside of comments or strings)
"
function! progress#uppercase_keyword(kwd)
  let l:current_syntax = synIDattr(synIDtrans(synID(line('.'), col('.') - 1, 0)), 'name')

  if !get(g:, 'progress_uppercase', 0) || l:current_syntax =~# 'Comment\|String'
    return a:kwd
  endif

  return toupper(a:kwd)
endfunction
