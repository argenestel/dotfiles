return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('codeium').setup({
      tools = {
        inlay_hints = {
          show = true,
        },
      },
      -- Better suggestion visibility
      suggestions = {
        enabled = true,
        auto_trigger = true,
        debounce = 0,  -- No delay
        highlight = true,
        virtual_text = true,
        priority = 65535,
      },
      -- Make suggestions more visible
      highlight = {
        groups = {
          CodeiumSuggestion = { fg = "#7aa2f7", bold = true },  -- Same blue as others
          CodeiumAnnotation = { fg = "#bb9af7", bold = true },  -- Same purple as others
        },
      },
      -- Fast workspace detection
      workspace_root = {
        use_lsp = true,
        paths = {
          ".git",
          "package.json",
          "requirements.txt",
          "Cargo.toml",
          "go.mod",
        },
      },
      -- Simple keybindings
      keybindings = {
        accept = "<C-y>",
        accept_word = "<C-y>w",
        accept_line = "<C-y>l",
        next = "<C-j>",
        prev = "<C-k>",
        dismiss = "<C-q>",
      }
    })

    -- Chat command
    vim.keymap.set('n', '<leader>ai', ':Codeium Chat<CR>', { silent = true, desc = "AI Chat" })
  end
}