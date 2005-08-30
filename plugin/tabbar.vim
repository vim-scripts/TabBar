"vim:foldmethod=marker vim:foldmarker=~~,%%

"    Copyright: Copyright (C) 2005 Marius Groleo 
"               Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this copyright
"               notice is copied with it. Like anything else that's free,
"               tabbar.vim is provided *as is* and comes with no
"               warranty of any kind, either expressed or implied. In no
"               event will the copyright holder be liable for any damamges
"               resulting from the use of this software.
"               Derived from  Bindu Well miniBufExplorer.vim version 6.3.2


"  Name Of File :  tabbar.vim
"  Description  :  TabBar buffer explorer Vim Plugin
"  Maintainer   :  Marius Groleo < groleo@gmail.com >
"  Version      :  0.2


" press zR in normal mode to open  all folds
" press zM in normal mode to close all folds

" Already been loaded? ~~
if exists('Tb_loaded')
    finish
else
      let Tb_loaded= 1
endif "%%


" Mappings and Commands
" TabBar Keyboard Mappings ~~
if ! hasmapto('1') || !hasmapto('<M-1>')
      "gui bindings containing META key, are different from terminal bindings
      if has('gui_running')
            "NORMAL mode bindings for gvim
            noremap <unique> <script> <M-1> :call <SID>Tb_SwitchTo( 1)<CR>:<BS>
            noremap <unique> <script> <M-2> :call <SID>Tb_SwitchTo( 2)<CR>:<BS>
            noremap <unique> <script> <M-3> :call <SID>Tb_SwitchTo( 3)<CR>:<BS>
            noremap <unique> <script> <M-4> :call <SID>Tb_SwitchTo( 4)<CR>:<BS>
            noremap <unique> <script> <M-5> :call <SID>Tb_SwitchTo( 5)<CR>:<BS>
            noremap <unique> <script> <M-6> :call <SID>Tb_SwitchTo( 6)<CR>:<BS>
            noremap <unique> <script> <M-7> :call <SID>Tb_SwitchTo( 7)<CR>:<BS>
            noremap <unique> <script> <M-8> :call <SID>Tb_SwitchTo( 8)<CR>:<BS>
            noremap <unique> <script> <M-9> :call <SID>Tb_SwitchTo( 9)<CR>:<BS>
            noremap <unique> <script> <M-0> :call <SID>Tb_SwitchTo( 10)<CR>:<BS>
            "INSERT mode bindings for gvim
            inoremap <unique> <script> <M-1> <esc>:call <SID>Tb_SwitchTo( 1)<CR>:<BS>i
            inoremap <unique> <script> <M-2> <esc>:call <SID>Tb_SwitchTo( 2)<CR>:<BS>i
            inoremap <unique> <script> <M-3> <esc>:call <SID>Tb_SwitchTo( 3)<CR>:<BS>i
            inoremap <unique> <script> <M-4> <esc>:call <SID>Tb_SwitchTo( 4)<CR>:<BS>i
            inoremap <unique> <script> <M-5> <esc>:call <SID>Tb_SwitchTo( 5)<CR>:<BS>i
            inoremap <unique> <script> <M-6> <esc>:call <SID>Tb_SwitchTo( 6)<CR>:<BS>i
            inoremap <unique> <script> <M-7> <esc>:call <SID>Tb_SwitchTo( 7)<CR>:<BS>i
            inoremap <unique> <script> <M-8> <esc>:call <SID>Tb_SwitchTo( 8)<CR>:<BS>i
            inoremap <unique> <script> <M-9> <esc>:call <SID>Tb_SwitchTo( 9)<CR>:<BS>i
            inoremap <unique> <script> <M-0> <esc>:call <SID>Tb_SwitchTo( 10)<CR>:<BS>i
      else
            "NORMAL mode bindings for vim( terminal)
            noremap <unique> <script> 1 :call <SID>Tb_SwitchTo( 1)<CR>:<BS>
            noremap <unique> <script> 2 :call <SID>Tb_SwitchTo( 2)<CR>:<BS>
            noremap <unique> <script> 3 :call <SID>Tb_SwitchTo( 3)<CR>:<BS>
            noremap <unique> <script> 4 :call <SID>Tb_SwitchTo( 4)<CR>:<BS>
            noremap <unique> <script> 5 :call <SID>Tb_SwitchTo( 5)<CR>:<BS>
            noremap <unique> <script> 6 :call <SID>Tb_SwitchTo( 6)<CR>:<BS>
            noremap <unique> <script> 7 :call <SID>Tb_SwitchTo( 7)<CR>:<BS>
            noremap <unique> <script> 8 :call <SID>Tb_SwitchTo( 8)<CR>:<BS>
            noremap <unique> <script> 9 :call <SID>Tb_SwitchTo( 9)<CR>:<BS>
            noremap <unique> <script> 0 :call <SID>Tb_SwitchTo( 10)<CR>:<BS>
            "INSERT mode bindings for vim( terminal)
            inoremap <unique> <script> 1 <esc>:call <SID>Tb_SwitchTo( 1)<CR>:<BS>i
            inoremap <unique> <script> 2 <esc>:call <SID>Tb_SwitchTo( 2)<CR>:<BS>i
            inoremap <unique> <script> 3 <esc>:call <SID>Tb_SwitchTo( 3)<CR>:<BS>i
            inoremap <unique> <script> 4 <esc>:call <SID>Tb_SwitchTo( 4)<CR>:<BS>i
            inoremap <unique> <script> 5 <esc>:call <SID>Tb_SwitchTo( 5)<CR>:<BS>i
            inoremap <unique> <script> 6 <esc>:call <SID>Tb_SwitchTo( 6)<CR>:<BS>i
            inoremap <unique> <script> 7 <esc>:call <SID>Tb_SwitchTo( 7)<CR>:<BS>i
            inoremap <unique> <script> 8 <esc>:call <SID>Tb_SwitchTo( 8)<CR>:<BS>i
            inoremap <unique> <script> 9 <esc>:call <SID>Tb_SwitchTo( 9)<CR>:<BS>i
            inoremap <unique> <script> 0 <esc>:call <SID>Tb_SwitchTo( 10)<CR>:<BS>i
      endif
endif" %%


" Tb_ <Script> internal map ~~
noremap <unique> <script> <Plug>TabBar  :call <SID>StartTabBar(1, -1)<CR>:<BS>
noremap <unique> <script> <Plug>CTabBar :call <SID>StopTabBar(1)<CR>:<BS>
noremap <unique> <script> <Plug>UTabBar :call <SID>AutoUpdate(-1)<CR>:<BS>
noremap <unique> <script> <Plug>TTabBar :call <SID>ToggleTabBar()<CR>:<BS>
" %%


" Tb_ commands ~~
if !exists(':TabBar')
      command! TabBar  call <SID>StartTabBar(1, -1)
endif

