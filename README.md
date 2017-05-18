# bb2-mode
An Emacs major mode for Blitz Basic II (a basic compiler for the Amiga)

![bb2-mode screenshot](https://github.com/richardjdare/bb2-mode/blob/master/media/bb2-mode.jpg "bb2-mode screenshot")

*bb2-mode showing CaffeineFree.bb by Ben Campbell and JS Hong (1993) with the zerodark Emacs theme.*

bb2-mode provides syntax highlighting and eldoc-based online help for both ascii and tokenized Blitz Basic II source code. It should recognise all keywords from Blitz Basic 2.1.
It will also correctly capitalize keywords as you type them like in the original Blitz II editor.

Keywords were extracted from Blitz using Stripper (1997) by D!ck/Carnage (from http://www.blitz-2000.co.uk/)

keyword transformation code based on [sql-up-mode](https://github.com/Trevoke/sqlup-mode.el) by Aldric Giacomoni.

My first ever Emacs Lisp code, so bear with me.
## Installation
Add the following to your .emacs file:
```
(add-to-list 'load-path "~/path/to/bb2-mode/")
(require 'bb2-mode)
```

## Tokenized files
Blitz II saves source code in a custom format to save floppy disk space. These files are known as *tokenized files* since they use 2-byte tokens to represent the Blitz language keywords. Although Blitz II can also load and save ascii, a great deal of Blitz source is tokenized. bb2-mode can load and save these files.

If bb2-mode is displaying a tokenized file, it will say `bb2 Tokenized` in the mode line (like in the screenshot above). Ascii files will just say `bb2`.

To convert a tokenized file to ascii, or vice-versa:
```
m-x bb2-toggle-tokenized
```
When saving, tokenized files will be saved as tokenized. Ascii files will be saved as ascii. In the future, explicit "save tokenized" and "save ascii" commands will be added.

## Todo
* Add more 3rd party commands/commands from Amiblitz 2
* separate keywords and functions? (unlike bb2 editor)
* nicer/smarter indenting (current settings are more or less like bb2 editor)
* find out if we can communicate from Emacs -> WinUAE -> ARexx -> Blitz for various things
* Completion
* Add a menu with "save tokenized " and "save ascii" options
