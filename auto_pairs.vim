" =========================
" File: sinta
" Auther: binerystorm
" Function: bracket pairing
" Comment: only works for single char rappers
" =========================

" set up

if !exists("g:rapper_list")
    let g:rapper_list = ["()", "[]", "{}", "\"\"", "\'\'"]
endif

if !exists("g:key_list")
    let g:key_list = []
endif

" settings functions

" TODO: check for valid aguement
function SetEnclosingList(list)
let g:rapper_list = a:list
call UpdateMappings()
endfunction

" TODO: check for valid argument
function AppendEnclosingList(item)
call add(g:rapper_list, a:item)
call UpdateMappings()
endfunction

function InitRapper()
let g:key_list = []
for rapper in g:rapper_list
    call add(g:key_list, rapper[0])
endfor
endfunction

" TODO: add check that key_list and rapper_list are the same length
function UpdateMappings()
call InitRapper()
let l:index = 0
for key in g:key_list
    execute("inoremap ".key." ".g:rapper_list[l:index]."<left>")
    let l:index += 1
endfor
endfunction

" core functions

function Test()
let curserPos=getpos(".")
let chars = strpart(getline("."), curserPos[2]-2, 2)
echom chars
endfunction

function! InBrackets()
let curserPos=getpos(".")
let chars = strpart(getline("."), curserPos[2]-2, 2)
if index(g:rapper_list, chars) >= 0
    return 1
else
    return 0
endif
endfunction

function! BackSpace()

if InBrackets()
    return "\<BS>\<DEL>"
else
    return "\<BS>"
endif
endfunction

" mappings
inoremap <silent><BS> <C-r>=BackSpace()<CR>

" init plugin
call UpdateMappings()
