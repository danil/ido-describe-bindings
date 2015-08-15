;;; ido-describe-bindings.el --- Yet Another `describe-bindings' with `ido'.

;; Copyright (C) 2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Package-Version: 0.0.1
;; Version: 0.0.1
;; Package-Requires: ((dash "2.11.0"))
;; Keywords: help
;; URL: http://danil.kutkevich.org/p/el/ido-describe-bindings

;;; Commentary:
;; Yet Another `describe-bindings' with `ido'.
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
(require 'dash)

(defgroup ido-describe-bindings nil
  "Yet Another `describe-bindings' with `ido'."
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

(defun ido-describe-bindings--dirty-bindings-string ()
  "Get all key bindings, header and new lines as string."
  (with-temp-buffer
    (describe-buffer-bindings (current-buffer))
    (buffer-string)))

(defun ido-describe-bindings--dirty-bindings-list ()
  "Get all key bindings, header and new lines as list."
  (split-string (ido-describe-bindings--dirty-bindings-string) "\n" t))

(defun ido-describe-bindings--binding? (str)
  (and (string-match-p (rx bol (any "C" "M" "H" "S")) str)
       (not (string-match-p "Prefix Command" str))))

(defun ido-describe-bindings--bindings-list ()
  "Get all key bindings as list."
  (-filter ido-describe-bindings--filter-function
           (ido-describe-bindings--dirty-bindings-list)))

(defun ido-describe-bindings--format (str)
  "Format `STR' to `kbd' friendly string."
  (mapconcat 'identity (butlast (split-string str)) " "))

;;;###autoload
(defun ido-describe-bindings ()
  "Yet Another `describe-bindings' with `ido'."

  (interactive)
  (let ((key (ido-describe-bindings--format
              (ido-completing-read ido-describe-bindings--prompt
                                   (ido-describe-bindings--bindings-list)))))
    (describe-key (kbd key))))

(provide 'ido-describe-bindings)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; ido-describe-bindings.el ends here
