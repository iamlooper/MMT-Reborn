#!/sbin/sh
###########################
# MMT Bourne Setup Script
###########################

############
# Config Vars
############

# Uncomment if you want to skip mount for your module
# Uncomment if you want to clean old files in module before injecting new module
# Uncomment if you want to load vskel after module info print. If you want to manually load it, consider using load_vksel function
# Uncomment DEBUG if you want full debug logs (Saved To Internal Storage)
#SKIPMOUNT=true
CLEANSERVICE=true
#AUTOVKSEL=true
DEBUG=true

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
# Cleanup
############

# Remove unnecessary stuff
#do_cleanup(){
#rm -rf "$MODPATH/LICENSE" 2>/dev/null
#rm -rf "$MODPATH/README.md" 2>/dev/null
#}

############
# Permissions
############

# Set permissions
#set_permissions(){
#set_perm_recursive "$MODPATH" 0 0 0755 0644
#}

############
# Info Print
############

# Set what you want to be displayed on header of installation process
#info_print(){
#awk '{print}' "$MODPATH/banner"
#ui_print ""
#}

############
# Main
############

# Change the logic to whatever you want
#init_main(){
#ui_print ""
#}