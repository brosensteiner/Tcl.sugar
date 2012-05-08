#!/usr/bin/tclsh

# i want to learn tcl so this script which executes the user script is written in tcl :)

# link for stylesheet:
puts "<link href=\"Scripts\\html_output.css\" type=\"text/css\" rel=\"stylesheet\" /> "

if { [info exists env(EDITOR_DIRECTORY_PATH)] && [info exists env(EDITOR_FILENAME)] } {
	set myFilepath $::env(EDITOR_DIRECTORY_PATH)/$::env(EDITOR_FILENAME)
	set myFilename $::env(EDITOR_FILENAME)
} else {
	puts "could not find \$EDITOR_DIRECTORY_PATH or \$EDITOR_FILENAME"
}

puts "<strong>interpreted script:</strong> <a href=\"$myFilepath\">$myFilename</a><br>"

# i want to catch all errors so here is a switch for all tcl error codes:
switch [catch {

	set filePathChannel [open $myFilepath]
	set theScript [read $filePathChannel]
	close $filePathChannel
	eval $theScript
	
} errMsg] {
	0 { puts "all ok" }
	1 { 
		# formatting the error output a little:
		set savedInfo $errorInfo
		regexp {while\sexecuting\s\".+?\"\s*\(.+\)} $savedInfo theExecuting
		
		set theSearchString {invoked\sfrom\swithin\s\".+?\"\s*\(.+\)}
		
		set theInvokedProcList [regexp -all -inline $theSearchString $savedInfo] 
		
		puts "<br><error>Error:</error> <strong>$errMsg</strong> $theExecuting<br>"
		
		foreach item $theInvokedProcList {
			puts "$item<br>"
		}
				
	}
	2 { return $result }
	3 { break }
	4 { continue }
	default { puts "default" }
}

puts "<br><a href=\"#top\">To top</a>"
