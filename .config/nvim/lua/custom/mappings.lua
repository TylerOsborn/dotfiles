
-- This is the remnants of a dreams of code tutorial
-- that will be removed or updated once I figure out
-- how to get this working with nvchad v2.5

local M

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakPoint <CR>",
      "Add break point at line",
    },
    ["<leader>dus"] = {
      function ()
       local widgets = require("dap.ui.widgets");
       local sidebar = widgets.sidebar(widgets.scopes);
       sidebar.open();
      end,
      "Open debugging sidebar",
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>gdt"] = {
      function ()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>gdl"] = {
      function ()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  }
}

return M
