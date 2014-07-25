;; MELPA
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; >:D - "Mwahaha!"
(global-evil-leader-mode)
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(evil-leader/set-leader ",")

(evil-leader/set-key
 "e" 'find-file
 "b" 'switch-to-buffer
 "k" 'kill-buffer)

;; Load ruby mode with these extensions, too!
(add-to-list 'auto-mode-alist
             '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;; Don't add utf-8 encoding anotations
(setq ruby-insert-encoding-magic-comment nil)

;; Clean new trailing whitespace before saving
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Numbers!
(global-linum-mode t)
(setq linum-format "%3d ")
(setq column-number-mode t)

;; Smooth sailin' -- scrolling
(setq scroll-margin 10)
(require 'smooth-scrolling)

;; Auto follow symlinks to version-controlled files
(setq vc-follow-symlinks t)

;; Solarized, please!
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized-light t)
(setq solarized-use-terminal-theme t)

;; No menu bar
(menu-bar-mode -1)

;; Minor tweaks
(evil-set-initial-state 'git-commit-mode 'insert)
(evil-set-initial-state 'git-rebase-mode 'emacs)

;; Spaces only, please!
(setq-default indent-tabs-mode nil)

;; Highlight more stuff
(require 'font-lock)
(global-font-lock-mode t)

;; Highlight zshrc files
(add-to-list 'auto-mode-alist
             '("\\(.zshrc\\)\\'" . shell-script-mode))

;; Hihglight gitconfig files
(add-to-list 'auto-mode-alist
             '("\\(.gitconfig\\)\\'" . gitconfig-mode))

;; Highlight current line
(global-hl-line-mode)
