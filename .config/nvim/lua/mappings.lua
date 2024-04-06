require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

local fmapw = function(pattern, mode, shortcut, mapping, opts)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = pattern,
    callback = function ()
       vim.schedule(map(mode, shortcut, mapping, opts))
    end,
  })
end

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- General DAP Mappings
map("n", "<leader>db", "<CMD> DapToggleBreakpoint <CR>", { desc = "Add break point at line" })

-- Go Dap Mappings
fmapw({"go"}, "n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })

fmapw({"go"}, "n", "<leader>gdt", function()
  require("dap-go").debug_test()
end, { desc = "Debug go test" })

fmapw({"go"}, "n", "<leader>gdl", function()
  require("dap-go").debug_last()
end, { desc = "Debug last go test" })

-- Gopher Mappings

fmapw({"go"}, "n", "<leader>gsj", "<CMD> GoTagAdd json <CR>", { desc = "Add JSON to struct" })
fmapw({"go"}, "n", "<leader>gsy", "<CMD> GoTagAdd yaml <CR>", { desc = "Add YAML to struct" })

-- Python Mappings
fmapw({"python"}, "n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "Debug python file" })