if !exists(':CTabBar')
      command! CTabBar  call <SID>StopTabBar(1)
endif

if !exists(':UTabBar')
      command! UTabBar  call <SID>AutoUpdate(-1)
endif

if !exists(':TTabBar')
      command! TTabBar  call <SID>ToggleTabBar()
endif

if !exists(':Tb_bn')
      command! Tbbbn call <SID>CycleBuffer(1)
endif
if !exists(':Tb_bp')
      command! Tbbbp call <SID>CycleBuffer(0)
endif " %%



" Global Configuration Variables
" Debug Level ~~
"   0 = no logging
" 1-5 = errors ; 1 is the most important
" 5-9 = info ; 5 is the most important
"  10 = Entry/Exit
if !exists('g:Tb_DebugLevel')
      let g:Tb_DebugLevel = 0
endif" %%


" Debug Mode ~~
" 0 = debug to a window
" 1 = use vim's echo facility
" 2 = write to a file named TabBar.DBG
"     in the directory where vim was started
"     THIS IS VERY SLOW
" 3 = Write into g:Tb_DebugOutput
"     global variable [This is the default]
if !exists('g:Tb_DebugMode')
      let g:Tb_DebugMode = 3
endif" %%


" Allow auto update? ~~
" We start out with this off for startup, but once vim is running we 
" turn this on.
if !exists('g:Tb_AutoUpdate')
      let g:Tb_AutoUpdate = 0
endif" %%


" MoreThanOne? ~~
" Display Mini Buf Explorer when there are 'More Than One' eligible buffers 
if !exists('g:Tb_MoreThanOne')
      let g:Tb_MoreThanOne = 2
endif" %%


" Split below/above/left/right? ~~
" When opening a new -TabBar- window, split the new windows below or 
" above the current window?  1 = below, 0 = above.
if !exists('g:Tb_SplitBelow')
      let g:Tb_SplitBelow = &splitbelow
endif" %%


" Horizontal or Vertical explorer? ~~
" For folks that like vertical explorers, I'm caving in and providing for
" veritcal splits. If this is set to 0 then the current horizontal 
" splitting logic will be run. If however you want a vertical split,
" assign the width (in characters) you wish to assign to the Tb_ window.
if !exists('g:Tb_VSplit')
      let g:Tb_VSplit = 0
endif" %%


" TabWrap? ~~
" By default line wrap is used (possibly breaking a tab name between two
" lines.) Turning this option on (setting it to 1) can take more screen
" space, but will make sure that each tab is on one and only one line.
if !exists('g:Tb_TabWrap')
    let g:Tb_TabWrap = 0
endif" %%


" Switch buffers using Ctrl-Tab ?~~
if !exists('g:Tb_cTabSwitchBufs')
    let g:Tb_cTabSwitchBufs = 1
endif" %%


" if cTabSwitchBufs is turned on then we turn off cTabSwitchWindows.~~
if g:Tb_cTabSwitchBufs == 1 || !exists('g:Tb_cTabSwitchWindows')
      let g:Tb_cTabSwitchWindows = 0
endif" %%


" If we have enabled <C-TAB> and <C-S-TAB> to switch buffers~~
" in the current window then perform the remapping
if g:Tb_cTabSwitchBufs
    noremap <C-TAB>   :call <SID>CycleBuffer(1)<CR>:<BS>
    noremap <C-S-TAB> :call <SID>CycleBuffer(0)<CR>:<BS>
endif "%%


" If we have enabled <C-TAB> and <C-S-TAB> to switch windows ~~
" then perform the remapping
if g:Tb_cTabSwitchWindows
    noremap <C-TAB>   <C-W>w
    noremap <C-S-TAB> <C-W>W
endif "%%


" Modifiable Select Target ~~
if !exists('g:Tb_ModSelTarget')
      let g:Tb_ModSelTarget = 0
endif "%%


" Force Syntax Enable ~~
if !exists('g:Tb_ForceSyntaxEnable')
      let g:Tb_ForceSyntaxEnable = 0
endif "%%


" Single/Double Click? ~~
" flag that can be set to 1 in a users .vimrc to allow 
" single click switching of tabs. By default we use
" double click for tab selection.
if !exists('g:Tb_UseSingleClick')
      let g:Tb_UseSingleClick = 0
endif

"
" attempt to perform single click mapping, it would be much
" nicer if we could nnoremap <buffer> ... however vim does
" not fire the <buffer> <leftmouse> when you use the mouse
" to enter a buffer.
"
if g:Tb_UseSingleClick == 1
    let s:clickmap = ':if bufname("%") == "-TabBar-" <bar> call <SID>Tb_Click() <bar> endif <CR>'
    if maparg('<LEFTMOUSE>', 'n') == '' 
        " no mapping for leftmouse
        exec ':nnoremap <silent> <LEFTMOUSE> <LEFTMOUSE>' . s:clickmap
    else
        " we have a mapping
        let  g:Tb_DoneClickSave = 1
        let  s:m = ':nnoremap <silent> <LEFTMOUSE> <LEFTMOUSE>'
        let  s:m = s:m . substitute(substitute(maparg('<LEFTMOUSE>', 'n'), '|', '<bar>', 'g'), '\c^<LEFTMOUSE>', '', '')
        let  s:m = s:m . s:clickmap
        exec s:m
    endif
endif " %%



" Variables used internally
" Script/Global variables ~~
" Global used to store the buffer list so we don't update the
" UI unless the list has changed.
if !exists('g:Tb_BufList')
    let g:Tb_BufList = ''
endif "%%


" Variable used as a mutex so that we don't do lots~~
" of AutoUpdates at the same time.
if !exists('g:Tb_InAutoUpdate')
    let g:Tb_InAutoUpdate = 0
endif "%%


"~~
if !exists('g:Tb_MaxSize')
      let g:Tb_MaxSize = 1
      "TODO implement Tb_MaxHeight
endif "%%


"~~
if !exists('g:Tb_MinSize')
      let g:Tb_MinSize = 1
      "TODO implement Tb_MaxHeight
endif "%%


" In debug mode 3 this variable will hold the debug output~~
if !exists('g:Tb_DebugOutput')
      let g:Tb_DebugOutput = ''
endif "%%


" In debug mode 3 this variable will hold the debug output~~
if !exists('g:Tb_ForceDisplay')
      let g:Tb_ForceDisplay = 0
endif "%%


" Variable used to pass maxTabWidth info between functions
let s:maxTabWidth = 0


" Variable used to count debug output lines
let s:debugIndex = 0


" Setup an autocommand group and some autocommands ~~
" that keep our explorer updated automatically.
augroup TabBar
autocmd TabBar BufDelete   * call <SID>DEBUG('-=> BufDelete AutoCmd', 10) |call <SID>AutoUpdate(expand('<abuf>'))
autocmd TabBar BufEnter    * call <SID>DEBUG('-=> BufEnter  AutoCmd', 10) |call <SID>AutoUpdate(-1)
autocmd TabBar VimEnter    * call <SID>DEBUG('-=> VimEnter  AutoCmd', 10) |let g:Tb_AutoUpdate = 1 |call <SID>AutoUpdate(-1)
" %%



