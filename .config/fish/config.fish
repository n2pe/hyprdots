source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# aliases for fastfetch
if status is-interactive
    # Fastfetch shortcuts
    abbr -a ff  'fastfetch'
    abbr -a misakafetch  'fastfetch -c /home/nipe/.config/fastfetch/configs/misaka/config.jsonc'
    abbr -a pokefetch  'fastfetch -c /home/nipe/.config/fastfetch/configs/new/config.jsonc'
end

fish_add_path /home/nipe/.spicetify
fish_add_path
oh-my-posh init fish --config /home/nipe/.cache/oh-my-posh/themes/simple.omp.json | source
# Created by `pipx` on 2025-07-31 21:54:32
set PATH $PATH /home/nipe/.local/bin
