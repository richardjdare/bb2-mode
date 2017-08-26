# bb2-mode
An Emacs major mode for Blitz Basic II (a basic compiler for the Amiga)

![bb2-mode screenshot](https://github.com/richardjdare/bb2-mode/blob/master/media/bb2-mode.jpg "bb2-mode screenshot")

*bb2-mode showing CaffeineFree.bb by Ben Campbell and JS Hong (1993) with the zerodark Emacs theme.*

bb2-mode provides syntax highlighting and eldoc-based online help for ascii and tokenized Blitz Basic II source code. It should recognise all keywords from Blitz Basic 2.1.
It will also capitalize keywords as you type them like in the original Blitz II editor.

Keywords were extracted from Blitz using Stripper (1997) by D!ck/Carnage (from http://www.blitz-2000.co.uk/)

keyword transformation code based on [sql-up-mode](https://github.com/Trevoke/sqlup-mode.el) by Aldric Giacomoni.

My first ever Emacs Lisp code, so bear with me.
## Installation
Download the project somewhere, then add the following to your .emacs file:
```
(add-to-list 'load-path "/path/to/bb2-mode/")
(require 'bb2-mode)
```

## Tokenized files
Blitz II saves source code in a custom file format in order to save floppy disk space. These files are known as *tokenized files* since they use 2-byte tokens to represent Blitz keywords. bb2-mode can load and save these files. Blitz II also exports ascii source code, but most historical Blitz source is tokenized.

If bb2-mode is displaying a tokenized file, it will say `bb2 Tokenized` in the mode line (like in the screenshot above). Ascii files will just say `bb2`.

To convert a tokenized file to ascii, or vice-versa:
```
m-x bb2-toggle-tokenized
```
Or use the keyboard shortcut `C-c C-t`

When saving, tokenized files will be saved as tokenized. Ascii files will be saved as ascii. In the future, explicit "save tokenized" and "save ascii" commands will be added.

## Completion
bb2-mode uses Emacs's standard `completion-at-point` system to provide keyword completion. Use `C-M-i` to perform completion. company-mode will also work with bb2-mode.

## Compile and run in WinUAE
If you are editing a file that is inside a directory being used as a WinUAE hard disk, bb2-mode can connect to a running instance of WinUAE and tell Blitz Basic to compile and run that file.

```
m-x bb2-compile-and-run
```
Or use the keyboard shortcut `C-c C-e`

If the buffer is unsaved, you will be prompted to save it before the operation begins. Blitz II must be running in WinUAE when you call `bb2-compile-and-run`.

### Setting up WinUAE and your emulated Amiga

### Setting up bb2-mode
Before using `bb2-compile-and-run`, you must give bb2-mode the location of the directories being used as WinUAE hard disks. These are used to convert the source code filenames into Amigados filenames when we load them into Blitz. You can do this by calling `bb2-add-amiga-file-mapping` in your .emacs file. For example:
```
(bb2-add-amiga-file-mapping "d:emulation/amiga/harddrive/" "programs:")
```
This tells bb2-mode that the Windows directory, `"d:/emulation/amiga/harddrive/"` is being used as the `"programs:"` drive on the Amiga. This means that a blitz source file at `"d:/emulation/amiga/harddrive/blitzcode/mycode.bb"` will be mapped to `"programs:blitzcode/mycode.bb"` inside WinUAE

## Todo
* Add more 3rd party commands/commands from Amiblitz 2
* Separate keywords and functions? (unlike bb2 editor)
* Nicer/smarter indenting (current settings are more or less like bb2 editor)
* Add a menu with "save tokenized " and "save ascii" options
* Report if any missing/unknown tokens. Better error handling all round
* Find out if we can scan Blitz directly for commands and tokens for people with custom blitzlibs setups.
