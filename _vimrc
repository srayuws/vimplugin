set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

color murphy


set enc=utf8
set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936  

set langmenu=zh_CN.UTF-8
language messages zh_CN.utf-8  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim  

syntax on

set tabstop=4
set expandtab 
set shiftwidth=4
filetype plugin on


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

let $PATH = $PATH . ';D:\MinGW\msys\1.0\bin'

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplcache'
Bundle 'https://github.com/Shougo/vimshell.git'
Bundle 'basyura/vimshell-sls'
Bundle 'haskell.vim'
" haskell
Bundle 'majutsushi/tagbar'
Bundle 'bitc/lushtags'
"Bundle 'taglist.vim'
filetype plugin indent on




"let Tlist_Show_Menu = 1
"let Tlist_Auto_Open=1
"let tlist_hs_settings='haskell;v:var'