" Functions
" StartTabBar - Sets up our explorer and causes it to be displayed ~~
function! <SID>StartTabBar(sticky, delBufNum)
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering StartTabBar()'   ,10)
    endif

    if a:sticky == 1
        let g:Tb_AutoUpdate = 1
    endif

    " Store the current buffer
    let l:curBuf = bufnr('%')

    " Prevent a report of our actions from showing up.
    let l:save_rep = &report
    let l:save_sc  = &showcmd
    let &report    = 10000
    set noshowcmd

    call <SID>FindCreateWindow('-TabBar-', -1, 1)

    " Make sure we are in our window
    if bufname('%') != '-TabBar-'
        call <SID>DEBUG('StartTabBar called in invalid window',1)
        let &report  = l:save_rep
        let &showcmd = l:save_sc
        return
    endif

    " !!! We may want to make the following optional -- Bindu
    " New windows don't cause all windows to be resized to equal sizes
    set noequalalways
    " !!! We may want to make the following optional -- Bindu
    " We don't want the mouse to change focus without a click
    set nomousefocus

    " If folks turn numbering and columns on by default we will turn 
    " them off for the Tb_ window
    setlocal foldcolumn=0
    setlocal nonumber

    if has("syntax")
        syn clear
        syn match Tb_Normal             '\[[^\]]*\]'
        syn match Tb_Changed            '\[[^\]]*\]+'
        syn match Tb_VisibleNormal      '\[[^\]]*\]\*+\='
        syn match Tb_VisibleChanged     '\[[^\]]*\]\*+'

        if !exists("g:did_tabbar_syntax_inits")
            let g:did_tabbar_syntax_inits = 1
            highlight def link Tb_Normal         Comment
            highlight def link Tb_Changed        String
            highlight def link Tb_VisibleNormal  StatusLineNC
            highlight def link Tb_VisibleChanged Special
        endif
    endif


    " If you press return in the -TabBar- then try
    " to open the selected buffer in the previous window.
    nnoremap <buffer> <CR> :call <SID>Tb_SelectBuffer()<CR>:<BS>


    " If you DoubleClick in the -TabBar- then try
    " to open the selected buffer in the previous window.
    nnoremap <buffer> <2-LEFTMOUSE> :call <SID>Tb_DoubleClick()<CR>:<BS>


    " If you press d in the -TabBar- then try to
    " delete the selected buffer.
    nnoremap <buffer> d :call <SID>Tb_DeleteBuffer()<CR>:<BS>


    " If you press w in the -TabBar- then switch back
    " to the previous window.
    nnoremap <buffer> p :wincmd p<CR>:<BS>

    " The following allows for quicker moving between buffer
    " names in the [Tb_] window it also saves the last-pattern
    " and restores it.
    nnoremap <buffer> <TAB>   :call search('\[[0-9]*:[^\]]*\]')<CR>:<BS>
    nnoremap <buffer> <S-TAB> :call search('\[[0-9]*:[^\]]*\]','b')<CR>:<BS>

    call <SID>DisplayBuffers(a:delBufNum)

    if (l:curBuf != -1)
        call search('\['.l:curBuf.':'.expand('#'.l:curBuf.':t').'\]')
    else
        call <SID>DEBUG('No current buffer to search for',9)
    endif

    let &report  = l:save_rep
    let &showcmd = l:save_sc

    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Completed StartTabBar()'  ,10)
    endif
endfunction " %%


" StopTabBar - Looks for our explorer and closes the window if it is opened ~~
function! <SID>StopTabBar( sticky)
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering StopTabBar()'    ,10)
    endif

    if a:sticky == 1
        let g:Tb_AutoUpdate = 0
    endif

    let l:winNum = <SID>FindWindow('-TabBar-')

    if l:winNum != -1
        exec l:winNum.' wincmd w'
        silent! close
        wincmd p
    endif

    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Completed StopTabBar()'   ,10)
    endif
endfunction " %%


" ToggleTabBar - Looks for our explorer and opens/closes the window ~~
function! <SID>ToggleTabBar()
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering ToggleTabBar()'  ,10)
    endif

    let g:Tb_AutoUpdate = 0

    let l:winNum = <SID>FindWindow('-TabBar-')

    if l:winNum != -1 
        call <SID>StopTabBar(1)
    else
        call <SID>StartTabBar(1, -1)
        wincmd p
    endif

    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Completed ToggleTabBar()' ,10)
    endif
endfunction " %%


" FindWindow - Return the window number of a named buffer ~~
" If none is found then returns -1. 
function! <SID>FindWindow(bufName)
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering FindWindow()',10)
    endif

  " Try to find an existing window that contains 
  " our buffer.
  let l:bufNum = bufnr(a:bufName)
  if l:bufNum != -1
    if g:Tb_DebugLevel > 0
      call <SID>DEBUG('Found buffer ('.a:bufName.'): '.l:bufNum,9)
    endif
    let l:winNum = bufwinnr(l:bufNum)
  else
    let l:winNum = -1
  endif

  return l:winNum

endfunction
" %%


