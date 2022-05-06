#!/sbin/sh

###########################
# MMT Reborn Logic
###########################

############
# Config Vars
############

# Set this to true if you want to skip mount for your module
SKIPMOUNT="false"
# Set this to true if you want to clean old files in module before injecting new module
CLEANSERVICE="false"
# Set this to true if you want to load vskel after module info print. If you want to manually load it, consider using load_vksel function
AUTOVKSEL="false"
# Set this to true if you want store debug logs of installation
DEBUG="true"

############
# Replace List
############

# List all directories you want to directly replace in the system
# Construct your list in the following example format
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"
# Construct your own list here
REPLACE="
"

############
# Permissions
############

# Set permissions
set_permissions() {
  set_perm "$MODPATH/placeholder" 0 0 0755 # For files
  set_perm_recursive "$MODPATH" 0 0 0777 0755 # For folders
}

############
# Info Print
############

# Set what you want to be displayed on header of installation process
info_print() {
  awk '{print}' "$MODPATH/banner"
  ui_print ""
}

############
# Main
############

# Change the logic to whatever you want
init_main() {
  ui_print ""
}