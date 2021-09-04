###########################
# MMT - BOURNE SETUP SCRIPT
###########################

# CONFIG VARS
# Choose if you want to skip mount for your module or not.
SKIPMOUNT=false
# Set this true if you want auto unzipping of pre-defined folders (set false if you have modified custom unzipping function)
AUTO_UNZIP=true
# Select true if you want to want to debug
DEBUG=true
# Set true if you want to load system.prop
PROPFILE=true
# Set true if you want to load post-fs-data.sh
POSTFSDATA=false
# Set true if you want to load service.sh
LATESTARTSERVICE=true
# Set true if you want to clean old files in module before injecting new module
CLEANSERVICE=true
# Set this true if you want to print pre-defined banner while flashing
BANNER_PRINT=true
# More functions soon😎

# Input options which you want to be replaced
REPLACE="
"

# Set what you want to be displayed on header on installation process (not needed much)
mod_info_print() {
}

# Default extraction path is to $MODPATH. Change the logic to whatever you want. Give required sleepers in ever ui_print for better understanding of test printed
install_module() {

# Custom unzipping logic (keep addon unzip function intact)
unzip -o "$ZIPFILE" 'addon/*' -d $TMPDIR >&2
#unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2


# Preparing rest settings
ui_print "[*] Preparing..."

# Input the necessary logic you want in your module here
ui_print ""

# Print module extracting text here for better ordered arrangement of prints
ui_print "[*] Extracting module files..."

# Load Vol Key Selector (don't change)
. $TMPDIR/addon/Volume-Key-Selector/install.sh

# Modify this section according to your needs.
ui_print "[*] Installing module..."
ui_print "[*] Modes Selector: "
ui_print "[*] Volume + = Switch × Volume - = Select "
ui_print "[*] Select which mode you want:"
SM=1
while true
do
ui_print "  $SM"
if $VKSEL 
then
SM=$((SM + 1))
else 
break
fi
if [ $SM -gt 1 ]
then
SM=1
fi
done

case $SM in
1 ) FCTEXTAD1="Text";;
esac

ui_print "[*] Selected: $FCTEXTAD1 "

if [ "$FCTEXTAD1" = "Text" ]
then
fi

ui_print "[*] Module has been installed successfully."

# Input some notes here about module or any other info
ui_print " --- Additional Notes --- "
ui_print "[*] Reboot is required"

}

# Set permissions
set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0755 0644
  set_perm_recursive "$MODPATH/system/bin" 0 0 0755 0755

}