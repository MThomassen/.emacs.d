;; init.el --- Emacs Initialization File
;;; Commentary:
;;; Code:

;; Bootstrap `use-package`
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org-elpa" . "https://orgmode.org/elpa/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq indent-tabs-mode               nil
      inhibit-startup-screen         t
      ring-bell-function             #'ignore
      message-log-max                10000
      load-prefer-newer              t
      delete-old-versions            t
      gc-cons-threshold              20000000
      shell-command-switch           "-c"
      temporary-file-directory       (expand-file-name "~/.emacs.d/tmp")
      backup-directory-alist         `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      initial-frame-alist            '((tool-bar-lines . 0)
				       (width . 180)
				       (height . 50))
      initial-scratch-message        "Hi, Michiel!\n")

(delete-selection-mode)
(fset 'yes-or-no-p #'y-or-n-p)
(column-number-mode)
(global-linum-mode)
(global-auto-revert-mode)

;; Theme
(use-package zenburn-theme
  :ensure t
  :init   (load-theme 'zenburn t))

;; Global Packages
(use-package diminish
  :ensure t)

(use-package projectile
  :ensure t
  :init   (setq projectile-use-git-grep t)
  :config (projectile-mode t)
  :bind   (("C-c f" . projectile-find-file)
           ("C-c F" . projectile-grep)))

(use-package rainbow-delimiters
  :ensure t
  :hook   (prog-mode . rainbow-delimiters-mode))

(use-package highlight-symbol
  :ensure   t
  :diminish highlight-symbol-mode
  :commands highlight-symbol
  :bind     ("C-c h" . highlight-symbol))

(use-package magit
  :ensure   t
  :commands magit-status magit-blame
  :bind     ("C-c g s" . magit-status))

(use-package lsp-mode
  :ensure   t
  :commands lsp)

(use-package lsp-ui
  :ensure   t
  :commands lsp-ui
  :hook     (lsp-mode . lsp-ui-mode))

(use-package company-lsp
  :ensure   t
  :commands company-lsp)

(use-package company
  :ensure   t
  :diminish company-mode
  :hook     (prog-mode . company-mode)
  :init     (setq
              company-idle-delay                0
              company-minimum-prefix-length     2
	      company-tooltip-align-annotations t)
  :config   (push 'company-lsp company-backends))

(use-package yasnippet
  :ensure   t
  :diminish yas-minor-mode
  :commands yas-minor-mode
  :init     (yas-global-mode)
  :config   (yas-reload-all))

(use-package yasnippet-snippets
  :ensure t)

(use-package flycheck
  :ensure   t
  :config   (global-flycheck-mode 1)
  :diminish flycheck-mode)

(use-package toml-mode
  :ensure   t)

;; language-specific
(load-file "~/.emacs.d/rust.el")

(load-file "~/.emacs.d/python.el")

(provide 'init)
;;; init.el ends here
