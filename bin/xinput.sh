TOUCHPAD=$(xinput list   | grep "Touchpad" | cut -d"=" -f2 | cut -f1)
TAPP_ON_CLICK=$(xinput list-props 12   | grep "Tapping Enabled (" | cut -d"(" -f2 | cut -d")" -f1)
NATURAL_SCROLL=$(xinput list-props 12   | grep "Natural Scrolling Enabled (" | cut -d"(" -f2 | cut -d")" -f1)
DRAG=$(xinput list-props 12   | grep "Tapping Drag Enabled (" | cut -d"(" -f2 | cut -d")" -f1)

# get list of input devices: `xinput list` - to get numbre of touchpad
# get list of property: `xinput list-propers`
# 344 is property of "type to click"
# set property on
xinput set-prop ${TOUCHPAD} ${TAPP_ON_CLICK} 1
# 324 is Natural Scrolling
xinput set-prop ${TOUCHPAD} ${NATURAL_SCROLL} 1
# 346 Tapping Drag Enabled 
xinput set-prop ${TOUCHPAD} ${DRAG} 0

ORSOLYA=$(xinput list   | grep "orsolya Keyboard" | cut -d"=" -f2 | cut -f1)

if [ "${ORSOLYA}" != "" ]; then
    echo "orsolya Keyboard"
    xkbcomp $HOME/.config/xkb/dump/xkb_like_apple_orsolya $DISPLAY
else
    xkbcomp $HOME/.config/xkb/dump/xkb_like_apple $DISPLAY
fi

