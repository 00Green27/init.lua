-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness
---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>si", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>so", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>sp", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sk", ":close<CR>") -- close current split window

keymap.set("n", "<leader>ti", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>t", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
keymap.set("n", "<leader>tk", ":tabclose<CR>") -- close current tab

-- Replace the arrow keys to adjust the split screen size
keymap.set("n", "<up>", ":res -5<CR>")
keymap.set("n", "<down>", ":res +5<CR>")
keymap.set("n", "<left>", ":vertical resize+5<CR>")
keymap.set("n", "<right>", ":vertical resize-5<CR>")

----------------------
-- Plugin Keybinds
----------------------

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- Hop
keymap.set("n", "mk", ":HopLine<CR>")
keymap.set("n", "ml", ":HopWord<CR>")

-- diffview
keymap.set("n", "<leader>fd", ":DiffviewFileHistory<CR>")

keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>")
keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>")
keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")