-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny



lvim.format_on_save = true
lvim.on_lost_focus = "auto_save"
lvim.plugins = {
  { "tpope/vim-fugitive" },
  { "sainnhe/gruvbox-material" },
  { "kdheepak/monochrome.nvim" },
  { "rose-pine/neovim",        name = "rose-pine" }
}

vim.opt.relativenumber = true

vim.g.gruvbox_material_background = "hard"
lvim.colorscheme = "gruvbox-material"

lvim.builtin.telescope.defaults = {
  file_ignore_patterns = { ".git", "^%.%./%.git/", "^%.%/node_modules/" },
}
lvim.builtin.nvimtree.setup.view.side = "right"

lvim.keys.normal_mode["z"] = "zz"
lvim.keys.normal_mode["G"] = "Gzz"

lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<C-f>"] = "<C-f>zz"
lvim.keys.normal_mode["<C-b>"] = "<C-b>zz"


lvim.keys.normal_mode["d"] = '"_d'
lvim.keys.visual_mode["d"] = '"_d'
lvim.keys.normal_mode["D"] = '"_D'
lvim.keys.visual_mode["<leader>d"] = '""d'
lvim.keys.normal_mode["<leader>D"] = '""D'
lvim.keys.visual_mode["p"] = '"_dP'
lvim.keys.visual_mode["<leader>p"] = '""p'

lvim.keys.normal_mode["<F9>"] = ":set ignorecase! ignorecase?"

lvim.builtin.which_key.mappings["d"] = { '""d', 'Delete inside ""' }

lvim.keys.normal_mode["<leader><C-h>"] = "<cmd>diffget //2<CR>"
lvim.keys.normal_mode["<leader><C-l>"] = "<cmd>diffget //3<CR>"

local util = require 'lspconfig.util'

require('lspconfig').tsserver.setup({
  root_dir = util.root_pattern('.git'),
  init_options = {
    preferences = {
      importModuleSpecifierPreference = 'non-relative',
      importModuleSpecifierEnding = 'minimal',
    },
  }
})

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact", "scss" },
  },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    exe = "eslint",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
  },
}
