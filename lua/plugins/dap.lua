return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mxsdev/nvim-dap-vscode-js",
		{
			"microsoft/vscode-js-debug",
			opt = {},
			build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
		},
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		require("dap-vscode-js").setup({
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
		})

		for _, language in ipairs({ "typescript", "javascript" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end

		require("dap-python").setup("python")

		dap.listeners.before.attach.dapui_config = dapui.open
		dap.listeners.before.launch.dapui_config = dapui.open

		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debugger: Continue" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debugger: Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debugger: Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debugger: Step Out" })
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debugger: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>gx", dapui.close, { desc = "Close DAP UI" })
	end,
}
