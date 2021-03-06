# Tcl.sugar

Tcl sugar for MacRabbit´s Espresso (complete – intelligent most of the time – code sense and syntax highlighting of all Tcl built-in procedures, options and switches - mostly auto-generated with a script from the Tcl 8.6 manual and when needed tuned by hand). This Sugar also provides all typical Espresso Sugar "bells and whistles" (navigator view, code folding, some predefined text actions ...). To see what the Sugar can do please look in the Tcl menu in Espresso after installing the Tcl.sugar. If someone has suggestions or questions please let me know and [email me](mailto:brosensteiner@gmail.com)

**IMPORTANT:** In order to use some of the text actions the [ShellActions-sugar](https://github.com/onecrayon/ShellActions-sugar) is needed.

## Amira Tcl Interface

This sugar also contains special commands from VSG´s Amira (5.4.2) Tcl scripting interface. Since the Amira Tcl commands are only a Tcl library this commands are not in a separate sugar. If you don´t need it (most people don't) you can easily delete the following files in the Tcl.sugar:

- /Syntaxes/AmiraSyntax.xml
- /CodeSenseLibraries/Amira.xml
- /CodeSenseProvieders/Amira.xml
- /TextActions/Amira.*
- /PlaceholderThemes/Tcl.css (only Amira selector in the file!)

## Installation

Paste the following in terminal:

```bash
    cd ~/Library/Application\ Support/Espresso/Plug-Ins
    git clone git://github.com/brosensteiner/Tcl.sugar.git
```

## MIT License

Copyright (c) 2014 Bernhard Rosensteiner

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


