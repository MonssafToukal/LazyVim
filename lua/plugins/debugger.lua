return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- virtual text for the debugger
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          automatic_installation = true,
          ensure_installed = {
            "delve",
          },
        },
      },
    },
    keys = {
      { "<leader>d", "", desc = "+debug", mode = { "n", "v" } },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>da",
        function()
          require("dap").continue({ before = get_args })
        end,
        desc = "Run with Args",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dg",
        function()
          require("dap").goto_()
        end,
        desc = "Go to Line (No Execute)",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>dj",
        function()
          require("dap").down()
        end,
        desc = "Down",
      },
      {
        "<leader>dk",
        function()
          require("dap").up()
        end,
        desc = "Up",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>do",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
      require("mason-nvim-dap").setup()
      dap.configurations = {
        go = {
          {
            type = "go",
            name = "Debug",
            request = "launch",
            program = "${file}",
            args = { "migrate", "-p", "dev-EU-dev-mtoukal", "-o", "PCI-DEV" },
          },
          {
            type = "go",
            name = "tfe2otf migrate -p 'integ-EU-GRA1-preprod' -o PCI-EU",
            request = "launch",
            program = "${workspaceFolder}/main.go",
            args = { "migrate", "-p", "integ-EU-GRA1-preprod", "-o", "PCI-EU" },
          },
          {
            type = "go",
            name = "tfe2otf migrate --all -o PCI-US",
            request = "launch",
            program = "${workspaceFolder}/main.go",
            args = { "migrate", "-a", "-o", "PCI-US" },
          },
          {
            type = "go",
            name = "tfe2otf workspaces lock dev-EU-dev-mtoukal-legacy-pki",
            request = "launch",
            program = "${workspaceFolder}/main.go",
            args = { "workspaces", "lock", "dev-EU-dev-mtoukal-legacy-pki", "-o", "PCI-DEV" },
          },
          {
            type = "go",
            name = "tfe2otf workspaces delete -p 'Default Project'",
            request = "launch",
            program = "${workspaceFolder}/main.go",
            args = { "workspaces", "delete", "-p", "prj-mec2HCPBix4PB97t", "-o", "PCI-DEV" },
          },
        },
      }
      dap.adapters.go = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }
    end,
  },
}
