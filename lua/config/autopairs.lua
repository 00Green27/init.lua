local M = {}

function M.setup()
  local npairs = require "nvim-autopairs"
  npairs.setup {
    check_ts = true, -- treesitter integration
    disable_filetype = { "TelescopePrompt" },
  }

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  local cmp_status, cmp = pcall(require, "cmp")
  if not cmp_status then
    return
  end
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
end

return M