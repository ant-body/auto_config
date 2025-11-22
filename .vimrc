set nocompatible		" required
filetype off			" required
set hidden
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set shell=/bin/zsh
set guifont=FiraCode
set guicursor=n-v-c-i:block-Cursor
let g:polyglot_disable=['markdown']

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'sheerun/vim-polyglot'
Plugin 'chrisbra/Colorizer'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lambdalisue/battery.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'rhysd/vim-clang-format'
Plugin 'preservim/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'Yggdroot/indentLine'
Plugin 'styled-components/vim-styled-components', {'branch': 'main'}

" Python environment setup
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'vim-scripts/indentpython'
Plugin 'vim-syntastic/syntastic'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'dense-analysis/ale'
Plugin 'jpalardy/vim-slime', { 'for': 'python' }
Plugin 'hanschen/vim-ipython-cell', { 'for': 'python' }

" JavaScript environment setup
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMellon/vim-jsx-pretty'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'sillybun/vim-repl'

" Code Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'prabirshrestha/asyncomplete-ultisnips.vim'

" Themes
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/gruvbox-material'
Plugin 'junegunn/seoul256.vim'

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required

syntax on
set number
set relativenumber
set autoindent
filetype plugin indent on
set spell
set re=0
set clipboard=unnamedplus
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
set hlsearch
set background=dark
set cursorline
set timeout ttimeout
set timeoutlen=500 " normal mapping timeout
set ttimeoutlen=30 " keycode timeout (ESC+key)

colorscheme seoul256
let g:kite_supported_languages=['python', 'javascript']
hi Visual cterm=NONE ctermfg=black ctermbg=214 gui=NONE guifg=#000000 guibg=#ffaf00
hi CursorLine cterm=NONE ctermbg=236 gui=NONE guibg=#2c2c2c

" Map the leader key to ','
let mapleader=","

" Setting splits
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

" Battery settings
function! Battery_icon()
  let l:backend=battery#backend()
  let l:nf=float2nr(round(backend.value / 20.0))
  return printf('%s', get(battery_icon, nf))
endfunction
let g:airline_section_x=airline#section#create(['%{battery#component()} %'])

" To allow collors in the status line
set t_Co=256

" To allow status bar to be seen before splitting
set laststatus=2

" To allow powerline symbols to be seen
let g:airline_powerline_fonts=1

" Reduces the space occupied by section z
let g:airline_section_z="%3p%% %l:%c"

" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#virtualenv#enabled=1
let g:airline#extensions#ctrlspace#enabled=1
let g:CtrlSpaceStatuslineFunction=
   \  "airline#extensions#ctrlspace#statusline()"

" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t'
set noshowmode
if !exists('g:airline_symbols')
let g:airline_symbols={}
endif

" Unicode symbols
"let g:airline_left_sep='»'
"let g:airline_left_sep='▶'
"let g:airline_right_sep='«'
"let g:airline_right_sep='◀'
let g:airline_symbols.linenr='☰'
let g:airline_symbols.paste='ρ'
let g:airline_symbols.paste='Þ'
let g:airline_symbols.notexists='∄'
let g:airline_symbols.whitespace='Ξ'

" Powerline symbols
"let g:airline_left_sep=''
"let g:airline_left_alt_sep=''
"let g:airline_right_sep=''
"let g:airline_right_alt_sep=''
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr='☰'
let g:airline_symbols.maxlinenr=''

" Remapping
inoremap jj <Esc>
inoremap <leader>n <C-n>
inoremap <leader>p <C-p>
tnoremap jj <Esc>
nnoremap U <C-r>
nnoremap ; :
vnoremap ; :
nnoremap <leader>c :!
vnoremap <leader>c :!

" Macros
nnoremap so :source ~/.vim/.vimrc<CR>
nnoremap sa :w<CR>
nnoremap wq :wq<CR>
nnoremap wb :w<CR> <bar> :bd<CR>
nnoremap bd :bd!<CR>
nnoremap vim :sp ~/.vim/.vimrc<CR>
nnoremap <silent> <leader>clear :nohlsearch<CR>
nnoremap <leader>v <C-q>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>1 :terminal<CR>
nnoremap <leader>! :vertical :terminal<CR>
nnoremap <leader>2 :terminal ipython<CR>
nnoremap <leader>@ :REPLToggle node<CR>
nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>o :e<space>
nnoremap <leader>vs :vs<space>
nnoremap <leader>sp :sp<space>
nnoremap <leader>git :Git<space>
nnoremap <leader>rve :vertical resize<space>
nnoremap <leader>rhe :horizontal resize<space>
nnoremap <leader>ree <C-W>=
nnoremap <leader>tal :let $LINT_FILE=!$LINT_FILE<CR>

