# vim-progress

Better [Progress OpenEdge ABL](https://www.progress.com/openedge/features/abl) syntax bundle for Vim, forked from [https://github.com/vim-scripts/progress.vim](https://github.com/vim-scripts/progress.vim).

### Features
- Improved syntax highlighting (up to OpenEdge 11.7.4)
- Auto-uppercase ABL keywords in insert mode

### Installation

Install with your favourite Vim package manager. For example, [vim-plug](https://github.com/junegunn/vim-plug):

```
Plug 'komissarex/vim-progress'
```

### Configuration

```
let g:progress_uppercase = 1
```

Automatically uppercase Progress keywords in insert mode (outside of comments and strings):

![uppercase-gif](https://user-images.githubusercontent.com/1723332/52237753-70fba680-28db-11e9-929d-0518fff0c07f.gif)
(...but seriously, use snippets in cases like this)

Default value: 0
