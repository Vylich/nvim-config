-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

vim.cmd "highlight St_relativepath guifg=#b2b2b2 guibg=#303847"

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

M.ui = {
  theme = "bearded-arc",
  theme_toggle = { "bearded-arc", "one-light" },

  transparency = false,

  statusline = {
    order = { "mode", "r", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    theme = "default",

    modules = {
      r = function()
        local path = vim.api.nvim_buf_get_name(stbufnr())

        if path == "" then
          return ""
        end

        return "%#St_relativepath#  " .. vim.fn.expand "%:.:h" .. " /"
      end,
    },
  },

  nvdash = {
    load_on_startup = true,
    header = {
      "██╗   ██╗██╗   ██╗██╗     ██╗ ██████╗██╗  ██╗",
      "██║   ██║╚██╗ ██╔╝██║     ██║██╔════╝██║  ██║",
      "██║   ██║ ╚████╔╝ ██║     ██║██║     ███████║",
      "╚██╗ ██╔╝  ╚██╔╝  ██║     ██║██║     ██╔══██║",
      " ╚████╔╝    ██║   ███████╗██║╚██████╗██║  ██║",
      "  ╚═══╝     ╚═╝   ╚══════╝╚═╝ ╚═════╝╚═╝  ╚═╝",
      "                                             ",
      "    ███╗   ██╗██╗   ██╗██╗███╗   ███╗        ",
      "    ████╗  ██║██║   ██║██║████╗ ████║        ",
      "    ██╔██╗ ██║██║   ██║██║██╔████╔██║        ",
      "    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║        ",
      "    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║        ",
      "    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝        ",
    },
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    DiffChange = {
      bg = "#464414",
      fg = "none",
    },
    DiffAdd = {
      bg = "#103507",
      fg = "none",
    },
    DiffRemoved = {
      bg = "#461414",
      fg = "none",
    },
  },
}

return M
