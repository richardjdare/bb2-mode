# bb2-mode
An Emacs major mode for Blitz Basic II (a basic compiler for the Amiga)

bb2-mode provides syntax highlighting for ascii Blitz Basic II source code. It should recognise all keywords from Blitz Basic 2.1. Keywords were extracted from Blitz using Stripper (1997) by D!ck/Carnage (from http://www.blitz-2000.co.uk/)

My first ever Emacs Lisp code, so bear with me.

## Todo
* Add more 3rd party commands/commands from Amiblitz 2
* separate keywords and functions? (unlike bb2 editor)
* nicer/smarter indenting (current settings are more or less like bb2 editor)
* capitalize/title-case keywords like the bb2 editor does
* load and save tokenized bb2 files (somehow)
* display command help in the mode line (like bb2 editor does in the title bar)
* find out if we can communicate from Emacs -> WinUAE -> ARexx -> Blitz for various things
