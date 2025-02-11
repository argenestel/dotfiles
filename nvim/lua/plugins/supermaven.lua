return {
  "supermaven-inc/supermaven-nvim",
  dependencies = {
    'hrsh7th/nvim-cmp',
    'nvim-lspconfig',
  },
  config = function()
    require("supermaven-nvim").setup({
      -- Disable default tab completion
      disable_keymaps = true,
      
      -- Simple, intuitive keybindings
      keymaps = {
        accept_suggestion = "<Tab>",  -- Alt-Tab to accept
        clear_suggestion = "<C-c>s",     -- Alt-e to dismiss
        next_suggestion = "<C-j>s",      -- Alt-] for next
        prev_suggestion = "<C-k>s",      -- Alt-[ for prev
      },
      
      -- Ignore certain filetypes where AI completion might not be helpful
      ignore_filetypes = {
        "TelescopePrompt",
        "neo-tree",
        "NvimTree",
        "lazy",
        "mason",
        "help",
        "markdown",
      },
      
      -- Better visibility
      color = {
        suggestion_color = "#7aa2f7",
        selected_color = "#bb9af7",
        cterm = 111,
      },
      
      -- Faster suggestions
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 0,     -- No delay
        highlight = true,
        virtual_text = true,
        priority = 65535,
      },
      
      -- Enable logging for debugging
      log_level = "warn",  -- Less verbose logging
      
      -- Enable inline completion for manual control
      disable_inline_completion = false,
    })
    
    -- Configure cmp with better icons and priority
    local cmp = require('cmp')
    cmp.setup({
      sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip', priority = 750 },
        { name = 'codeium', priority = 1500 }, -- Codeium highest
        { name = 'supermaven', priority = 1400 }, -- Supermaven just below Codeium
        { name = 'buffer', priority = 500 },
      }),
      -- Add Supermaven icon
      formatting = {
        format = function(entry, vim_item)
          if entry.source.name == "supermaven" then
            vim_item.kind = "󰚩 Maven"
          end
          return vim_item
        end
      },
      -- Faster completion
      completion = {
        keyword_length = 1,
        completeopt = 'menu,menuone,noinsert',
      },
      performance = {
        debounce = 0,
        throttle = 0,
        fetching_timeout = 0,
      },
    })
  end,
}
