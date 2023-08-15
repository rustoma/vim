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

lvim.keys.normal_mode["<F9>"] = ":set ignorecase! ignorecase?"

lvim.builtin.which_key.mappings["d"] = { '""d', 'Delete inside ""' }
