stan.vim
========

Vim syntax highlighting for [Stan http://mc-stan.org] modeling lauguage 


To install, copy stan.vim to $HOME/.vim/syntax and add the following to
file "$HOME/.vim/ftdetect/filetype.vim". If this file does not exist, 
create one. 

    au BufNewFile,BufRead *.stan,*.STAN setf stan
