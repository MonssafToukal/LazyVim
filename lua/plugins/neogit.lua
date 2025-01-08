return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "ibhagwan/fzf-lua", -- optional
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup({
      integrations = {
        diffview = true,
      },
    })
  end,
}
