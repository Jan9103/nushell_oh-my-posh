# Oh-My-Posh prompt

This packages the [oh-my-posh][OMP] init into a packer.nu package.

## Config

```nu
{packages: [

{source: 'jan9103/nushell_oh-my-posh' as: 'oh-my-posh'
  config: {
    theme: 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json'
  }
}

]}
```

config-theme can contain anything usable as `--config` argument for the init command.  
More info: <https://ohmyposh.dev/docs/installation/customize>  
you can set the theme to `""` or just not define it to use the default.


## Credits

The code is based on: [the official init](https://github.com/JanDeDobbeleer/oh-my-posh/blob/7e04bdc9f7a2c5541191a26e3e2f09a6dc278626/src/shell/scripts/omp.nu) (MIT license)

Modifications:
- No absolute paths
- Use packer config for the theme


[OMP]: https://ohmyposh.dev/
