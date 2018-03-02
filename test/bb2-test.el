;;; bb2-test.el
;;; tests for bb2-mode
;;; Richard Dare
;;; www.richardjdare.com

;;; This is for comparing tokenized files created by bb2-mode with blitz 2 originals.
;;;
;;; put some original blitz 2 tokenized files in bb2-test-src-dir and run (bb2-test-run)
;;; bb2-mode will then load and tokenize them, and save them in test-dest-dir
;;; then a binary file compare will be perfomed between them to see if there are any differences
;;; (im on windows and using fc to compare my files)


(require 'bb2-mode)

(defvar bb2-test-src-dir nil "Directory containing tokenized bb2 files to test against")
(setq bb2-test-src-dir "d:/projects/bb2-mode/test/testsrc/")

(defvar bb2-test-dest-dir nil "Directory where we save our test files after tokenization")
(setq bb2-test-dest-dir "d:/projects/bb2-mode/test/testdest/")

(defvar bb2-test-compare-str nil "Shell command string used to compare 2 files")
(setq bb2-test-compare-str "fc /b %s %s")

(defun bb2-test-get-files ()
  (cl-remove-if-not
   (lambda (v)
     (or (string-suffix-p ".bb" v 'ignore-case)
	 (string-suffix-p ".bb2" v 'ignore-case)))
   (directory-files bb2-test-src-dir)))

(defun bb2-test-load-and-convert (file)
  (mapconcat 'unibyte-string
	     (bb2-string-to-tokens
	      (bb2-tokens-to-string
	       (bb2-load-binary-file (concat bb2-test-src-dir file))))
	     ""))

(defun bb2-test-load-tokenize-save (file)
  "Load a tokenized file, convert to ascii, tokenize it again and save it"
  (with-temp-file (concat bb2-test-dest-dir file)
    (set-buffer-file-coding-system 'binary)
    (bb2-replace-buffer-contents
     (current-buffer)
     (bb2-test-load-and-convert file)))
    file)
  
(defun bb2-test-run ()
  "run the tokenizer test"
  (let ((files (bb2-test-get-files)))
    (dolist (file (mapcar 'bb2-test-load-tokenize-save files))
      (bb2-test-compare file))))
	       
(defun bb2-test-compare (file)
  (let ((result (shell-command-to-string
		 (format bb2-test-compare-str
			 (concat (subst-char-in-string ?/ ?\\ bb2-test-src-dir) file)
			 (concat (subst-char-in-string ?/ ?\\ bb2-test-dest-dir) file)))))
    (if (string-match-p "no differences encountered" result)
	(print (format "%s" file))
      (print (format "%-25s FILES DIFFERENT" file)))))
		  
