return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "cmd:op read op://Private/xhppxhnadcnov2o2qa7bijhm5m/credential --no-newline",
            },
          })
        end,
      },
      opts = {
        log_level = "DEBUG",
      },
      strategies = {
        chat = {
          adapter = "anthropic",
          model = "claude-sonnet-4-20250514",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
