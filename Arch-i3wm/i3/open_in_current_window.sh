#!/bin/bash
#shitty program that allows programs that are only opened once to be opened in current window. Only tested for slack and discord. Slack is capital when called by this, but lowercase when called with exec, hence why its so wierd
let current_workspace=$(i3-msg -t get_workspaces   | jq '.[] | select(.focused==true).name'   | cut -d"\"" -f2)
program="$1"
message="i3-msg [class=\"$program\"] move to workspace $current_workspace"
pre_output=$($message)
output="$pre_output"
echo output
echo $output
validity=${output:12:1}
#valid=$(expr substr $output 13 1)
echo $validity
if [ "$validity" = "f" ]; then
    $(exec ${program,})
fi


