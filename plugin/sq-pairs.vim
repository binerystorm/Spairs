" ==========================================
" File: sq-pairs.vim
" Auther: binerystorm
" Function: sequence pairing, e.g /* with */
" ==========================================

" set up

if !exists("s:sq_list")
    let s:sq_list = []
endif

"core funtions

function AppendSqRapper(first, sec)

call add(s:sq_list, [a:first, a:sec])
echo s:sq_list

endfunction

