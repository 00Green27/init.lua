local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },

    b = {
        name = "Buffer",
        c = { "<Cmd>bd!<Cr>", "Close current buffer" },
        D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
      },

      f = {
          name = "Telescope",
          f = { "<Cmd>Telescope find_files<CR>", "Find files" },
          t = { "<Cmd>Telescope live_grep<CR>", "Live grep" },
          p = { "<Cmd>Telescope projects<CR>", "Projects" },
          b = { "<Cmd>Telescope buffers<CR>", "Buffers" },
      },

      g = {
        name = "Git",
        s = { "<cmd>Neogit<CR>", "Status" },
      },

      p = {
          name = "Project",
          v = { "<cmd>Ex<CR>", "View" }
      },

      z = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
      }
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M