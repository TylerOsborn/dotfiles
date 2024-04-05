require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("i", "pp", "<CMD> p <CR>")

-- TODO: figure out how to only ave these mappings in go files
-- Go Dap Mappings
map("n", "<leader>db", "<CMD> DapToggleBreakpoint <CR>", {desc = "Add break point at line"})
map("n", "<leader>dus", function ()
      local widgets = require("dap.ui.widgets");
      local sidebar = widgets.sidebar(widgets.scopes);
      sidebar.open();
end, {desc = "Open debugging sidebar"})

map("n", "<leader>gdt", function ()
        require("dap-go").debug_test()
end, {desc = "Debug go test"})

map("n", "<leader>gdl", function ()
        require("dap-go").debug_last()
end, {desc = "Debug last go test"})


-- Gopher Mappings

map("n", "<leader>gsj", "<CMD> GoTagAdd json <CR>", {desc = "Add JSON to struct"})
map("n", "<leader>gsy", "<CMD> GoTagAdd yaml <CR>", {desc = "Add YAML to struct"})
