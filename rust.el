;;; rust.el --- Emacs Rust Language Initialization File
;;; Commentary:
;;; Code:

(require 'use-package)

(use-package rust-mode
  :ensure t)

(use-package cargo
  :ensure t
  :hook   (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :ensure t
  :hook   (rust-mode . flycheck-rust-setup))

;;; rust.el ends here
