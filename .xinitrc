# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        # shellcheck source=/dev/null
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

dte(){
    dte="$(date +'%a, %b - %I:%M')"
    echo -e " $dte"
}

mem(){
    mem=`free | awk '/Mem/ { printf "%0.f%\n", $3/$2*100}'`
    echo -e " $mem"
}

vol(){
    vol=`pamixer --get-volume`
    echo -e " $vol%"
}

brt() {
   brightness=`brightnessctl get | awk '{printf "%d%\n", $1*100/255}'`
   echo -e " $brightness"
}

while true; do
	xsetroot -name "| $(brt)  | $(vol) | $(mem) | $(dte)  "
	sleep 10s
done &
~/.fehbg

picom -b
exec dwm

