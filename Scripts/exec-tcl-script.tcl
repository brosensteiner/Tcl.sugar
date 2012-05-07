#!/usr/bin/tclsh

# link for stylesheet:
puts "<link href=\"Scripts\\html_output.css\" type=\"text/css\" rel=\"stylesheet\" /> "

if { [info exists env(EDITOR_DIRECTORY_PATH)] && [info exists env(EDITOR_FILENAME)] } {
	set myFilepath $::env(EDITOR_DIRECTORY_PATH)/$::env(EDITOR_FILENAME)
	set myFilename $::env(EDITOR_FILENAME)
} else {
	puts "could not find \$EDITOR_DIRECTORY_PATH or \$EDITOR_FILENAME"
}

puts "<strong>interpreted script:</strong> <a href=\"$myFilepath\">$myFilename</a><br>"

# i want to catch all errors so here is a switch:
switch [catch {

	source $myFilepath
	
} errMsg] {
	0 { puts "all ok" }
	1 {
		set savedInfo $errorInfo
		puts "<br><error>Error:</error> <strong>$errMsg</strong><br>"
		puts "$savedInfo"
	}
	2 { return $result }
	3 { break }
	4 { continue }
	default { puts "default" }
}

puts "<br><a href=\"#top\">To top</a>"

