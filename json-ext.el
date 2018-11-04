;;; package --- Summary
;;; Commentary:

;;; Code:

(defun json-ext-escape ()
  "Replace whitespace characters in json with c# equivalents."
  (interactive)
  (let ((my-seq '((?\n . "\\n") (?\t . "\\t") (?\" . "\\\""))))
    (mapc 'json-ext-replace-char my-seq)
    ))


(defun json-ext-replace-char (char-assoc)
  "Search and replace given character in buffer.
CHAR-ASSOC - key-value list"
  (with-current-buffer (current-buffer)
    (goto-char (point-min))
    (while (search-forward (char-to-string (car char-assoc)) nil t)
      (replace-match (cdr char-assoc) nil 'literal))))

(provide 'json-ext)
;;; json-ext ends here
