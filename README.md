# bb2-mode
An Emacs major mode for Blitz Basic 2 (a basic compiler for the Amiga)

![bb2-mode screenshot](https://github.com/richardjdare/bb2-mode/blob/master/media/bb2-mode.jpg "bb2-mode screenshot")

*bb2-mode showing CaffeineFree.bb by Ben Campbell and JS Hong (1993) with the zerodark Emacs theme.*

## Features
* Syntax highlighting
* Automatic keyword capitalization (like the original Blitz II Editor)
* Eldoc-based online help for command parameters (similar to original editor)
* Load and save tokenized files
* Compile and run your code in the WinUAE Amiga Emulator

bb2-mode provides syntax highlighting and eldoc-based online help for ascii and tokenized Blitz Basic 2 source code. It should recognise all keywords from Blitz Basic 2.1.
It will also capitalize keywords as you type them like in the original Blitz 2 editor.

Keywords were extracted from Blitz using Stripper (1997) by D!ck/Carnage (from http://www.blitz-2000.co.uk/)

Keyword transformation code based on [sql-up-mode](https://github.com/Trevoke/sqlup-mode.el) by Aldric Giacomoni.

My first ever Emacs Lisp code, so bear with me.
## Installation
Download the project somewhere, then add the following to your .emacs file:
```
(add-to-list 'load-path "/path/to/bb2-mode/")
(require 'bb2-mode)
```

## Tokenized files
Blitz 2 saves source code files in a custom format in order to save floppy disk space. These files are known as *tokenized files* since they use 2-byte tokens to represent Blitz keywords. bb2-mode can load and save these files. Blitz 2 also exports ascii source code, but most historical Blitz source is tokenized.

If bb2-mode is displaying a tokenized file, it will say `bb2 Tokenized` in the mode line (like in the screenshot above). Ascii files will just say `bb2`.

To convert a tokenized file to ascii, or vice-versa:
```
m-x bb2-toggle-tokenized
```
Or use the keyboard shortcut `C-c C-t`

When saving, tokenized files will be saved as tokenized. Ascii files will be saved as ascii.

## Completion
bb2-mode uses Emacs' standard `completion-at-point` system to provide keyword completion. Use `C-M-i` to perform completion. company-mode will also work with bb2-mode.

## Compile and run in WinUAE
bb2-mode can connect to the WinUAE Amiga emulator using telnet and compile and run the source code you are editing. The file must be saved in a directory that is being used as a WinUAE virtual hard disk, and Blitz 2 must be running in the emulator.

```
m-x bb2-compile-and-run
```
Or use the keyboard shortcut `C-c C-e`

If the buffer is unsaved, you will be prompted to save it before the operation begins.

### Setting up WinUAE and your emulated Amiga
To use `bb2-compile-and-run` your emulated Amiga must be running ARexx. To run ARexx automatically when Workbench starts, add the following line to your startup-sequence (or S:user-startup)
```
sys:system/rexxmast
```
#### Setting up a telnet port in WinUAE
`bb2-compile-and-run` communicates with WinUAE using its built-in telnet port. In the WinUAE settings, go to Host->IO ports. Then set the serial port dropdown to `TCP://0.0.0.0:1234` and tick the `direct` checkbox.

![WinUAE serial port settings](https://github.com/richardjdare/bb2-mode/blob/master/media/winuae-serial-settings.jpg "WinUAE serial port settings")

On your Amiga, create a file `DEVS:MountList` with the following content:
```
AUX:
Handler = L:Aux-Handler
Stacksize = 1000
Priority = 5
```
Add the following commands to the end of S:user-startup:
```
mount aux:
newshell aux:
```
Restart your Amiga. You should now be able to telnet to your Amiga at localhost:1234

### Setting up bb2-mode
Before using `bb2-compile-and-run`, you must give bb2-mode the locations of the directories being used as WinUAE hard disks. These are used to convert the source code filenames into Amigados filenames when we load them into Blitz. You can do this by setting a variable, `bb2-amiga-file-locations` in your .emacs file. This variable is a list of dotted pairs each containing the path of an Amiga drive on the host system and its corresponding name in Amigados. For example:

```
(setq bb2-amiga-file-locations '(("d:/emulation/amiga/harddrive/" . "work:")))
```
This tells bb2-mode that the Windows directory, `"d:/emulation/amiga/harddrive/"` is being used as the `"work:"` drive on the Amiga. This means that a blitz source file at `"d:/emulation/amiga/harddrive/blitzcode/mycode.bb"` will be mapped to `"work:blitzcode/mycode.bb"` inside WinUAE

## Todo
* Separate keywords and functions? (unlike bb2 editor)
* Nicer/smarter indenting (current settings are more or less like bb2 editor)
* Add a menu with "save tokenized " and "save ascii" options
* Report if any missing/unknown tokens. Better error handling all round
* Find out if we can scan Blitz directly for commands and tokens for people with custom blitzlibs setups.
* Transfer files over telnet so we can compile and run without WinUAE virtual hard disk (on real amigas?)
