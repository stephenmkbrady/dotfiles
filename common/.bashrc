#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}
# Add tiled wallpaper and change colors to match wallpaper colors
wal-tile() {
    wal -c -a 80 -n -i "$@"
    feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"
}
enable-hdmi(){
    xrandr --auto --output HDMI2 --mode 1920x1080 --left-of eDP1
    nitrogen --restore
}
disable-hdmi(){
    xrandr --output HDMI2 --off
    nitrogen --restore

}

vol-hdmi-up(){
    ponymix -d alsa_output.pci-0000_00_03.0.hdmi-stereo-extra1 increase "$@"
}
vol-hdmi-down(){
    ponymix -d alsa_output.pci-0000_00_03.0.hdmi-stereo-extra1 decrease "$@"
}

vol-laptop-up(){
    ponymix -d alsa_output.pci-0000_00_1b.0.analog-stereo increase "$@"
}
vol-laptop-down(){
    ponymix -d alsa_output.pci-0000_00_1b.0.analog-stereo decrease "$@"
}

vol-up(){
    ponymix -d combined increase "$@"
}
vol-down(){
    ponymix -d combined decrease "$@"
}
[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion && neofetch --gtk2 off --gtk3 off 