" FindCreateWindow - Attempts to find a window for a named buffer. ~~
"
" If it is found then moves there. Otherwise creates a new window and 
" configures it and moves there.
"
" forceEdge, -1 use defaults, 0 below, 1 above
" isExplorer, 0 no, 1 yes 
" 0 no, 1 yes
function! <SID>FindCreateWindow(bufName, forceEdge, isExplorer)
  if g:Tb_DebugLevel > 0
    call <SID>DEBUG('Entering FindCreateWindow('.a:bufName.')',10)
  endif

  " Save the user's split setting.
  let l:saveSplitBelow = &splitbelow

  " Set to our new values.
  let &splitbelow = g:Tb_SplitBelow

  " Try to find an existing explorer window
  let l:winNum = <SID>FindWindow(a:bufName)

  " If found goto the existing window, otherwise 
  " split open a new window.
  if l:winNum != -1
    if g:Tb_DebugLevel > 0
      call <SID>DEBUG('Found window ('.a:bufName.'): '.l:winNum,9)
    endif
    exec l:winNum.' wincmd w'
    let l:winFound = 1
  else

        "if g:Tb_SplitToEdge == 1 || a:forceEdge >= 0
        if a:forceEdge >= 0

            let l:edge = &splitbelow
            if a:forceEdge >= 0
                let l:edge = a:forceEdge
            endif

            if l:edge
                if g:Tb_VSplit == 0
                exec 'bo sp '.a:bufName
                else
                exec 'bo vsp '.a:bufName
                endif
            else
                if g:Tb_VSplit == 0
                exec 'to sp '.a:bufName
                else
                exec 'to vsp '.a:bufName
                endif
            endif
        else
            if g:Tb_VSplit == 0
            exec 'sp '.a:bufName
            else
            " &splitbelow doesn't affect vertical splits
            " so we have to do this explicitly.. ugh.
            if &splitbelow
                exec 'rightb vsp '.a:bufName
            else
                exec 'vsp '.a:bufName
            endif
            endif
        endif

    let g:Tb_ForceDisplay = 1

    " Try to find an existing explorer window
    let l:winNum = <SID>FindWindow(a:bufName)
    if l:winNum != -1
      if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Created and then found window ('.a:bufName.'): '.l:winNum,9)
      endif
      exec l:winNum.' wincmd w'
    else
      if g:Tb_DebugLevel > 0
        call <SID>DEBUG('FindCreateWindow failed to create window ('.a:bufName.').',1)
      endif
      return
    endif

    if a:isExplorer
      " Turn off the swapfile, set the buffer type so that it won't get written,
      " and so that it will get deleted when it gets hidden and turn on word wrap.
      setlocal noswapfile
      setlocal buftype=nofile
      setlocal bufhidden=delete
      if g:Tb_VSplit == 0
        setlocal wrap
      else
        setlocal nowrap
        exec('setlocal winwidth='.g:Tb_MinSize)
      endif
    endif

    if g:Tb_DebugLevel > 0
      call <SID>DEBUG('Window ('.a:bufName.') created: '.winnr(),9)
    endif

  endif

  " Restore the user's split setting.
  let &splitbelow = l:saveSplitBelow

endfunction " %%


" DisplayBuffers - Wrapper for getting Tb_ window shown ~~
"
" Makes sure we are in our explorer, then erases the current buffer and turns 
" it into a mini buffer explorer window.
function! <SID>DisplayBuffers(delBufNum)
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering DisplayBuffers()',10)
    endif
  " Make sure we are in our window
  if bufname('%') != '-TabBar-'
    call <SID>DEBUG('DisplayBuffers called in invalid window',1)
    return
  endif

  " We need to be able to modify the buffer
  setlocal modifiable

  call <SID>ShowBuffers(a:delBufNum)
  call <SID>ResizeWindow()

  normal! zz

  " Prevent the buffer from being modified.
  setlocal nomodifiable
  set nobuflisted

endfunction " %%


" Resize Window - Set width/height of Tb_ window ~~
" 
" Makes sure we are in our explorer, then sets the height/width for our explorer 
" window so that we can fit all of our information without taking extra lines.
function! <SID>ResizeWindow()
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering ResizeWindow()',10)
    endif

  " Make sure we are in our window
  if bufname('%') != '-TabBar-'
    call <SID>DEBUG('ResizeWindow called in invalid window',1)
    return
  endif

  let l:width  = winwidth('.')

  " Horizontal Resize
  if g:Tb_VSplit == 0

    if g:Tb_TabWrap == 0
      let l:length = strlen(getline('.'))
      let l:height = 0
      if (l:width == 0)
        let l:height = winheight('.')
      else
        let l:height = (l:length / l:width)
        " handle truncation from div
        if (l:length % l:width) != 0
          let l:height = l:height + 1
        endif
      endif
    else
      exec("setlocal textwidth=".l:width)
      normal gg
      normal gq}
      normal G
      let l:height = line('.')
      normal gg
    endif

    " enforce max window height
    if g:Tb_MaxSize != 0
      if g:Tb_MaxSize < l:height
        let l:height = g:Tb_MaxSize
      endif
    endif

    " enfore min window height
    if l:height < g:Tb_MinSize || l:height == 0
      let l:height = g:Tb_MinSize
    endif

    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('ResizeWindow to '.l:height.' lines',9)
    endif
    exec('resize '.l:height)

  " Vertical Resize
  else 

    if g:Tb_MaxSize != 0
      let l:newWidth = s:maxTabWidth
      if l:newWidth > g:Tb_MaxSize 
          let l:newWidth = g:Tb_MaxSize
      endif
      if l:newWidth < g:Tb_MinSize
          let l:newWidth = g:Tb_MinSize
      endif
    else
      let l:newWidth = g:Tb_VSplit
    endif

    if l:width != l:newWidth
        if g:Tb_DebugLevel > 0
            call <SID>DEBUG('ResizeWindow to '.l:newWidth.' columns',9)
        endif
      exec('vertical resize '.l:newWidth)
    endif

  endif

endfunction " %%


" ShowBuffers - Clear current buffer and put the Tb_ text into it ~~
" Makes sure we are in our explorer, then adds a list of all modifiable 
" buffers to the current buffer. Special marks are added for buffers that 
" are in one or more windows (*) and buffers that have been modified (+)
function! <SID>ShowBuffers(delBufNum)
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering ShowBuffers()',10)
    endif

  let l:ListChanged = <SID>BuildBufferList(a:delBufNum, 1)

  if (l:ListChanged == 1 || g:Tb_ForceDisplay)
    let l:save_rep = &report
    let l:save_sc = &showcmd
    let &report = 10000
    set noshowcmd 

    " Delete all lines in buffer.
    1,$d _
  
    " Goto the end of the buffer put the buffer list 
    " and then delete the extra trailing blank line
    $
    put! =g:Tb_BufList
    $ d _

    let g:Tb_ForceDisplay = 0

    let &report  = l:save_rep
    let &showcmd = l:save_sc
  else
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Buffer list not update since there was no change',9)
    endif
  endif
endfunction " %%


" Max - Returns the max of two numbers ~~
function! <SID>Max(argOne, argTwo)
  if a:argOne > a:argTwo
    return a:argOne
  else
    return a:argTwo
  endif
endfunction " %%


" TbSwitchTo      Switch to bufNum( parameter) buffer~~
function! <SID>Tb_SwitchTo( bufNum)

    let l:NBuffers = bufnr('$')     " Get the number of the last buffer.
    let l:i = 0                     " Set the buffer index to zero.
    let l:y = 0  " Displayed buffers: more sugestive
    let l:fileNames = ''
    let l:maxTabWidth = 0

    " Loop through every buffer less than the total number of buffers.
    while( l:i <= l:NBuffers)
        let l:i = l:i + 1

        " If we have a delBufNum and it is the current
        " buffer then ignore the current buffer. 
        " Otherwise, continue.
"        if (a:delBufNum == -1 || l:i != a:delBufNum)
            " Make sure the buffer in question is listed.
            if(getbufvar(l:i, '&buflisted') == 1)
                " Get the name of the buffer.
                let l:BufName = bufname(l:i)
                " Check to see if the buffer is a blank or not. If the buffer does have
                " a name, process it.
                if(strlen(l:BufName))
                    " Only show modifiable buffers (The idea is that we don't 
                    " want to show Explorers)
                    if (getbufvar(l:i, '&modifiable') == 1 && BufName != '-TabBar-')
                        let l:y =l:y +1
                        if l:y == a:bufNum
                            exec "b!" .l:i
                        endif
                        if l:y > a:bufNum
                            return 0
                        endif
                    endif
                endif
            endif
        "endif
    endwhile
