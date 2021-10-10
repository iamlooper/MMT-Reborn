#!/sbin/sh
##############################
# MMT BOURNE LOGIC
##############################

##############################
# CONFIG VARIABLES
##############################
# Choose if you want to skip mount for your module or not.
SKIPMOUNT=false
# Select true if you want to want to debug
DEBUG=true
# Set true if you want to clean old files in module before injecting new module
CLEANSERVICE=true

##############################
# REPLACE
##############################

# List all directories you want to directly replace in the system

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"

##############################
# INFO PRINT
##############################

# Set what you want to be displayed on header on installation process
mod_info_print(){
#awk '{print}' "$MODPATH"/banner
#ui_print " "
}

##############################
# PERMISSIONS
##############################

# Set permissions
set_permissions(){
  set_perm_recursive "$MODPATH" 0 0 0755 0644
  #set_perm_recursive "$MODPATH/system/bin" 0 0 0755 0755
}