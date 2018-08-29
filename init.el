;;; init.el --- Emacs Initialization File
;;; Commentary:
;;; Code:

;; Bootstrap `use-package`
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
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
      shell-command-switch           "-ic"
      temporary-file-directory       (expand-file-name "~/.emacs.d/tmp")
      backup-directory-alist         `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      initial-frame-alist            '((tool-bar-lines . 0)
				       (width . 160)
				       (height . 50))
      initial-scratch-message        "Hi, Michiel!\n")

(delete-selection-mode)
(fset 'yes-or-no-p #'y-or-n-p)
(column-number-mode)
(global-linum-mode)
(global-auto-revert-mode)

;; Packages
(use-package projectile
  :ensure t
  :init   (setq projectile-use-git-grep t)
  :config (projectile-mode t)
  :bind   (("C-c f" . projectile-find-file)
           ("C-c F" . projectile-grep)))

(use-package rainbow-delimiters
  :ensure t
  :init   (progn
            (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))

(use-package highlight-symbol
  :ensure   t
  :diminish highlight-symbol-mode
  :commands highlight-symbol
  :bind     ("C-c h" . highlight-symbol))

(use-package magit
  :ensure   t
  :commands magit-status magit-blame
  :bind     ("C-c g s" . magit-status))

(use-package company
  :ensure   t
  :diminish company-mode
  :commands company-mode
  :init     (global-company-mode)
	    (setq
              company-idle-delay            0
              company-minimum-prefix-length 2))

(use-package yasnippet
  :ensure   t
  :diminish yas-minor-mode
  :commands yas-minor-mode
  :config   (yas-reload-all))

(use-package flycheck
  :ensure   t
  :config   (global-flycheck-mode 1)
  :diminish (flycheck-mode))

(provide 'init)
;;; init.el ends here