endfunction " %%


" BuildBufferList - Build the text for the Tb_ window ~~
" Creates the buffer list string and returns 1 if it is different than
" last time this was called and 0 otherwise.
function! <SID>BuildBufferList(delBufNum, updateBufList)
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering BuildBufferList()',10)
    endif

    let l:NBuffers = bufnr('$')     " Get the number of the last buffer.
    let l:i = 0                     " Set the buffer index to zero.
    let l:y = 0  " Displayed buffers: more sugestive
    let l:fileNames = ''
    let l:maxTabWidth = 0

    " Loop through every buffer less than the total number of buffers.
while( l:i <= l:NBuffers)
    let l:i = l:i + 1

    " If we have a delBufNum and it is the current
    " buffer then ignore the current buffer. 
    " Otherwise, continue.
if (a:delBufNum == -1 || l:i != a:delBufNum)
    " Make sure the buffer in question is listed.
    if(getbufvar(l:i, '&buflisted') == 1)
    " Get the name of the buffer.
let l:BufName = bufname(l:i)
    " Check to see if the buffer is a blank or not. If the buffer does have
    " a name, process it.
if(strlen(l:BufName))
    " Only show modifiable buffers (The idea is that we don't 
    " want to show Explorers)
    if (getbufvar(l:i, '&modifiable') == 1 && BufName != '-TabBar-')

    " Get filename & Remove []'s & ()'s
    let l:shortBufName = fnamemodify(l:BufName, ":t")
    let l:shortBufName = substitute(l:shortBufName, '[][()]', '', 'g')
    let l:y =l:y +1
    let l:tab = '['.l:y.':'.l:shortBufName." ]"

    " If the buffer is open in a window mark it
    if bufwinnr(l:i) != -1
    let l:tab = "[".l:y.':'.l:shortBufName."]*"
    "              let l:tab = '*'.l:tab
    endif

    " If the buffer is modified then mark it
    if(getbufvar(l:i, '&modified') == 1)
    let l:tab = l:tab . '+'
    endif



let l:maxTabWidth = <SID>Max(strlen(l:tab), l:maxTabWidth)
    let l:fileNames = l:fileNames.l:tab

    " If horizontal and tab wrap is turned on we need to add spaces
    if g:Tb_VSplit == 0
    if g:Tb_TabWrap != 0
    let l:fileNames = l:fileNames.' '
    endif
    " If not horizontal we need a newline
    else
    let l:fileNames = l:fileNames . "\n"
    endif
    endif
    endif
    endif
    endif
    endwhile

    if (g:Tb_BufList != l:fileNames)
if (a:updateBufList)
    let g:Tb_BufList = l:fileNames
    let s:maxTabWidth = l:maxTabWidth
    endif
    return 1
    else
    return 0
    endif

endfunction " %%


" HasEligibleBuffers - Are there enough Tb_ eligible buffers to open the Tb_ window? ~~
" Returns 1 if there are any buffers that can be displayed in a 
" mini buffer explorer. Otherwise returns 0. If delBufNum is
" any non -1 value then don't include that buffer in the list
" of eligible buffers.
function! <SID>HasEligibleBuffers(delBufNum)
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering HasEligibleBuffers()',10)
    endif

  let l:save_rep = &report
  let l:save_sc = &showcmd
  let &report = 10000
  set noshowcmd 
  
  let l:NBuffers = bufnr('$')     " Get the number of the last buffer.
  let l:i        = 0              " Set the buffer index to zero.
  let l:found    = 0              " No buffer found

  if (g:Tb_MoreThanOne > 1)
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('More Than One mode turned on',6)
    endif
  endif
  let l:needed = g:Tb_MoreThanOne

  " Loop through every buffer less than the total number of buffers.
  while(l:i <= l:NBuffers && l:found < l:needed)
    let l:i = l:i + 1
   
    " If we have a delBufNum and it is the current
    " buffer then ignore the current buffer. 
    " Otherwise, continue.
    if (a:delBufNum == -1 || l:i != a:delBufNum)
      " Make sure the buffer in question is listed.
      if (getbufvar(l:i, '&buflisted') == 1)
        " Get the name of the buffer.
        let l:BufName = bufname(l:i)
        " Check to see if the buffer is a blank or not. If the buffer does have
        " a name, process it.
        if (strlen(l:BufName))
          " Only show modifiable buffers (The idea is that we don't 
          " want to show Explorers)
          if ((getbufvar(l:i, '&modifiable') == 1) && (BufName != '-TabBar-'))
            
              let l:found = l:found + 1
  
          endif
        endif
      endif
    endif
  endwhile

  let &report  = l:save_rep
  let &showcmd = l:save_sc

    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('HasEligibleBuffers found '.l:found.' eligible buffers of '.l:needed.' needed',6)
    endif

  return (l:found >= l:needed)
endfunction " %%


" Auto Update - Function called by auto commands for auto updating the Tb_ ~~
"     IF auto update is turned on        AND
"     we are in a real buffer         AND
"     we have enough eligible buffers THEN
"     Update our explorer and get back to the current window
" If we get a buffer number for a buffer that 
" is being deleted, we need to make sure and 
" remove the buffer from the list of eligible 
" buffers in case we are down to one eligible
" buffer, in which case we will want to close
" the Tb_ window.
function! <SID>AutoUpdate(delBufNum)
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering AutoUpdate('.a:delBufNum.') : '.bufnr('%').' : '.bufname('%'),10)
    endif

      if (g:Tb_InAutoUpdate == 1)
            if g:Tb_DebugLevel > 0
                  call <SID>DEBUG('AutoUpdate recursion stopped',9)
                  call <SID>DEBUG('Terminated AutoUpdate()'    ,10)
            endif
            return
      else
            let g:Tb_InAutoUpdate = 1
      endif

" Don't update the TabBar window
if (bufname('%') == '-TabBar-')
    " If this is the only buffer left then toggle the buffer
      if (winbufnr(2) == -1)
            call <SID>CycleBuffer(1)
            if g:Tb_DebugLevel > 0
                  call <SID>DEBUG('AutoUpdate does not run for cycled windows', 9)
            endif
      else
            if g:Tb_DebugLevel > 0
                  call <SID>DEBUG('AutoUpdate does not run for the Tb_ window', 9)
            endif
      endif

      if g:Tb_DebugLevel > 0
            call <SID>DEBUG('Terminated AutoUpdate()'    ,10)
      endif

      let g:Tb_InAutoUpdate = 0
      return
endif

if (a:delBufNum != -1)
      if g:Tb_DebugLevel > 0
            call <SID>DEBUG('AutoUpdate will make sure that buffer '.a:delBufNum.' is not included in the buffer list.', 5)
      endif
