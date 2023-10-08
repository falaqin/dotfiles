.  ~/.config/fish/alias.fish

if status is-interactive
	# Commands to run in interactive sessions can go here
	eval "$(oh-my-posh init fish --config ~/.poshthemes/catppuccin.omp.json)"
end
