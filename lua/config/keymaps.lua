-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap

keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")
keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")
-- Delete lazygit integration with lazyvim

keymap.set("n", "<leader>gg", "<cmd>Neogit cwd=%:p:h<CR>")
keymap.set("n", "<leader>gG", "<cmd>Neogit<CR>")

keymap.set("n", "<A-p>", '"0p')
keymap.set("n", "<A-P>", '"0P')
