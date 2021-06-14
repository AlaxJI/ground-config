OUTPUT=$(i3-msg -t get_workspaces | sed 's/},{/}\n{/g' | grep '"focused":true' | cut -d"," -f10 | cut -d'"' -f4)

MONUTOR="3"
if [ "${OUTPUT}" = "DP-1" ]; then
MONUTOR="1"
elif [ "${OUTPUT}" = "HDMI-2" ]; then
MONUTOR="2"
fi

i3-msg "workspace ${MONUTOR}$1"