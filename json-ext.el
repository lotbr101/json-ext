;;; package --- Summary
;;; Commentary:

;;; Code:

(defun json-ext-escape ()
  "Replace whitespace characters in json with c# equivalents."
  (interactive)
  (let ((my-seq '((?\n . "\\n") (?\t . "\\t") (?\" . "\\\""))))
    (mapc 'json-ext-replace my-seq)
    ))


(defun json-ext-replace (char-assoc)
  "Search and replace given character in buffer.
CHAR-ASSOC - key-value list"
  (with-current-buffer (current-buffer)
    (goto-char (point-min))
    (while (search-forward (if (characterp (car char-assoc)) (char-to-string (car char-assoc)) (car char-assoc)) nil t)
      (replace-match (if (stringp (cdr char-assoc)) (cdr char-assoc) (char-to-string (cdr char-assoc)))  nil 'literal))))

(defun json-ext-from-escape ()
  "Replace escaped whitespace character to real characters."
  (interactive)
  (let ((seq '(("\\n". ?\n) ("\\t" . ?\t) ("\\\"" . ?\"))))
    (mapc 'json-ext-replace seq)))

(provide 'json-ext)
;;; json-ext ends here
