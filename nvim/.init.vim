" ### Sets
syntax on
set mouse=a
set nowrap
set scrolloff=5
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set formatoptions+=j
set hidden

" ### common keybindings
let mapleader = " "

" ### Installation Pluginmanager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ### Plugins
call plug#begin()
  " colorscheme
  Plug 'morhetz/gruvbox'
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Language Server Protocol
  " Syntax highlighting
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  " CoC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Others
  Plug 'rstacruz/vim-closer'
call plug#end()

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" ### colorscheme
colorscheme gruvbox

" ### FZF keybindings
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fg :GFiles<cr>

" ### COC
let g:coc_global_extensions = [
      \'coc-snippets',
      \'coc-prettier',
      \'coc-jedi',
      \'coc-html',
      \'coc-highlight',
      \'coc-eslint',
      \'coc-tsserver', 
      \'coc-json', 
      \'coc-css', 
      \'coc-git'
      \]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" coc-highlight - Gleiche Wörter im Code markieren
autocmd CursorHold * silent call CocActionAsync('highlight')

" Zeigt Fehler mit Markierung der Zeile an und Fehlercode, wenn man auf der Zeile steht
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Mit :Format wird der Code automatisch formatiert
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Durch Tabs steuern
nnoremap <silent> <leader><Left> :tabprevious<CR>
nnoremap <silent> <leader>h :tabprevious<CR>
nnoremap <silent> <leader><Right> :tabnext<CR>
nnoremap <silent> <leader>l :tabnext<CR>
nnoremap <silent> <leader><Up> :tabnew<CR>
nnoremap <silent> <leader><Down> :tabclose<CR>

" Durch Buffer steuern
nnoremap <silent> <leader>k :bp!<CR>
nnoremap <silent> <leader>j :bn!<CR>

" Sonstige
nnoremap <silent> <leader>s :nohlsearch<CR>
nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>

command! W w
command! Q q
