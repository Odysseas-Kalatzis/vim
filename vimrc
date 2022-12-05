" Dependencies :
"   clangd
"   ripgrep
"
" Plugins :
"   ale
"   nerdcommenter
"   vim-cpp-modern
"   vim-signature
"   fzf
"   fzf.vim
"
"   Folder locations:
"   Colors at: ~/.vim/colors
"   Plugins at: ~/.vim/pack/vendor/start

syntax on
set number
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set guicursor=i:block
set noswapfile
"set nowrap
set scrolloff=5
" Hide buffers so you can switch without saving
set hidden

" Highlight incomplete word while searching for it during typing.
set incsearch

" Marker of 80 characters width
set colorcolumn=80

" Double escape to turn off highlights.
nnoremap <silent><esc><esc> :nohls <cr>
 
" For :term going into normal mode with ESC
" To exit terminal either type "exit" or press Cltr + D
tnoremap <esc> <C-\><C-n>

" Setting ignored files and directories when using e.g. :find :e etc..
set wildignore=*.o,*.a,*.so,*.d,*.pyc,*/__pycache__/,*.swp,.git/,*.class,*/target/*,/usr/*

" For GDB
let g:termdebug_wide=1
packadd! termdebug

" Set colorscheme and proper gui colors.
set background=dark
set t_Co=256
set t_ut=
set termguicolors
colorscheme torte

"For the cursor line.
set cursorline

"For searching highlights.
set hlsearch

"Settings for Pmenu
set pumheight=10

" For fuzzy finding.
" Search down into subfolders.
" Provides tab-completion for all file-related tasks.
" Use command :find <filename>
set path+=**
" Ignore case sensitivity.
set wildignorecase

" Display all matching files when we tab complete.
set wildmenu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For autocompletion using tab (equivalent to ctrl + n).
" To go back, press tab again (equivalent to ctrl + p)
setglobal complete-=i
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For commenting using NERDCommenter. For gvim use <C-/> for vim <C-_>
filetype plugin on
nmap <C-/> <Plug>NERDCommenterToggle
vmap <C-/> <Plug>NERDCommenterToggle<CR>gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for ALE. 
" To use the clangd server, sudo apt install clangd
let g:ale_linters = {
\   'c': ['clangd'],
\   'cpp': ['clangd'],
\}

let g:ale_lint_on_text_changed = "normal"
let g:ale_lint_delay=0
nnoremap <silent> <C-]> :ALEGoToDefinition <cr>
nnoremap <silent> <leader>rn :ALERename <cr>
nnoremap <silent> gr :ALEFindReferences <cr>
" It would be great to also have a map for :ALESymbolSearch.

" Only use linters specified.
let g:ale_linters_explicit = 1
" Disable linter highlights.
let g:ale_set_highlights = 0

" Linter format information for warnings and errors.
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight ALEErrorSign guibg=#111111 guifg=#dd4444
highlight ALEWarningSign guibg=#111111 guifg=#ffa500
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
" Don't show tips when cursor stays at keyword for too long.
let g:ale_hover_cursor = 0

" Press the spacebar to show the ALE hover window.
" Also note, stay_here is rendered ineffective by modifying
" ~/.vim/pack/vendor/start/ale/autoload/ale/preview.vim
" This makes cursor focus to stay in the hover window, 
" instead of returning to the code window.
nnoremap <silent><Space> :ALEHover <cr>

" Location of preview window at the bottom.
set splitbelow 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" FZF options:

" Over-write esc for fzf, this avoids bug.
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" fzf layout, number represents number of lines it takes vertically, 12.
let g:fzf_layout = {'down':'12'}

" Close FZF with either esc or ctrl+q
" Navigate up and down with cltr + j and ctrl + k
nmap <silent><C-p> :FZF<cr>
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nmap <silent><C-b> :Buffers<cr>
nmap <silent><C-t> :Tags<cr>
" Key binding for fuzzy grep, requires rg (sudo apt install ripgrep)
nmap <silent><C-n> :Rg<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

