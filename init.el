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

;; No menu bar, no tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Minor tweaks
(evil-set-initial-state 'git-commit-mode 'insert)

;; Spaces only, please!
(setq-default indent-tabs-mode nil)

;; Highlight more stuff
(require 'font-lock)
(global-font-lock-mode t)

;; Highlight zshrc files
(add-to-list 'auto-mode-alist
             '("\\(.zshrc\\)\\'" . shell-script-mode))

;; Highlight gitconfig files
(add-to-list 'auto-mode-alist
             '("\\(.gitconfig\\)\\'" . gitconfig-mode))

;; Highlight current line
(global-hl-line-mode)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; Customise mode line color
(set-face-background 'mode-line "white")
(set-face-foreground 'mode-line "cyan")

(ido-mode 1)
(setq ido-separator " ")
