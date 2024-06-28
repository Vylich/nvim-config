require "nvchad.options"

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- add yours here!

local o = vim.o
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
o.foldcolumn = "2"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- o.cursorlineopt ='both' -- to enable cursorline!
