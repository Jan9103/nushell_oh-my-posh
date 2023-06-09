# based on: https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/src/shell/scripts/omp.nu

export-env {
    load-env {
        POWERLINE_COMMAND = 'oh-my-posh'
        POSH_THEME: ($env.NU_PACKER_CFG | get -i oh-my-posh.theme | default '')
        PROMPT_INDICATOR: ''
        POSH_PID: (random uuid)
        # By default displays the right prompt on the first line
        # making it annoying when you have a multiline prompt
        # making the behavior different compared to other shells
        PROMPT_COMMAND_RIGHT: {|| ''}
        NU_VERSION: (version | get version)

        # PROMPTS
        PROMPT_MULTILINE_INDICATOR: (^oh-my-posh print secondary $"--config=($env.POSH_THEME)" --shell=nu $"--shell-version=($env.NU_VERSION)")

        PROMPT_COMMAND: {||
            # We have to do this because the initial value of `$env.CMD_DURATION_MS` is always `0823`,
            # which is an official setting.
            # See https://github.com/nushell/nushell/discussions/6402#discussioncomment-3466687.
            let cmd_duration = if $env.CMD_DURATION_MS == "0823" { 0 } else { $env.CMD_DURATION_MS }

            # hack to set the cursor line to 1 when the user clears the screen
            # this obviously isn't bulletproof, but it's a start
            let clear = (history | last 1 | get 0.command) == "clear"

            let width = ((term size).columns | into string)
            ^oh-my-posh print primary $"--config=($env.POSH_THEME)" --shell=nu $"--shell-version=($env.NU_VERSION)" $"--execution-time=($cmd_duration)" $"--error=($env.LAST_EXIT_CODE)" $"--terminal-width=($width)" $"--cleared=($clear)"
        }
    }
}
