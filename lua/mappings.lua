require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Telescope file browser
map("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", { desc = "File browser" })

-- Claude Code
map("n", "<leader>cc", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude Code" })
map("n", "<leader>cr", "<cmd>ClaudeCodeContinue<cr>", { desc = "Continue Claude Code" })
map("n", "<leader>cv", "<cmd>ClaudeCodeVerbose<cr>", { desc = "Claude Code Verbose" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
