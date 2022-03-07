" =========================
" File: auto_pairs.vim
" Auther: binerystorm
" Function: bracket pairing
" Comment: only works for single char rappers
" =========================

" set up

if !exists("s:rapper_list")
    let s:rapper_list = ["()", "[]", "{}", "\"\"", "\'\'"]
endif

if !exists("s:key_list")
    let s:key_list = []
endif

" settings functions

" TODO: check for valid aguement
function SetRappers(...)
let l:old_mappings = s:key_list
let s:rapper_list = []
for item in a:000
    if type(item) != 1
        " TODO: replace ... with function name
        echoerr "Command Set ... only recieves strings" 
    endif
    call add(s:rapper_list, item)
endfor
call UpdateMappings(l:old_mappings)
endfunction


" TODO: check for valid argument
function AddRapper(item)
call add(s:rapper_list, a:item)
call UpdateMappings([])
endfunction

function InitKey()
let s:key_list = []
for rapper in s:rapper_list
    call add(s:key_list, rapper[0])
endfor
endfunction

" TODO: add check that key_list and rapper_list are the same length
function UpdateMappings(removed_mappings)
call InitKey()
let l:index = 0

for key in s:key_list
    execute("inoremap ".key." ".s:rapper_list[l:index]."<left>")
    let l:index += 1
endfor

for key in a:removed_mappings
    execute("iunmap ".key)
endfor
endfunction

function ListRappers()
for rapper in s:rapper_list
    echo rapper
endfor
endfunction

function RemoveRapper(rapper)
let l:index = index(s:rapper_list, a:rapper)
if l:index >= 0
    call remove(s:rapper_list, l:index)
else
    echoerr "rapper ".a:rapper." does not exist"
    return
endif
call UpdateMappings([a:rapper[0]])
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
if index(s:rapper_list, chars) >= 0
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
call UpdateMappings([])

" commads

command ListRappers call ListRappers()
command -nargs=+ AddRapper call AddRapper(<f-args>)
command -nargs=+ RemoveRapper call RemoveRapper(<f-args>)
command -nargs=+ SetRappers call SetRappers(<f-args>)
