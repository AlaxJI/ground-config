#MONITORS=$(xrandr --listmonitors | grep "Monitors" | cut -d" " -f2)
MONITORS=$(xrandr | grep " connected" | wc -l)
echo "Number of monitors is ${MONITORS}"

if [ "${MONITORS}" = "1" ]; then
    xrandr --output eDP-1 --primary
    xrandr --output eDP-1 --mode 1368x768
else
    xrandr --output HDMI-2 --primary
    # --mode 1920x1080_70
    xrandr --output DP-1 --left-of HDMI-2
    # --mode 1920x1080_70
    xrandr --output eDP-1 --right-of HDMI-2
    xrandr --output eDP-1 --mode 1280x720 --pos 3840x360
fi