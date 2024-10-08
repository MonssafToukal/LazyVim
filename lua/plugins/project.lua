return {
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/projects/*",
      "~/orgfiles",
      -- "~/.config/*",
    },
    picker = {
      type = "telescope", -- or "fzf-lua"
    },
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    -- optional picker
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    -- optional picker
    { "ibhagwan/fzf-lua" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
  vim.keymap.set("n", "<leader>pd", "<CMD>NeovimProjectDiscover<CR>", { desc = "Discover projects based on patterns" }),
  vim.keymap.set(
    "n",
    "<leader>ph",
    "<CMD>NeovimProjectHistory<CR>",
    { desc = "Select a project from your recent history" }
  ),
  vim.keymap.set("n", "<leader>pr", "<CMD>NeovimProjectLoadRecent<CR>", { desc = "Open the previous session" }),
  vim.keymap.set(
    "n",
    "<leader>pH",
    "<CMD>NeovimProjectLoadHist<CR>",
    { desc = "Open the project form the history providing a project dir" }
  ),
  vim.keymap.set(
    "n",
    "<leader>pl",
    "<CMD>NeovimProjectLoad<CR>",
    { desc = "Opens the project from all your projects providing a project dir" }
  ),
}
