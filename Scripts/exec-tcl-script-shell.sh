#!/bin/bash

exec osascript <<EOF

tell application "Terminal"
activate

do script "tclsh $E_FILEPATH" in window 1

end tell

EOF

# exec osascript <<EOF
# 
# tell application "Terminal"
# activate
# do script "tclsh" in window 1
# do script "set theFilePath $::env(EDITOR_DIRECTORY_PATH)/$::env(EDITOR_FILENAME)" in window 1
# do script "source \$theFilePath" in window 1
# do script "exit" in window 1
# end tell
# 
# EOF

