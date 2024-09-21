return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		"github/copilot.vim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	build = "make tiktoken",
	opts = {},
	keys = {
		{
			"<leader>ccq",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
				end
			end,
			desc = "CopilotChat - Quick chat",
		},
		-- Show help actions with telescope
		{
			"<leader>cch",
			function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.help_actions())
			end,
			desc = "CopilotChat - Help actions",
		},
		-- Show prompts actions with telescope
		{
			"<leader>ccp",
			function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
			end,
			desc = "CopilotChat - Prompt actions",
		},
		{
			"<leader>cco",
			vim.cmd.CopilotChatOpen,
			desc = "Open chat window",
		},
		{
			"<leader>cct",
			vim.cmd.CopilotChatToggle,
			desc = "Toggle chat window",
		},
	},
}
