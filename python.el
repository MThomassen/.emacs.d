;;; python.el --- Emacs Python Language Initialization File
;;; Commentary:
;;; Code:

(require 'use-package)

(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))

;;; python.el ends here
