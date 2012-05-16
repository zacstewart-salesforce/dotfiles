" Pathogen
call pathogen#infect()
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.scss set filetype=scss

" Colors
set t_Co=256
colorscheme ir_black

" Indentation
set ai
set si
" Use soft tabs
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
" Highlight trailing ws
set listchars=tab:->,trail:·
set list
set nowrap
" Line numbers
set number
set cursorline
" Status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
" Use line for insert cursor
" http://groups.google.com/group/iterm2-discuss/browse_thread/thread/d626717e08a9b787
let &t_SI = "\<Esc>]50;CursorShape=1\x7" 
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Shortkeys
imap jj <Esc>
"" Toggle status line
map <Leader>s :if &laststatus==2<Bar>
        \set laststatus=0<Bar>
      \else<Bar>
        \set laststatus=2<Bar>
      \endif<CR>
"" Remove whitespace
map <Leader><Space> :%s/\s\+$//g<CR>
" Ruby folding
set foldmethod=syntax
set foldlevel=100
set foldminlines=2
set foldtext=MyFoldFunction()
set fillchars=fold:\ 

function! MyFoldFunction()
  let line = getline(v:foldstart)
  let lastline = getline(v:foldend)
  let numfolded = v:foldend - v:foldstart + 1
  return line . '  folded ' . numfolded . ' lines'
endfunction

highlight Folded term=bold ctermbg=0 ctermfg=7 guibg=bg guifg=fg
highlight FoldColumn term=bold ctermbg=10 ctermfg=7 guibg=bg guifg=fg
" Visual indent
vnoremap < <gv
vnoremap > >gv

" Swp file location
set directory^=$HOME/.vim/.swp/
