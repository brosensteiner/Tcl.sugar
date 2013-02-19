#!/usr/bin/tclsh

# i want to learn tcl so this script which executes the user script is written in tcl :)

fconfigure stdout -buffering line

# link for stylesheet:
puts "<link href=\"Scripts\\html_output.css\" type=\"text/css\" rel=\"stylesheet\" /> "

if { [info exists env(EDITOR_DIRECTORY_PATH)] && [info exists env(EDITOR_FILENAME)] } {
	set myFilepath $::env(EDITOR_DIRECTORY_PATH)/$::env(EDITOR_FILENAME)
	set myFilename $::env(EDITOR_FILENAME)
} else {
	puts "could not find \$EDITOR_DIRECTORY_PATH or \$EDITOR_FILENAME"
}
 
puts "<strong>script:</strong> <a href=\"$myFilepath\">$myFilename</a><br>"

# catching all errors, so here is a switch for all tcl error codes:
switch [catch {
	
	set filePathChannel [open $myFilepath]
	set theScript [read $filePathChannel]
	close $filePathChannel
	eval $theScript
	
} catchVar] {
	0 { puts $catchVar }
	1 { 
		# let the error output look nice:
		set savedInfo $errorInfo
		regexp {while\sexecuting\s\".+?\"\s*\(.+\)} $savedInfo theExecuting
				
		set theInvokedProcList [regexp -all -inline {invoked\sfrom\swithin\s\".+?\"\s*\(.+\)} $savedInfo] 
		
		puts "<br><error>Error:</error> <strong>$catchVar</strong> $theExecuting<br>"
		
		foreach item $theInvokedProcList {
			puts "$item<br>"
		}
				
	}
	2 { return $catchVar }
	3 {  } # break
	4 {  } # continue
	default { puts "default" }
}

puts "<br><a href=\"#top\">To top</a>"
