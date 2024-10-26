
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
vim.opt.relativenumber = true

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

local function generate_commit_message(changed_files)
  local commit_message = vim.fn.codeium.GetCompletion(changed_files, "commit message")
  return commit_message
end

local function generate_commit()
  local changed_files = vim.api.nvim_command_output "git diff --name-only"
  local commit_message = generate_commit_message(changed_files)
  vim.api.nvim_command("commit " .. commit_message)
end

vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "GitGutterAdd" })
vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GitGutterChange" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "GitGutterDelete" })

vim.api.nvim_create_user_command("GenerateCommit", generate_commit_message, {})
vim.api.nvim_set_keymap("n", "<leader>lc", ":GenerateCommit<CR>", { noremap = true, silent = true })
