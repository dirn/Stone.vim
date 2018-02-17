function! ale_linters#stone#stone#Handle(buffer, lines) abort
    " Messages come in the form "<path>:<lineno>: <type>: <message>".
    let l:pattern = '\v^[a-zA-Z]?:?[^:]+:(\d+):?: ([a-z]+): (.*)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        let l:item = {
        \	'lnum': l:match[1] + 0,
        \	'subtype': 'style',
        \	'text': l:match[3],
        \	'type': 'W',
        \}

        if l:match[2] is# 'error'
            let l:item.type = 'E'
        endif

        call add(l:output, l:item)
    endfor

    return l:output
endfunction

call ale#linter#Define('stone', {
\	'name': 'stonestyle',
\	'executable': 'stone',
\	'command': 'stonestyle',
\	'callback': 'ale_linters#stone#stone#Handle',
\})
