;;; init.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Benjamin Philip
;;
;; Author: Benjamin Philip <benjamin.philip495@gmail.com>
;; Maintainer: Benjamin Philip <benjamin.philip495@gmail.com>
;; Created: June 06, 2022
;; Modified: June 06, 2022
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/ben/init
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:



(require 'package)
(add-to-list 'package-archives
	       '("melpa"."https://melpa.org/packages/") t)
(add-to-list 'package-archives
	       '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Install use package if not already installed

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(setq use-package-always-ensure t) ;; ensure the Use package always installs a package

;; Backups and VC

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Looks

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(global-font-lock-mode 1)

;; smartparens

(use-package smartparens)
(require 'smartparens-config)
(smartparens-global-mode)
(show-paren-mode 1)

;; which key

(use-package which-key)
(which-key-setup-minibuffer) ;; use minibuffer with built in config
(which-key-mode)

;; flycheck

(use-package flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; company

(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)

;; lsp-mode

(use-package lsp-mode)

(setq lsp-completion-provider :capf)

;; Java stuff

(use-package lsp-java) ;; connects to the lsp

(require 'lsp-java-boot)

(add-hook 'java-mode-hook #'lsp)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

;; installation instructions
(setq lsp-java-server-install-dir "~/language-servers/java/")
(setq lsp-java-jdt-download-url "http://download.eclipse.org/che/che-ls-jdt/snapshots/che-jdt-language-server-latest.tar.gz ")

;; general settings
(setq lsp-java-trace-server t)
(setq lsp-java-implementations-code-lens-enabled t)

;; things to do with suggestions from the ide
(setq lsp-java-signatures-help-enabled t)
(setq lsp-java-completion-enabled t)
(setq lsp-java-completion-guess-methods-arguments t)


;; things to do with formating
(setq lsp-java-format-enabled t)
(setq lsp-java-save-actions-organize-imports t)
(setq lsp-java-format-comments-enabled t)



;;; init.el ends here