endif

  " Only allow updates when the AutoUpdate flag is set
  " this allows us to stop updates on startup.
if g:Tb_AutoUpdate == 1
      " Only show TabBar if we have a real buffer
      if ((g:Tb_MoreThanOne == 0) || (bufnr('%') != -1 && bufname('%') != ""))
            if <SID>HasEligibleBuffers(a:delBufNum) == 1
            " if we don't have a window then create one
                  let l:bufnr = <SID>FindWindow('-TabBar-')
                  if (l:bufnr == -1)
                        if g:Tb_DebugLevel > 0
                              call <SID>DEBUG('About to call StartTabBar (Create Tb_)', 9)
                        endif
                        call <SID>StartTabBar(0, a:delBufNum)
                  else
                  " otherwise only update the window if the contents have changed
                        let l:ListChanged = <SID>BuildBufferList(a:delBufNum, 0)
                        if (l:ListChanged)
                              if g:Tb_DebugLevel > 0
                                    call <SID>DEBUG('About to call StartTabBar (Update Tb_)', 9) 
                              endif
                              call <SID>StartTabBar(0, a:delBufNum)
                        endif
                  endif

                  " go back to the working buffer
                  if (bufname('%') == '-TabBar-')
                        wincmd p
                  endif
            else
                  if g:Tb_DebugLevel > 0
                        call <SID>DEBUG('Failed in eligible check', 9)
                  endif
                  call <SID>StopTabBar(0)
            endif

	  " VIM sometimes turns syntax highlighting off,
	  " we can force it on, but this may cause weird
	  " behavior so this is an optional hack to force
	  " syntax back on when we enter a buffer
	      if g:Tb_ForceSyntaxEnable
                  if g:Tb_DebugLevel > 0
                        call <SID>DEBUG('Enable Syntax', 9)
                  endif
		      exec 'syntax enable'
	      endif

    else
            if g:Tb_DebugLevel > 0
                  call <SID>DEBUG('No buffers loaded...',9)
            endif
    endif
else
    if g:Tb_DebugLevel > 0
          call <SID>DEBUG('AutoUpdates are turned off, terminating',9)
    endif
endif


if g:Tb_DebugLevel > 0
      call <SID>DEBUG('Completed AutoUpdate()'     ,10)
endif

let g:Tb_InAutoUpdate = 0
endfunction " %%