" Edit .vimrc and .zshrc files quickly
nnoremap <leader>ve :e ~/.vim/.vimrc<CR>
nnoremap <leader>ze :e ~/.vim/.zshrc<CR>

" split navigations
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>J <C-W>J
nnoremap <leader>K <C-W>K
nnoremap <leader>L <C-W>L
nnoremap <leader>H <C-W>H

" Terminal navigation
tnoremap <leader>1 <C-W>: :terminal<CR>
tnoremap <leader>! <C-W>: :vertical :terminal<CR>
tnoremap <leader>` <C-W>:q<CR>
tnoremap <leader>; <C-W>:
tnoremap <leader>j <C-W><Down>
tnoremap <leader>k <C-W><Up>
tnoremap <leader>l <C-W><Right>
tnoremap <leader>h <C-W><Left>
tnoremap <leader>J <C-W>J
tnoremap <leader>K <C-W>K
tnoremap <leader>L <C-W>L
tnoremap <leader>H <C-W>H

" Enable folding with the spacebar
nnoremap <space> za

" Nerdtree macros
nnoremap <leader>n :NERDTreeToggle<CR>
" let NERDTreeIgnore=['\.pyc$','\~$'] " ignore files in NERDTree
let g:NERDTreeFileLines=1

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_confirm_extra_conf=0
let g:ycm_always_populate_location_list=1
let g:ycm_enable_diagnostic_signs=1
let g:ycm_open_loclist_on_ycm_diags=1
let g:ycm_max_num_candidates=20
let g:ycm_max_num_identifier_candidates=10
let g:ycm_auto_trigger=1
let g:ycm_show_diagnostic_ui=1
let g:ycm_error_symbol='>>'
let g:ycm_enable_diagnostic_signs=1
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_echo_current_diagnostic=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
set signcolumn=yes

" Setup some default ignores
let g:ctrlp_custom_ignore={
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode='r'
let g:CtrlSpaceSaveWorkspaceOnExit=1
let g:CtrlSpaceSaveWorkspaceOnSwitch=1
let g:CtrlSpaceLoadWorkspaceOnStart=1
let g:CtrlSpaceWorkspaceFile="~/.cache/ctrl_workspace"
let g:ctrlp_show_hidden=1

" CtrlPace settings
nnoremap <leader>qq :CtrlSpace Q<CR>
nnoremap <leader>co :CtrlSpace o<CR>
nnoremap <leader>cO :CtrlSpace O<CR>
nnoremap <leader>ch :CtrlSpace h<CR>
nnoremap <leader>cH :CtrlSpace H<CR>
nnoremap <leader>cl :CtrlSpace l<CR>
nnoremap <leader>cL :CtrlSpace L<CR>
nnoremap <leader>cb :CtrlSpace b<CR>
nnoremap <leader>cB :CtrlSpace B<CR>
nnoremap <leader>cw :CtrlSpace w<CR>
nnoremap <leader>cW :CtrlSpace W<CR>
nnoremap <leader>ctl :CtrlSpaceTabLabel<CR>
nnoremap <leader>Ctl :CtrlSpaceClearTabLabel<CR>
nnoremap <leader>cs :CtrlSpaceSaveWorkspace<CR>
nnoremap <leader>cS :CtrlSpaceSaveWorkspace<space>
nnoremap <leader>nw :CtrlSpaceNewWorkspace<CR>
nnoremap <silent> <leader>] :CtrlSpaceGoUp<CR>
nnoremap <silent> <leader>[ :CtrlSpaceGoDown<CR>
tnoremap <leader>ch <C-W>: :CtrlSpace h<CR>
tnoremap <leader>] <C-W>: :CtrlSpaceGoUp<CR>
tnoremap <leader>[ <C-W>: :CtrlSpaceGoDown<CR>
set showtabline=0

" ---ALE Core---
let g:ale_lint_on_text_changes='never'
let g:ale_ling_on_insert_leave=0
let g:ale_lint_on_save=1
let g:ale_python_black_options = '--line-length 80'

" ALE Settings
let g:ale_linters_explicit=1
let g:ale_linters = {
\ 'python': ['flake8', 'mypy'],
\ }

let g:ale_fixers = {
\ 'python': ['black', 'isort'],
\ }

let g:ale_fix_on_save = 0

nnoremap <silent> <leader>f :call <SID>RunALEFixOnce(['black', 'isort'])<CR>
nnoremap <silent> <leader>m :call <SID>RunALELintOnce(['mypy'])<CR>

function! s:RunALEFixOnce(fixers) abort
  let b:ale_fix_on_save = 0
  let g:ale_fix_on_save = 0
  let g:ale_fixers['python'] = a:fixers
  ALEFix
endfunction

function! s:RunALELintOnce(linters) abort
  let b:ale_linters = {'python': a:linters}
  ALELint
endfunction

" --- Keymaps ---
" Black (manual)
nnoremap <silent> <leader>b :call <SID>RunALEFixOnce(['black'])<CR>
" isort (manual)
nnoremap <silent> <leader>i :call <SID>RunALEFixOnce(['isort'])<CR>
" mypy (manual)
nnoremap <silent> <leader>m :call <SID>RunALELintOnce(['mypy'])<CR>

" --- Python configuration ---
" Enable vim-lsp logging
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log') 
 
" Make sure LSP starts automatically for Python
let g:virtualenv_directory='~/.envs/'
let g:virtaulenv_autodetect=1
let g:virtualenv_venv_name='.venv'
let g:lsp_auto_enable=1
let g:lsp_diagnostics_enabled=1

" Move through completion menu with Meta n/p and confirm completion instead of
" newline
" Next item
inoremap <silent><expr> <M-n>  pumvisible() ? "\<C-n>" : "n"
inoremap <silent><expr> <A-n>  pumvisible() ? "\<C-n>" : "n"
inoremap <silent><expr> <Esc>n pumvisible() ? "\<C-n>" : "n"

" Previous item
inoremap <silent><expr> <M-p>  pumvisible() ? "\<C-p>" : "p"
inoremap <silent><expr> <A-p>  pumvisible() ? "\<C-p>" : "p"
inoremap <silent><expr> <Esc>p pumvisible() ? "\<C-p>" : "p"

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e><Esc>" : "\<Esc>"

augroup python_format
  autocmd!
  autocmd BufEnter *.py highlight OverLength ctermbg=grey ctermfg=red
  autocmd BufEnter *.py highlight TODO ctermbg=yellow ctermfg=black
  autocmd BufEnter *.py highlight DONE ctermbg=blue ctermfg=green
  autocmd BufEnter *.py highlight LOG ctermbg=green ctermfg=black
  autocmd BufEnter *.py highlight REMOVE ctermbg=red ctermfg=black
  autocmd BufEnter *.py call matchadd("OverLength", '\%>80v.\+')
  autocmd BufEnter *.py call matchadd("TODO", '#\s\[\s\].*')
  autocmd BufEnter *.py call matchadd("DONE", '#\s\[x].*')
  autocmd BufEnter *.py call matchadd("TODO", '#\sTODO.*')
  autocmd BufEnter *.py call matchadd("LOG", '#\sLOG.*')
  autocmd BufEnter *.py call matchadd("REMOVE", '#\sREMOVE.*')
augroup END

" ============================================================
" Shared venv-aware Python helper for ALE + LSP
" ============================================================
function! s:DetectVenvPython() abort
  " If a virtualenv is active, prefer its python
  if exists('$VIRTUAL_ENV') && !empty($VIRTUAL_ENV)
    if has('win32') || has('win64')
      let l:py = $VIRTUAL_ENV . '\Scripts\python.exe'
    else
      let l:py = $VIRTUAL_ENV . '/bin/python'
    endif
    if filereadable(l:py)
      return l:py
    endif
  endif
  " Fallback to whatever python3 is on PATH
  return exepath('python3')
endfunction

" ============================================================
" ALE: use venv python for Python buffers
" ============================================================
let g:ale_virtualenv_dir_names = ['.venv', 'venv', 'env']

function! s:SetAlePythonForBuffer() abort
  if &filetype ==# 'python'
    let b:ale_python_executable = s:DetectVenvPython()
  endif
endfunction

augroup AlePythonVenv
  autocmd!
  autocmd FileType python call s:SetAlePythonForBuffer()
  autocmd User VirtualEnvActivated   call s:SetAlePythonForBuffer()
  autocmd User VirtualEnvDeactivated call s:SetAlePythonForBuffer()
  autocmd DirChanged * call s:SetAlePythonForBuffer()
augroup END

" ============================================================
" Unified LSP config: Python (Pyright), JS/TS, Java
" Requires: prabirshrestha/vim-lsp, mattn/vim-lsp-settings
" ============================================================

" Start from any existing config instead of overwriting
let g:lsp_settings = get(g:, 'lsp_settings', {})

" Java (eclipse-jdt-ls)
let g:lsp_settings['eclipse-jdt-ls'] = {
\ 'workspace_config': {},
\ 'initialization_options': {},
\}

" Python: Pyright with venv-aware pythonPath
function! s:RegisterPyright() abort
  if !executable('pyright-langserver')
    return
  endif
  call lsp#register_server({
        \ 'name': 'pyright',
        \ 'cmd': {server_info->['pyright-langserver', '--stdio']},
        \ 'whitelist': ['python'],
        \ 'settings': {
        \   'python': {
        \     'pythonPath': s:DetectVenvPython()
        \   }
        \ }
        \ })
endfunction

augroup LspPythonVenv
  autocmd!
  autocmd FileType python call s:RegisterPyright()
  autocmd User VirtualEnvActivated,VirtualEnvDeactivated call s:RegisterPyright()
augroup END

" Common LSP keymaps for all languages
function! s:LspCommonMaps() abort
  " Use vim-lsp for omnifunc completion
  setlocal omnifunc=lsp#complete
  " Jump to definition / references / implementation
  nnoremap <buffer> gd   :LspDefinition<CR>
  nnoremap <buffer> gr   :LspReferences<CR>
  nnoremap <silent> gR   :LspRename<CR>
  nnoremap <buffer> gi   :LspImplementation<CR>
  nnoremap <buffer> K    :LspHover<CR>

  " Document diagnostics
  nnoremap <buffer> <leader>ld :LspDocumentDiagnostics<CR>
endfunction

augroup LspCommonMappings
  autocmd!
  autocmd User lsp_buffer_enabled call s:LspCommonMaps()
augroup END

" Use Vim's :terminal as slime target
let g:slime_target='vimterminal'
let g:slime_dont_ask_default=1
let g:slime_bracketed_paste=1

" Make vim-ipython-cell send through slime (so \cc etc. go to the REPL)
let g:ipython_cell_enable_slime=1

" Cell delimiter style (matches Jupyter / VSCode)
let g:ipython_cell_delimit_cells_by = 'regex'
let g:ipython_cell_regex = '# %%.*'

" --- Cell navigation (like Jupyter) ---
nnoremap <leader>cn :IPythonCellNextCell<CR>
nnoremap <leader>cp :IPythonCellPrevCell<CR>

" ---  Execute cells ---
"  Current cell / all cells / cells above
nnoremap <leader>cc :IPythonCellRun<CR>
vnoremap <leader>cs :IPythonCellRun<CR>
nnoremap <leader>rn :IPythonCellExecuteCellJump<CR>
nnoremap <leader>ca :IPythonCellRunAll<CR>

" --- Low-level sends (line/selection) ---
nnoremap <leader>sl :SlimeSendCurrentLine<CR>
vnoremap <leader>ss :SlimeRegionSend<CR>
" Quick 'send paragraph' convenience
nnoremap <leader>sp vip:SlimeRegionSend<CR>

" Close the REPL terminal quickly
nnoremap <leader>rq :bd!<CR>

" Use LSP for omni-completion
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" asyncomplete: trigger on typing and with <C-Space>
inoremap <silent><expr> <C-Space> <C-x><C-o>
let g:asyncomplete_auto_popup=1
let g:asyncomplete_auto_completeopt=0

" --- UltiSnips behavior ---
" Add Ultisnips as a completion source for asyncomplete
let g:asyncomplete_ultisnips_enable=1" Merge project-local .snips with global UltiSnips dirs

function! s:ProjectSnipsMerged() abort
  " Find project root (using git as the root marker)
  let l:root = system('git rev-parse --show-toplevel 2> /dev/null')
  if v:shell_error != 0
    " outside of repo: just used globals
    let b:UltiSnipsSnippetDirectories=g:UltiSnipsSnippetDirectories
    return
  endif
  let l:root = substitute(l:root, '\r\?\n\+$', '', '') " trim

  let l:snipdir = l:root . '/.snips'
  if isdirectory(l:snipdir)
    " Start with global dirs, then append project dir
    let b:UltiSnipsSnippetDirectories=g:UltiSnipsSnippetDirectories + [l:snipdir]
  else
    " Fall back to just global dirs
    let b:UltiSnipsSnippetDirectories=g:UltiSnipsSnippetDirectories
  endif
endfunction

" Use <Tab> to expand and jump forward; <S-Tab> to jump backward.
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
let g:UltiSnipsSnippetDirectories = ['UltiSnips']

" Edit snippet files quickly
nnoremap <leader>ue :UltiSnipsEdit<CR>

augroup ProjectSnipsMerged
  autocmd!
  autocmd VimEnter * call <SID>ProjectSnipsMerged()
  autocmd BufEnter * call <SID>ProjectSnipsMerged()
augroup END

" --- Java LSP (eclipse-jdt-ls) ---
"Use google-java-format (wrapper or snap)
let g:ale_java_google_java_format_executable = 'google-java-format'
let g:ale_fixers = {'java': ['google_java_format'],}
autocmd FileType java nnoremap <buffer> <leader>jf :ALEFix<CR>

" Optional: enable Checkstyle if you install it
" let g:ale_linters = {'java': ['javac', 'checkstyle']}
" let g:ale_java_checkstyle_executable = 'checkstyle'
" let g:ale_java_checkstyle_options = '-c /path/to/google_checks.xml'
" C++ configuration
nnoremap <leader>ta :TagbarToggle<CR>
nnoremap <leader>f <Plug>CtrlSFCwordPath<CR>
nnoremap <leader>F <Plug>CtrlSFPrompt
xnoremap <leader>F <Plug>CtrlSFVwordPath
xnoremap <leader>f <Plug>CtrlSFVwordExec
nnoremap <C-Z> :vsplit <bar> :wincmd l <bar> :FSRight<CR>
let g:clang_format#auto_format=1
let g:tagbar_autofocus=1
let g:tabgar_autoshowtag=1
let g:tagbar_position='botright vertical'
let g:ctrlsf_backend='ack'
let g:ctrlsf_auto_close={ "normal":0, "compact":0 }
let g:ctrlsf_auto_focus={ "at":"start" }
let g:ctrlsf_auto_preview=0
let g:ctrlsf_case_sensitive='smart'
let g:ctrlsf_default_view='normal'
let g:ctrlsf_regex_pattern=0
let g:ctrlsf_position='right'
let g:ctrlsf_winsize='46'
let g:ctrlsf_default_root='cwd'
au! BufEnter *.cpp let b:fswitchdst='hpp,h'
au! BufEnter *.h let b:fswitchdst='cpp,c'
augroup cpp_format
  autocmd!
  autocmd BufEnter *.c,*.cpp,*.h,*.hpp highlight TODO ctermbg=grey ctermfg=red
  autocmd BufEnter *.c,*.cpp,*.h,*.hpp match TODO /\[\s\].*/
  autocmd BufEnter *.c,*.cpp,*.h,*.hpp highlight OverLength ctermbg=grey ctermfg=red
  autocmd BufEnter *.c,*.cpp,*.h,*.hpp 2match OverLength /\%>80v.\+/
augroup END

" Markdown configuration
set conceallevel=2
let g:vim_markdown_folding_disabled=0
let g:vim_markdown_folding_style_pythonic=0
let g:vim_markdown_folding_level=6
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_toc_autofit=1
let g:vim_markdown_auto_insert_bullets=1
let g:vim_markdown_fenced_languages=['py=python', 'js=javascript', 'bash=sh']
let g:vim_markdown_conceal_code_blocks=0
let g:vim_markdown_follow_anchor=1
let g:vim_markdown_math=1
let g:vim_markdown_toml_frontmatter=1
let g:vim_markdown_json_frontmatter=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_strikthrough=1
let g:vim_markdown_new_list_item_indent=4
let g:vim_markdown_no_extensions_in_markdown=1
let g:vim_markdown_autowrite=1
augroup markdown_format
  autocmd!
  autocmd BufEnter *.md highlight OverLength ctermbg=grey ctermfg=red
  autocmd BufEnter *.md highlight TODO ctermbg=yellow ctermfg=black
  autocmd BufEnter *.md highlight DONE ctermbg=blue ctermfg=green
  autocmd BufEnter *.md call matchadd("OverLength", '\%>80v.\+')
  autocmd BufEnter *.md call matchadd("TODO", '-\s\[\s\].*')
  autocmd BufEnter *.md call matchadd("DONE", '-\s\[x].*')
  autocmd BufEnter *.md call matchadd("TODO", '\d.\s\[\s\].*')
  autocmd BufEnter *.md call matchadd("DONE", '\d.\s\[x].*')
  autocmd BufEnter *.md call matchadd("TODO", '-\sTODO.*')
augroup END
