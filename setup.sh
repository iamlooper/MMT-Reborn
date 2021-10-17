#!/sbin/sh
###########################
# MMT - BOURNE SETUP SCRIPT
###########################

# CONFIG VARS
# Choose if you want to skip mount for your module or not.
SKIPMOUNT=false
# Set true if you want to clean old files in module before injecting new module
CLEANSERVICE=true
# Select true if you want to want to debug
DEBUG=true

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
# PERMISSIONS
##############################

# Set permissions (default perms are given by default)
set_permissions(){
#set_perm_recursive "$MODPATH/system/bin" 0 0 0755 0755
}

##############################
# INFO PRINT
##############################

# Set what you want to be displayed on header on installation process (important)
info_print(){
#awk '{print}' "$MODPATH/banner"
ui_print " "
}

##############################
# MAIN
##############################

# Change the logic to whatever you want.
init_main(){

# Change to whatever you want.
ui_print " "

# Load vksel
load_vksel

# Start vksel
VK=1
while true
do
ui_print "   $VK"
if $VKSEL 
then
VK=$((VK + 1))
else 
break
fi
if [ $VK -gt 5 ]
then
VK=1
fi
done

case $SM in
1 ) FCTEXTAD1="Text";;
esac

ui_print "[*] Selected: $FCTEXTAD1 "

if [ "$FCTEXTAD1" = "Text" ]; then
fi

# Change to whatever you want.
ui_print " "

}