if exists("b:current_syntax")
    finish
endif

syntax region stoneAnnotation  start=+^\s*[uU]\?[rR]\?"+ end=+"+ keepend excludenl
highlight link stoneAnnotation String

syntax match stoneComment "#.*$" display
highlight link stoneComment Comment

syntax match stoneDecorator '^\s*\zs@' display nextgroup=stoneName skipwhite
highlight link stoneDecorator Define

syntax keyword stoneKeyword alias
syntax keyword stoneKeyword annotation
syntax keyword stoneKeyword attrs
syntax keyword stoneKeyword by
syntax keyword stoneKeyword deprecated
syntax keyword stoneKeyword doc
syntax keyword stoneKeyword example
syntax keyword stoneKeyword error
syntax keyword stoneKeyword extends
syntax keyword stoneKeyword import
syntax keyword stoneKeyword namespace
syntax keyword stoneKeyword patch
syntax keyword stoneKeyword route
syntax keyword stoneKeyword struct
syntax keyword stoneKeyword union
syntax keyword stoneKeyword union_closed
highlight link stoneKeyword Keyword

syntax match stoneName "[a-zA-Z_][a-zA-Z0-9_]*\(\.[a-zA-Z_][a-zA-Z0-9_]*\)*" display contained
highlight link stoneName Function

syntax keyword stoneType Boolean
syntax keyword stoneType Bytes
syntax keyword stoneType Float32 Float64
syntax keyword stoneType Int32 Int64 UInt32 UInt64
syntax keyword stoneType List
syntax keyword stoneType Map
syntax keyword stoneType String
syntax keyword stoneType Timestamp
syntax keyword stoneType Void
highlight link stoneType Type

syntax match stoneSpecial "?"
highlight link stoneSpecial Special

let b:current_syntax = "stone"
