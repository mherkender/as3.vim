" Vim syntax file
" Language:     Actionscript 3
" Maintainer:   Maximilian Herkender (static@brokenfunction.com)
" URL:          https://github.com/mherkender/as3.vim
" Last Change:  2012 December 11

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = "as3"
endif

syn keyword asStatement       return
syn keyword asConditional     else if switch
syn keyword asRepeat          do while for in break continue 
syn match   asRepeat          "\<for\s\+each\>"
syn keyword asLabel           case default
syn keyword asKeyword         with super this arguments
syn keyword asException       throw try catch finally
syn keyword asAttribute       dynamic final internal native override private protected public static
syn keyword asDefinition      class const interface namespace package var
syn keyword asDefinitionAttr  extends implements
syn keyword asDirective       import include
syn match   asDirective       "\<use\s\+namespace\>"
syn match   asDirective       "\<default\s\+xml\s\+namespace\>"
syn keyword asBoolean         true false
syn keyword asConstant        null undefined Infinity NaN
syn keyword asType            Array Boolean Class Date Error Function int Math Namespace Number Null Object RegExp String uint void XML
syn match   asOperator        "[+-/\*%><=\^&!|@]"
syn keyword asOperator        as , . delete in instanceof is : new typeof
syn region  asSymbols         start="{" end="}" transparent fold
syn region  asSymbols         start="\[" end="\]" transparent fold
syn region  asSymbols         start="(" end=")" transparent fold
syn match   asSymbols         "[:\?;]"

syn region  asRegExp          start=+/+ skip=+\\\\\|\\/+ end=+/[gismx]\?\s*$+ end=+/[gismx]\?\s*[;,)]+me=e-1 oneline

syn match   asCommentNoteOwn  contained "[\(][^\)]\+[\)]"
syn keyword asCommentNote     contained TODO FIXME XXX nextgroup=asCommentNoteOwn
syn region  asCommentDocBlock start="\/\*\*" end="\*\/" contains=asCommentNote fold keepend
syn region  asCommentBlock    start="\/\*" end="\*\/" contains=asCommentNote
syn match   asCommentLine     "\/\/.*" contains=asCommentNote

syn match   asDocTag          contained "@\(copy\|default\|eventType\|example\|exampleText\|internal\|param\|return\|see\|throws\)\s\+\S\+"
syn match   asDocTag          contained "@\(inheritDoc\|private\)\(\s\+\|$\)" 
"syn match   asDocHtml         contained "<.*>"
syn region  asDoc             start="\/\*\*" end="\*\/" contains=asDocTag,asDocHtml fold keepend

syn keyword asMetadataTag     contained Bindable DefaultProperty Effect Event Exclude IconFile MaxChildren ResourceBundle Style
syn region  asMetadata        start="^\s*\[" end="\]" contains=asMetadataTag,asStringDQ,asStringSQ,asCommentBlock,asCommentLine

syn region  asStringDQ	      start=+"+ skip=+\\\\\|\\"+ end=+"+ end=+$+
syn region  asStringSQ	      start=+'+ skip=+\\\\\|\\'+ end=+'+ end=+$+
syn match   asNumber          "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"

" TODO: XML

syn match     asConstant      contained "[A-Z0-9_]\+\>"
syn match     asVar           contained "\w\+"
syn match     asDefFuncName   contained "\w\+"
syn match     asDef           "\<function\(\s\+[gs]et\)\?\>" nextgroup=asDefFuncName skipwhite skipnl skipempty
syn keyword   asDef           var nextgroup=asVar skipwhite skipnl skipempty
syn keyword   asDef           const nextgroup=asConstant skipwhite skipnl skipempty

syn sync fromstart
syn sync maxlines=300

hi def link asRegExp           String
hi def link asCommentNoteOwn   SpecialComment
hi def link asCommentNote      Todo
hi def link asCommentBlock     Comment
hi def link asCommentDocBlock  Comment
hi def link asCommentLine      Comment
hi def link asDocTag           Function
hi def link asDocHtml          SpecialComment
hi def link asDoc              Comment
hi def link asMetadataTag      Function
hi def link asMetadataVar      Identifier
hi def link asMetaData         PreProc
hi def link asStringDQ         String
hi def link asStringSQ         String
hi def link asNumber           Number
hi def link asType             Type
hi def link asConstant         Constant
hi def link asVar              Identifier
hi def link asDefFuncName      Function
hi def link asDef              Structure
hi def link asTrailError       Error
hi def link asStatement        Statement
hi def link asConditional      Conditional
hi def link asRepeat           Repeat
hi def link asLabel            Label
hi def link asKeyword          Keyword
hi def link asException        Exception
hi def link asAttribute        Structure
hi def link asDefinition       Function
hi def link asDefinitionAttr   Structure
hi def link asDirective        PreProc
hi def link asBoolean          Boolean
hi def link asConstant         Constant
hi def link asOperator         Operator
hi def link asSymbols          Operator

let b:current_syntax = "as3"
if main_syntax == "as3"
  unlet main_syntax
endif
