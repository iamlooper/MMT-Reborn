#!/system/bin/sh
# MMT-REBORNE LOGIC
_sleep_to_boot_complete() {
until [[ "$(getprop sys.boot_completed)" == "1" ]] || [[ "$(getprop dev.bootcomplete)" == "1" ]]
do
       sleep 1
done
}

# Sleep until boot completed
_sleep_to_boot_complete
