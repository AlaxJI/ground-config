#!/usr/bin/env bash
# Внимание! Этот скрипт нужен для запуска polybar, он используется в конфигурационном файле Bspwm для автозапуска.

killall -q polybar

#$HOME/ground-config/bin/xrandr3m.sh

POLYBAR_CONFIG="$HOME/ground-config/config/polybar/polybar.conf"

echo "polybar -c $POLYBAR_CONFIG ${1}top"

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/topbar.log /tmp/bottombar.log

if type "xrandr"; then

  PRIMARY=$(xrandr --query | grep " primary" | cut -d" " -f1)
  echo "Primary monitor is ${PRIMARY}"

  MONITORS=$(xrandr | grep " connected" | wc -l)
  echo "Number of monitors is ${MONITORS}"

  if [ "${MONITORS}" = "1" ]; then
    polybar -c $POLYBAR_CONFIG ${1}primary >> /tmp/polybar1.log 2>&1 &
  else
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      if [ "$m" = "$PRIMARY" ]; then
        MONITOR=$m polybar -c $POLYBAR_CONFIG ${1}primary >> /tmp/polybar1.log 2>&1 &
      else
        MONITOR=$m polybar -c $POLYBAR_CONFIG ${1}top >> /tmp/polybar1.log 2>&1 &
      fi
    done
  fi
else
    polybar -c $POLYBAR_CONFIG ${1}primary >> /tmp/polybar1.log 2>&1 &
fi

echo "Bars $1 launched..."
