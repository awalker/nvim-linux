vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Continue" })
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<Leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>B", function()
  require("dap").set_breakpoint()
end, { desc = "Set Breakpoint" })
vim.keymap.set("n", "<Leader>dlp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Log Point" })
vim.keymap.set("n", "<Leader>dr", function()
  require("dap").repl.open()
end, { desc = "Repl" })
vim.keymap.set("n", "<Leader>dlr", function()
  require("dap").run_last()
end, { desc = "Run Last" })
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "Debug hover" })
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end, { desc = "preview" })
vim.keymap.set("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end, { desc = "frames" })
vim.keymap.set("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end, { desc = "scopes" })

return {
  {
    "mfussenegger/nvim-dap",
    init = function()
      local dap = require("dap")
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "/usr/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.rust = {
        {
          name = "Rust debug",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
        },
      }
    end,
  },
  { "rcarriga/nvim-dap-ui" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "nvim-telescope/telescope-dap.nvim" },
}
