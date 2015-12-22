;;; ido-describe-bindings.el --- Yet another `describe-bindings' with `ido'.

;; Copyright (C) 2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.5
;; Package-Requires: ((ido-vertical-mode "1.0.0") (dash "2.11.0"))
;; Keywords: help
;; URL: https://github.com/danil/ido-describe-bindings

;;; Commentary:
;; Yet another `describe-bindings' with `ido'.
;; See the README.md for more details.

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(require 'ido)
(require 'ido-vertical-mode)
(require 'dash)

(defgroup ido-describe-bindings nil
  "Yet another `describe-bindings' with `ido'."
  :group 'help
  :group 'convenience)

(defcustom ido-describe-bindings--prompt "Describe binding: "
  "Minibuffer prompt."
  :type 'string
  :group 'ido-describe-bindings)

(defcustom ido-describe-bindings--filter-function 'ido-describe-bindings--binding?
  "Function which get string argument
and return true if given argument is a bindig."
  :type 'string
  :group 'ido-describe-bindings)

(defcustom ido-describe-bindings--buffer-name "ido-describe-bindings"
  "Name of the temporary buffer."
  :type 'string
  :group 'ido-describe-bindings)

(defun ido-describe-bindings--dirty-bindings-string ()
  "Get all key bindings, header and new lines as string."
  (let* ((buffer (current-buffer))

         (temp-buffer (make-temp-name ido-describe-bindings--buffer-name))

         (str (with-help-window temp-buffer
                (with-current-buffer temp-buffer
                  (describe-buffer-bindings buffer))
                (pop-to-buffer temp-buffer)
                (buffer-substring (point-min) (point-max)))))

    (kill-buffer-and-window)
    (pop-to-buffer buffer)

    str))

(defun ido-describe-bindings--dirty-bindings-list ()
  "Get all key bindings, header and new lines as list."
  (split-string (ido-describe-bindings--dirty-bindings-string) "\n" t))

(defun ido-describe-bindings--binding? (str)
  (and
   (not (string-match-p (rx bol (any "<" "`" " ")) str))
   (not (string-match-p "Prefix Command" str))
   (not (or (string= "" str)
            (string= "" str)
            (string= "---             -------" str)
            (string= "Function key map translations:" str)
            (string= "Global Bindings:" str)
            (string= "Input decoding map translations:" str)
            (string= "Key translations:" str)
            (string= "Major Mode Bindings:" str)
            (string= "key             binding" str)))))

(defun ido-describe-bindings--bindings-list ()
  "Get all key bindings as list."
  (-filter ido-describe-bindings--filter-function
           (ido-describe-bindings--dirty-bindings-list)))

(defun ido-describe-bindings--format (str)
  "Format `STR' to `kbd' friendly string."
  (mapconcat 'identity (butlast (split-string str)) " "))

;;;###autoload
(defun ido-describe-bindings ()
  "Yet another `describe-bindings' with `ido'."

  (interactive)
  (ido-vertical-mode t)
  (let ((key (ido-describe-bindings--format
              (ido-completing-read ido-describe-bindings--prompt
                                   (ido-describe-bindings--bindings-list)))))
    (describe-key (kbd key))))

(provide 'ido-describe-bindings)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; ido-describe-bindings.el ends here
