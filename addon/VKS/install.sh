#!/sbin/sh

# External Tools.
chmod -R 0755 "$MODPATH/addon/VKS/tools"
[[ "$ARCH" == "arm" ]] || [[ "$ARCH" == "arm64" ]] && export PATH="$MODPATH/addon/VKS/tools/arm/:$PATH"
[[ "$ARCH" == "x86" ]] || [[ "$ARCH" == "x64" ]] && export PATH="$MODPATH/addon/VKS/tools/x86/:$PATH"

keytest() {
  ui_print ""
  ui_print "[Info] Performing a volume key test..."
  ui_print "[Info] Press a volume key"
  [[ "$(timeout 9 /system/bin/getevent -lc 1 2>&1 | /system/bin/grep 'VOLUME' | /system/bin/grep 'DOWN' > $TMPDIR/events)" ]] && {
    return 0
  } || {
    ui_print "[Info] Try again"
    timeout 9 keycheck
    local SEL="$?"
    [[ "$SEL" == "143" ]] && abort "[Error] Volume key not detected!" || return 1
  }
}

chooseport() {
  # Original idea by chainfire @xda-developers, improved on by ianmacd @xda-developers.
  # Note from chainfire @xda-developers: getevent behaves weird when piped, and busybox grep likes that even less than toolbox/toybox grep.
  while true; do
    /system/bin/getevent -lc 1 2>&1 | /system/bin/grep 'VOLUME' | /system/bin/grep 'DOWN' > "$TMPDIR/events"
    [[ "$(cat $TMPDIR/events 2>/dev/null | /system/bin/grep 'VOLUME' >/dev/null)" ]] && {
      break
    }
  done
  [[ "$(cat $TMPDIR/events 2>/dev/null | /system/bin/grep 'VOLUMEUP' >/dev/null)" ]] && {
    return 0
  } || {
    return 1
  }
}

chooseportold() {
  # Keycheck binary by someone755 @Github, idea for code below by Zappo @xda-developers.
  # Calling it first time detects previous input. Calling it second time will do what we want.
  while true; do
    keycheck
    keycheck
    local SEL="$?"
    if [[ "$1" == "UP" ]]; then
      UP="$SEL"
      break
    elif [[ "$1" == "DOWN" ]]; then
      DOWN="$SEL"
      break
    elif [[ "$SEL" == "$UP" ]]; then
      return 0
    elif [[ "$SEL" == "$DOWN" ]]; then
      return 1
    fi
  done
}

# Have user option to skip vol keys.
OIFS="$IFS"
IFS=\|
MID=false
NEW=false
case "$(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]')" in
  *novk*) ui_print "[*] Skipping volume keys..." ;;
  *) keytest && {
       VKSEL=chooseport
     } || {
       VKSEL=chooseportold
       ui_print "[Error] Legacy device detected, using old keycheck method"
       ui_print "[Info] Press volume up"
       "$VKSEL" "UP"
       ui_print "[Info] Press volume down"
       "$VKSEL" "DOWN"
     }
     ;;
esac
IFS="$OIFS"