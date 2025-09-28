require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "claude_code",
    },
    inline = {},
    cmd = {},
  },
  adapters = {
    acp = {
      claude_code = function()
        return require("codecompanion.adapters").extend("claude_code", {
          env = {
            CLAUDE_CODE_OAUTH_TOKEN = "cmd:op read op://Private/fwjstq7qpfc6mv5vdxc46aui4e/api-key --no-newline",
          },
        })
      end,
    },
  },
})
