set expandtab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set encoding=utf8

set list
set listchars=tab:>-,trail:·,extends:>,precedes:< "defoult set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<"


set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'

"Plugin 'nvim-lua/completion-nvim'

" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'mattn/vim-lsp-settings'
" Plugin 'neovim/nvim-lspconfig'

Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/nvim-compe'

Plugin 'junegunn/gv.vim'
Plugin 'tpope/vim-fugitive'

Plugin 'vim-airline/vim-airline'

Plugin 'christianchiarulli/nvcode-color-schemes.vim'
Plugin 'nvim-treesitter/nvim-treesitter'
" Plugin 'altercation/vim-colors-solarized'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim', {
        \ 'on': [
            \ 'Ag',
            \ 'Rg',
            \ 'FZF',
            \ 'Files',
            \ 'Buffers',
            \ 'Commits',
            \ 'BCommits',
            \ 'Tags',
            \ 'BTags',
            \ 'History',
            \ 'Lines',
            \ 'BLines',
            \ 'Marks'
        \ ] }


call vundle#end()
filetype plugin indent on

"
luafile ~/.config/nvim/lua/lsp/prismals.lua
luafile ~/.config/nvim/lua/lsp/js.lua

" PLUGIN CONFIGS
"
"--------------nerdtree---------------------------
nmap <C-n> :NERDTreeToggle <CR>
nmap <C-m> :NERDTreeFind <CR>
" let g:airline_powerline_fonts = 1
let NERDTreeShowHidden=1
"-------------------------------------------------

"------------------------------------------------------------fzf
nmap <C-p> :Files <CR>
nmap <C-f> :Ag <CR>
"


"------------------------------------------------------------nvim-compe
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true
"

"-----------------------------------------------------------------------------LSP
" LSP config (the mappings used in the default file don't quite work right)

let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" lua << EOF
" require'lspconfig'.tsserver.setup{}
" EOF

nnoremap <silent> gf <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-d> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-D> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" auto-format
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
"

"---------------------------------------------------------- configure treesitter

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF
"

"---------------------------------------------------------- configure nvcode-color-schemes
let g:nvcode_termcolors=256

syntax on
colorscheme nvcode " Or whatever colorscheme you make


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
"


