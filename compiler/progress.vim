" Vim compiler file
" Compiler:     Progress OpenEdge ABL Syntax Checker
" Maintainer:   Egor Komissarov <komissarex@gmail.com>

if exists('current_compiler')
  finish
endif
let current_compiler = 'progress'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" User should provide a script that runs compiler procedure in batch mode.
" (default procedure is available as $VIM_PROGRESS_COMPILER_PROC environment variable)
"
" For example:
"   let g:progress_compiler = '$DLC/bin/_progres -pf startup.pf -pb $VIM_PROGRESS_COMPILER_PROC -param %'
"
if exists('g:progress_compiler')
  " ABL procedure that compiles the file passed in the SESSION:PARAM
  " and returns compiler errors/warnings according to vim's errorformat
  let $VIM_PROGRESS_COMPILER_PROC = expand('<sfile>:p:h') . '/compile.p'

  execute 'CompilerSet makeprg=' . escape(g:progress_compiler, ' \|"')
  CompilerSet errorformat=%f:%l:%c:%t\ %m
endif
