return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    
    cmp.setup({
      -- Sources in priority order
      sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip', priority = 750 },
        { name = 'codeium', priority = 1500 }, -- Highest priority AI
        { name = 'supermaven', priority = 1400 }, -- Second AI
        { name = 'avante', priority = 1300 }, -- Third AI
        { name = 'buffer', priority = 500 },
        { name = 'path', priority = 250 },
      }),

      -- Better icons and formatting
      formatting = {
        format = function(entry, vim_item)
          -- Add icons
          if entry.source.name == "codeium" then
            vim_item.kind = "󰚩 Codeium"
            vim_item.menu = "[AI]"
          elseif entry.source.name == "supermaven" then
            vim_item.kind = "󰚩 Maven"
            vim_item.menu = "[AI]"
          elseif entry.source.name == "avante" then
            vim_item.kind = "󰚩 Avante"
            vim_item.menu = "[AI]"
          end
          return vim_item
        end
      },

      -- Window appearance
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },
      },

      -- Faster completion behavior
      completion = {
        keyword_length = 1,
        completeopt = 'menu,menuone,noselect',  -- Changed to noselect to allow cycling
      },

      -- Better performance
      performance = {
        debounce = 0,
        throttle = 0,
        fetching_timeout = 0,
      },

      -- Snippet engine required for LSP
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      -- Better mapping that doesn't conflict with Zellij
      mapping = {
        -- Use Tab/S-Tab to navigate
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),

        -- Use Enter to confirm
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        
        -- Alternative navigation with Ctrl-j/k if needed
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        
        -- Documentation scrolling
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        
        -- Close completion window
        ['<C-e>'] = cmp.mapping.close(),
        
        -- Open completion menu
        ['<C-Space>'] = cmp.mapping.complete(),
      },

      -- Better sorting
      sorting = {
        priority_weight = 2.0,
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })
  end,
} 