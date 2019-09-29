#!/usr/bin/env bash

function setup() {
	# Neovim configuration directory
	nvim_config_dir="$HOME/.config/nvim"
	# Neovim local user files directory
	nvim_user_dir="$HOME/.local/share/nvim"
	# Neovim autoload directory path
	nvim_autoload_dir="$nvim_user_dir/site/autoload"

	# Install custom fonts
	# font download url
	font_url="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf"
	# font file name
	font_file="Sauce Code Pro Nerd Font Complete Mono.ttf"
	# local fonts directory
	font_dir="$HOME/.local/share/fonts"
	if [ ! -f "$font_dir/$font_file" ]; then
		# create local fonts directory if it doesn't exist
		mkdir -p $font_dir
		# begin installing font
		echo 'installing fonts'
		# download font
		curl -# -fLo "$font_dir/$font_file" $font_url
    # install font/rebuild font cache
    fc-cache -f
		echo "Fonts installed to $font_dir"
	fi

	# Install PowerLine Status for VIM
	if [ ! -d "$HOME/.local/lib/python3.6/site-packages/powerline" ]; then
		echo 'installing PowerLine Status'
		pip install --user powerline-status
	fi


	# Install Neovim config
	if [ ! -f "$nvim_config_dir/init.vim" ] || [ "init.vim" -nt "$nvim_config_dir/init.vim" ]; then
		# create neovim config directory if it doesn't exist
		mkdir -p $nvim_config_dir
		# Install neovim config file
		echo 'installing neovim config'
		cp "init.vim" $nvim_config_dir
		echo 'neovim config installed'
	fi
	
	# Install vim-plug
	# vim-plug download url
	vimplug_url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	# vim-plug file name
	vimplug_file="plug.vim"
	if [ ! -f "$nvim_autoload_dir/$vimplug_file" ]; then
		echo 'installing vim-plug'
		curl -# -fLo "$nvim_autoload_dir/$vimplug_file" --create-dirs $vimplug_url
		echo 'vim-plug installed'
	fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    setup;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setup;
    fi;
fi;
unset setup;
