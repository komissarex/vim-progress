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

" The list of match words for matchit plugin
"
function! progress#get_match_words()
  if synIDattr(synID(line('.'), col('.'), 1), 'name') =~# 'Comment\|String\|Include'
    return ''
  endif

  let l:mw  = '\%(\<end\s\+\)\@<!' " not starts with 'end'
  let l:mw .= '\<\%(case\|catch\|class\|constructor\|destructor\|enum\|finally\|function\|' .
                 \ 'get\|interface\|method\|procedure\|set\|triggers\|do\|repeat\|' .
                 \ '\%(for\s\+\%(each\|first\|last\)\)\)\>'
  let l:mw .= '\%(\.\)\@!' " not ends with '.'
  let l:mw .= ':\<end\>'

  return l:mw
endfunction
