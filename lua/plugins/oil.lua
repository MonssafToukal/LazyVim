return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup({
      columns = { "icons" },
      keymaps = {
        ["<C-h"] = false,
        ["<M-h>"] = "actions.select_split",
      },
      view_options = {
        show_hidden = true,
      },
    })
    -- Open parent directory of the currently selected window:
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    -- Open parent directory of the currently selected window, but in a floating window:
    vim.keymap.set("n", "<space>-", require("oil").toggle_float)
  end,
}
