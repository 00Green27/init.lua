local M = {}

function M.setup()
  require("bufferline").setup {
    options = {
        numbers = "none",
        diagnostics = "nvim_lsp",
        show_tab_indicators = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
      highlights = {
        buffer_selected = {
          italic = false
        },
        indicator_selected = {
          fg = {attribute = 'fg', highlight = 'Function'},
          italic = false
        }
      }
  }
end

return M