" GetSelectedBuffer - From the Tb_ window, return the bufnum for buf under cursor ~~
" If we are in our explorer window then return the buffer number
" for the buffer under the cursor.
function! <SID>GetSelectedBuffer()
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering GetSelectedBuffer()',10)
    endif

  " Make sure we are in our window
      if bufname('%') != '-TabBar-'
            if g:Tb_DebugLevel > 0
                  call <SID>DEBUG('GetSelectedBuffer called in invalid window',1)
            endif
            return -1
      endif

      let l:save_reg = @"
      let @" = ""
      normal ""yi[
      if @" != ""
            let l:retv = substitute(@",'\([0-9]*\):.*', '\1', '') + 0
            let @" = l:save_reg
            return l:retv
      else
            let @" = l:save_reg
            return -1
      endif
endfunction " %%


" Tb_SelectBuffer - From the Tb_ window, open buffer under the cursor ~~
" If we are in our explorer, then we attempt to open the buffer under the
" cursor in the previous window.
function! <SID>Tb_SelectBuffer()
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering Tb_SelectBuffer()' ,10)
    endif

  " Make sure we are in our window
  if bufname('%') != '-TabBar-'
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Tb_SelectBuffer called in invalid window',1)
    endif
    return
  endif

  let l:save_rep = &report
  let l:save_sc  = &showcmd
  let &report    = 10000
  set noshowcmd

  let l:bufnr  = <SID>GetSelectedBuffer()
  let l:resize = 0

  if(l:bufnr != -1)             " If the buffer exists.

    let l:saveAutoUpdate = g:Tb_AutoUpdate
    let g:Tb_AutoUpdate = 0
    " Switch to the previous window
    wincmd p

    " If we are in the buffer explorer or in a nonmodifiable buffer with
    " g:Tb_ModSelTarget set then try another window (a few times)
    if bufname('%') == '-TabBar-' || (g:Tb_ModSelTarget == 1 && getbufvar(bufnr('%'), '&modifiable') == 0)
      wincmd w
      if bufname('%') == '-TabBar-' || (g:Tb_ModSelTarget == 1 && getbufvar(bufnr('%'), '&modifiable') == 0)
        wincmd w
        if bufname('%') == '-TabBar-' || (g:Tb_ModSelTarget == 1 && getbufvar(bufnr('%'), '&modifiable') == 0)
          wincmd w
          " The following handles the case where -TabBar-
          " is the only window left. We need to resize so we don't
          " end up with a 1 or two line buffer.
          if bufname('%') == '-TabBar-'
            let l:resize = 1
          endif
        endif
      endif
    endif

    "exec('b! '.l:bufnr)
    call <SID>Tb_SwitchTo( l:bufnr)
    if (l:resize)
      resize
    endif
    let g:Tb_AutoUpdate = l:saveAutoUpdate
    call <SID>AutoUpdate(-1)

  endif

  let &report  = l:save_rep
  let &showcmd = l:save_sc

    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Completed Tb_SelectBuffer()',10)
    endif
endfunction " %%


" Tb_DeleteBuffer - From the Tb_ window, delete selected buffer from list ~~
" After making sure that we are in our explorer, This will delete the buffer 
" under the cursor. If the buffer under the cursor is being displayed in a
" window, this routine will attempt to get different buffers into the 
" windows that will be affected so that windows don't get removed.
function! <SID>Tb_DeleteBuffer()
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering Tb_DeleteBuffer()' ,10)
    endif

  " Make sure we are in our window
  if bufname('%') != '-TabBar-'
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Tb_DeleteBuffer called in invalid window',1)
    endif
    return 
  endif

  let l:curLine    = line('.')
  let l:curCol     = virtcol('.')
  let l:selBuf     = <SID>GetSelectedBuffer()
  let l:selBufName = bufname(l:selBuf)

  if l:selBufName == 'TabBar.DBG' && g:Tb_DebugLevel > 0
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Tb_DeleteBuffer will not delete the debug window, when debugging is turned on.',1)
    endif
    return
  endif

  let l:save_rep = &report
  let l:save_sc  = &showcmd
  let &report    = 10000
  set noshowcmd 
  
  
  if l:selBuf != -1 

    " Don't want auto updates while we are processing a delete
    " request.
    let l:saveAutoUpdate = g:Tb_AutoUpdate
    let g:Tb_AutoUpdate = 0

    " Save previous window so that if we show a buffer after
    " deleting. The show will come up in the correct window.
    wincmd p
    let l:prevWin    = winnr()
    let l:prevWinBuf = winbufnr(winnr())

    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Previous window: '.l:prevWin.' buffer in window: '.l:prevWinBuf,5)
        call <SID>DEBUG('Selected buffer is <'.l:selBufName.'>['.l:selBuf.']',5)
    endif

    " If buffer is being displayed in a window then 
    " move window to a different buffer before 
    " deleting this one. 
    let l:winNum = (bufwinnr(l:selBufName) + 0)
    " while we have windows that contain our buffer
    while l:winNum != -1 
        if g:Tb_DebugLevel > 0
            call <SID>DEBUG('Buffer '.l:selBuf.' is being displayed in window: '.l:winNum,5)
        endif

        " move to window that contains our selected buffer
        exec l:winNum.' wincmd w'

        if g:Tb_DebugLevel > 0
            call <SID>DEBUG('We are now in window: '.winnr().' which contains buffer: '.bufnr('%').' and should contain buffer: '.l:selBuf,5)
        endif

        let l:origBuf = bufnr('%')
        call <SID>CycleBuffer(1)
        let l:curBuf  = bufnr('%')

        if g:Tb_DebugLevel > 0
            call <SID>DEBUG('Window now contains buffer: '.bufnr('%').' which should not be: '.l:selBuf,5)
        endif

        if l:origBuf == l:curBuf
            " we wrapped so we are going to have to delete a buffer 
            " that is in an open window.
            let l:winNum = -1
        else
            " see if we have anymore windows with our selected buffer
            let l:winNum = (bufwinnr(l:selBufName) + 0)
        endif
    endwhile

    " Attempt to restore previous window
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Restoring previous window to: '.l:prevWin,5)
    endif
    exec l:prevWin.' wincmd w'

    " Try to get back to the -TabBar- window 
    let l:winNum = bufwinnr(bufnr('-TabBar-'))
    if l:winNum != -1
        exec l:winNum.' wincmd w'
        if g:Tb_DebugLevel > 0
            call <SID>DEBUG('Got to -TabBar- window: '.winnr(),5)
        endif
    else
        if g:Tb_DebugLevel > 0
            call <SID>DEBUG('Unable to get to -TabBar- window',1)
        endif
    endif
  
    " Delete the buffer selected.
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('About to delete buffer: '.l:selBuf,5)
    endif
    exec('silent! bd '.l:selBuf)

    let g:Tb_AutoUpdate = l:saveAutoUpdate 
    call <SID>DisplayBuffers(-1)
    call cursor(l:curLine, l:curCol)

  endif

  let &report  = l:save_rep
  let &showcmd = l:save_sc

    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Completed Tb_DeleteBuffer()',10)
    endif

endfunction " %%


" Tb_Click - Handle mouse double click ~~
function! s:Tb_Click()
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering Tb_Click()',10)
    endif
  call <SID>Tb_SelectBuffer()
endfunction " %%


" Tb_DoubleClick - Double click with the mouse.~~
function! s:Tb_DoubleClick()
    if g:Tb_DebugLevel > 0
        call <SID>DEBUG('Entering Tb_DoubleClick()',10)
    endif
  call <SID>Tb_SelectBuffer()
endfunction " %%


" CycleBuffer - Cycle Through Buffers ~~
" Move to next or previous buffer in the current window. If there 
" are no more modifiable buffers then stay on the current buffer.
" can be called with no parameters in which case the buffers are
" cycled forward. Otherwise a single argument is accepted, if 
" it's 0 then the buffers are cycled backwards, otherwise they
" are cycled forward.
function! <SID>CycleBuffer(forward)

  " The following hack handles the case where we only have one
  " window open and it is too small
  let l:saveAutoUpdate = g:Tb_AutoUpdate
  if (winbufnr(2) == -1)
    resize
    let g:Tb_AutoUpdate = 0
  endif
  
  " Change buffer (keeping track of before and after buffers)
  let l:origBuf = bufnr('%')
  if (a:forward == 1)
    bn!
  else
    bp!
  endif
  let l:curBuf  = bufnr('%')

  " Skip any non-modifiable buffers, but don't cycle forever
  " This should stop us from stopping in any of the [Explorers]
  while getbufvar(l:curBuf, '&modifiable') == 0 && l:origBuf != l:curBuf
    if (a:forward == 1)
        bn!
    else
        bp!
    endif
    let l:curBuf = bufnr('%')
  endwhile

  let g:Tb_AutoUpdate = l:saveAutoUpdate
  if (l:saveAutoUpdate == 1)
    call <SID>AutoUpdate(-1)
  endif
endfunction " %%


" DEBUG - Display debug output when debugging is turned on ~~
" Thanks to Charles E. Campbell, Jr. PhD <cec@NgrOyphSon.gPsfAc.nMasa.gov> 
" for Decho.vim which was the inspiration for this enhanced debugging 
" capability.
function! <SID>DEBUG(msg, level)

    if g:Tb_DebugLevel >= a:level

        " Prevent a report of our actions from showing up.
        let l:save_rep    = &report
        let l:save_sc     = &showcmd
        let &report       = 10000
        set noshowcmd

        " Debug output to a buffer
        if g:Tb_DebugMode == 0
            " Save the current window number so we can come back here
            let l:prevWin     = winnr()
            wincmd p
            let l:prevPrevWin = winnr()
            wincmd p

            " Get into the debug window or create it if needed
            call <SID>FindCreateWindow('TabBar.DBG', 1, 0, 0)

            " Make sure we really got to our window, if not we
            " will display a confirm dialog and turn debugging
            " off so that we won't break things even more.
            if bufname('%') != 'TabBar.DBG'
                call confirm('Error in window debugging code. Dissabling TabBar debugging.', 'OK')
                let g:Tb_DebugLevel = 0
            endif

            " Write Message to DBG buffer
            let res=append("$",s:debugIndex.':'.a:level.':'.a:msg)
            norm G
            "set nomodified

            " Return to original window
            exec l:prevPrevWin.' wincmd w'
            exec l:prevWin.' wincmd w'
        " Debug output using VIM's echo facility
        elseif g:Tb_DebugMode == 1
        echo s:debugIndex.':'.a:level.':'.a:msg
        " Debug output to a file -- VERY SLOW!!!
        " should be OK on UNIX and Win32 (not the 95/98 variants)
        elseif g:Tb_DebugMode == 2
            if has('system') || has('fork')
                if has('win32') && !has('win95')
                    let l:result = system("cmd /c 'echo ".s:debugIndex.':'.a:level.':'.a:msg." >> TabBar.DBG'")
                endif
                if has('unix')
                    let l:result = system("echo '".s:debugIndex.':'.a:level.':'.a:msg." >> TabBar.DBG'")
                endif
            else
                call confirm('Error in file writing version of the debugging code, vim not compiled with system or fork. Dissabling TabBar debugging.', 'OK')
                let g:Tb_DebugLevel = 0
            endif
        elseif g:Tb_DebugMode == 3
            let g:Tb_DebugOutput = g:Tb_DebugOutput."\n".s:debugIndex.':'.a:level.':'.a:msg
        endif
        let s:debugIndex = s:debugIndex + 1

        let &report  = l:save_rep
        let &showcmd = l:save_sc

    endif
endfunc " %%


"     Documentation~~
"     :MiniBufExplorer        " Open and/or goto Explorer
"     :CMiniBufExplorer       " Close the Explorer if it's open
"     :UMiniBufExplorer       " Update Explorer without navigating
"     :TMiniBufExplorer       " Toggle the Explorer window open and 
"     let g:Tb_SplitBelow=0   " Put new window above current or on the  left
                                    " for vertical split
"     let g:Tb_SplitBelow=1   " Put new window below current or on the  right
                                    " for vertical split
"     By default we are now forcing the Tabbar window to open up at the edge of
"     the screen.
"     You can turn this off by setting the following variable in .vimrc:
"
"           let g:Tb_SplitToEdge = 0

"  o  IN HORIZONTAL MODE
"     You can set the max height by setting this in .vimrc:
"
"           let g:Tb_MaxSize = <max lines: default 0>
"     
"     Setting this to 0 will mean the window gets as big as
"     needed to fit all your buffers. 
"
"  o  NOTE
"     You can set the min height by
"     letting the following variable in your .vimrc:
"
"           let g:Tb_MinSize = <min height: default 1>
"
"  o  IN VERTICAL MODE
"     By default the vertical explorer has a fixed width. If you put:
"
"       let g:Tb_MaxSize = <max width: default 0> 
"
"     into your .vimrc then tabbar will attempt to set the width of the
"     tabbar window to be as wide as your widest tab. The width will not
"     exceed MaxSize even if you have wider tabs. 
"
"     Accepting the default value of 0 for this will give you a fixed
"     width tabbar window.
"
"     You can specify a MinSize for the vertical explorer window by
"     putting the following in your .vimrc:
"
"           let g:Tb_MinSize = <min width: default 1>
"
"     This will have no effect unless you also specivy MaxSize.
"
"     This stops the -TabBar- from opening 
"     automatically until more than one eligible buffer is available.
"     You can turn this feature off by setting the following variable
"     in your .vimrc:
"       
"       let g:Tb_MoreThanOne=1
"
"     (The following enhancement is as of 6.2.2)
"     Setting this to 0 will cause the TabBar window to be loaded even
"     if no buffers are available. Setting it to 1 causes the TabBar
"     window to be loaded as soon as an eligible buffer is read. You
"     can also set it to larger numbers. So if you set it to 4 for
"     example the TabBar window wouldn't auto-open until 4 eligibles
"     buffers had been loaded. This is nice for folks that don't 
"     want an TabBar window unless they are editing more than two or
"     three buffers.
"
"     To enable the optional mapping of Control + Vim Direction Keys 
"     [hjkl] to window movement commands, you can put the following into 
"     your .vimrc:
"
"       let g:Tb_MapWindowNavVim = 1
"
"     To enable the optional mapping of Control + Arrow Keys to window 
"     movement commands, you can put the following into your .vimrc:
"
"       let g:Tb_MapWindowNavArrows = 1
"
"     To enable the optional mapping of <C-TAB> and <C-S-TAB> to a 
"     function that will bring up the next or previous buffer in the
"     current window, you can put the following into your .vimrc:
"
"       let g:Tb_MapCTabSwitchBufs = 1
"
"     To enable the optional mapping of <C-TAB> and <C-S-TAB> to mappings
"     that will move to the next and previous (respectively) window, you
"     can put the following into your .vimrc:
"
"       let g:Tb_MapCTabSwitchWindows = 1
"
"
"  o  NOTE
"     If you set the ...TabSwitchBufs AND ...TabSwitchWindows, 
"           ...TabSwitchBufs will be enabled and ...TabSwitchWindows 
"           will not.
"     
"       let g:Tb_UseSingleClick = 1
"
"     If you would like to single click on tabs rather than double
"     clicking on them to goto the selected buffer. 
"
"  o  NOTE
"     If you use the single click option in taglist.vim you may 
"           need to get an updated version that includes a patch I 
"           provided to allow both explorers to provide single click 
"           buffer selection.
"
"     It is possible to customize the the highlighting for the tabs in 
"     the TabBar by configuring the following highlighting groups:
"
"           Tb_Normal         - for buffers that have NOT CHANGED and
"                                 are NOT VISIBLE.
"           Tb_Changed        - for buffers that HAVE CHANGED and are
"                                 NOT VISIBLE
"           Tb_VisibleNormal  - buffers that have NOT CHANGED and are
"                                 VISIBLE
"           Tb_VisibleChanged - buffers that have CHANGED and are VISIBLE
"
"     You can either link to an existing highlighting group by
"     adding a command like:
"
"           hi link Tb_VisibleChanged Error
"
"     to your .vimrc or you can specify exact foreground and background
"     colors using the following syntax:
"
"           hi Tb_Changed guibg=darkblue ctermbg=darkblue termbg=white
"
"  o  NOTE
"     If you set a colorscheme in your .vimrc you should do it
"           BEFORE updating the TabBar highlighting groups.
"
"     If you use other explorers like TagList you can (As of 6.2.8) put:
"
"           let g:Tb_ModSelTarget = 1
"
"     into your .vimrc in order to force TabBar to try to place selected 
"     buffers into a window that does not have a nonmodifiable buffer.
"     The upshot of this should be that if you go into TabBar and select
"     a buffer, the buffer should not show up in a window that is 
"     hosting an explorer.
"
"           let g:Tb_ForceSyntaxEnable = 1
"
"     TabBar has had a basic debugging capability for quite some time.
"     However, it has not been very friendly in the past. As of 6.0.8, 
"     you can put one of each of the following into your .vimrc:
"
"           let g:Tb_orerDebugLevel = 0  " TabBar serious errors output
"           let g:Tb_orerDebugLevel = 4  " TabBar all errors output
"           let g:Tb_orerDebugLevel = 10 " TabBar reports everything
"
"     You can also set a DebugMode to cause output to be target as
"     follows (default is mode 3):
"
"           let g:Tb_orerDebugMode  = 0   " Errors will show up in 
"                                               " a vim window
"           let g:Tb_orerDebugMode  = 1   " Uses VIM's echo function
"                                               " to display on the screen
"           let g:Tb_orerDebugMode  = 2   " Writes to a file
"                                               " MiniBufExplorer.DBG
"           let g:Tb_orerDebugMode  = 3   " Store output in global:
"                                               " g:Tb_orerDebugOutput
"
"     Or if you are able to start VIM, you might just perform these
"     at a command prompt right before you do the operation that is
"     failing.
" %%
