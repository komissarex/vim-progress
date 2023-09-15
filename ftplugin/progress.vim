" Vim filetype plugin file
" Language:     Progress OpenEdge ABL
" Maintainer:   Egor Komissarov <komissarex@gmail.com>

" Automatically convert Progress keywords to upper case
let g:progress_uppercase = get(g:, 'progress_uppercase', 0)

if g:progress_uppercase
  setlocal syntax=progress " might not be set yet

  if !exists('g:progress_keywords')
    let g:progress_keywords = uniq(progress#get_keywords('ProgressReserved')
                               \ + progress#get_keywords('ProgressOperator')
                               \ + progress#get_keywords('ProgressPreProcDirective')
                               \ + progress#get_keywords('ProgressType'))
  endif

  for kwd in g:progress_keywords
    exec 'inoreabbrev <silent> <buffer> ' . kwd . ' <C-R>=progress#uppercase_keyword("' . kwd . '") <CR>'
  endfor
endif

" Support for matchit plugin
if exists("loaded_matchit")
  let b:match_ignorecase = 1
  let b:match_skip = 's:Comment\|String\|Include'
  let b:match_words = 'progress#get_match_words()'
endif

" Set default compiler
if get(b:, 'current_compiler', '') ==# ''
  compiler progress
endif
