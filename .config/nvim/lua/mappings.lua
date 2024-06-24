require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- go mappings

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", {desc = "Toggle breakpoint"})
map("n", "<leader>dus", function ()
  local widgets = require("dap.ui.widgets")
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, {desc = "Open debug sidebar"})

map("n", "<leader>dgt", function ()
  require("dap-go").debug_test()
end, {desc = "Debug go test"})

map("n", "<leader>dgl", function ()
  require("dap-go").debug_last()
end, {desc = "Debug last run go test"})

-- copilot mappings
vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
