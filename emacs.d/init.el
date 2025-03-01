;; Base settings
(use-package emacs
  :ensure nil
  :config
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (global-display-line-numbers-mode -1)
  (electric-pair-mode t)
  (auto-fill-mode t)
  (set-frame-font "Fira Code Nerd Font Medium 17" nil t))
  
;; Enable local themes
(use-package emacs
  :ensure nil
  :load-path "themes/"
  :init
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
  :config
  (load-theme 'doom-gruvbox-light t))

;; Repos
(use-package package
  :custom
  (package-user-dir "~/.emacs.d/elpa")
  (package-archives
	  '(("melpa" . "https://melpa.org/packages/")
	    ("elpa" . "https://elpa.gnu.org/packages/"))))
;; Line
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Icons
(use-package all-the-icons
  :ensure t)

(use-package nerd-icons
  :ensure t)

;; Org-mode
(use-package org
  :custom
  (org-todo-keywords
   '((sequence "TODO(t)" "|" "DONE(d)")
     (sequence  "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
     (sequence "|" "CANCELED(c)"" NOOPTIONS(n)")))
  :custom-face
  (org-level-1 ((t (:inherit outline-1 :height 1.25))))
  (org-level-2 ((t (:inherit outline-2 :height 1.2))))
  (org-level-3 ((t (:inherit outline-3 :height 1.1))))
  :hook
  (org-mode . org-indent-mode)
  :bind ("C-c a". org-agenda))


(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; TODO Change to your agenda files
;; Agenda
;; (use-package org
 ;; :defer t
 ;; :custom
 ;; (org-log-done t)
 ;; (org-agenda-files (list "~/Templates/emacs/emacs_tasks.org"
			  ;; "~/Templates/school/school.org"
			  ;; "~/Templates/programming/C/TCPL.org"
  			  ;; "~/Templates/other/other_tasks.org")))

;; Viewing images from links
(use-package uimage
  :ensure t
  :diminish
  :custom 
  (org-startup-with-inline-images t)
  :hook
  (org-mode . uimage-mode))

;; Welcome screen
 (use-package dashboard
   :ensure t
  :custom
  (dashboard-startup-banner (concat user-emacs-directory "themes/emacs.txt"))
;;  (dashboard-startup-banner 'logo)
  (dashboard-banner-logo-title "Welcome to Emacs Adventurer")
  (initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
  (dashboard-center-content t)
  (dashboard-show-shortcuts nil)
  (dashboard-vertically-center-content t)
  (dashboard-display-icons-p t) ;; display icons on both GUI and terminal
  (dashboard-icon-type 'nerd-icons) ;; use `nerd-icons' package
  (dashboard-set-heading-icons t) ;; Use icons in heading
  (dashboard-set-file-icons t) ;; Use icons in file names
  :config
  (dashboard-setup-startup-hook))
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil) 

;; Company
(use-package company
  :ensure t
  :hook
  (org-mode . company-mode) 
  (c-mode . company-mode)
  :init
  (setq company-format-margin-function nil))

;; Disable custom-set-variables
(use-package cus-edit
  :custom
  (custom-file null-device "Don't store customizations"))

;; Cc mode
(use-package cc-mode
  :custom
  (c-electric-flag nil)
  (c-default-style '((c-mode . "bsd")
		     (c++-mode . "bsd")
                     (other . "bsd"))))

;; Lsp
(use-package lsp-mode
  :ensure t
  :custom
  (lsp-headerline-breadcrumb-icons-enable nil)
  :hook
  ((c-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Tab bar
(use-package vim-tab-bar
  :ensure t
  :config
  (vim-tab-bar-mode t))

;; Treesitter	I don't need it
;; (use-package tree-sitter
 ;; :ensure t)

;; (use-package tree-sitter-langs
 ;; :ensure t
 ;; :hook
 ;; (c-mode . tree-sitter-hl-mode))

;; Rainbow
(use-package rainbow-mode
  :ensure t
  :custom
  (rainbow-ansi-colors t)
  (rainbow-html-colors t)
  (rainbow-latex-colors t)
  (rainbow-r-colors t)
  (rainbow-x-colors t)
  :hook
  (prog-mode helpful-mode org-mode text-mode conf-mode))

;; Vterm
(use-package vterm
  :ensure t
  :bind
  ("C-c t v" . vterm))

;; Telega
(use-package alert
  :ensure t
  :defer t
  :custom
  (alert-default-style 'libnotify))

(use-package telega
  :ensure t
  :custom
  (telega-server-libs-prefix "/home/dct/.local/td")
  (telega-video-play-inline t)
  (telega-language "en")
  (telega-dired-dwim-target t)
  (telga-emoji-font-family "Fira Code Nerd Font")
  (telega-symbol-reply "")
  (telega-symbol-eye "")
  (telega-symbol-contact "󰓎")
  (telega-symbol-photo " ")
  (telega-symbol-location "")
  (telega-symbol-checkmark "<")
  (telega-symbol-heavy-checkmark ">")
  (telega-symbol-poll-options (list "󰝦" "󰝥"))
  (telega-symbol-dice-list (list "󱅊" "󰇊" "󰇋" "󰇌" "󰇍" "󰇎" "󰇏"))
  (telega--dice-emojis (list "󱅊" "󰇊" "󰇋" "󰇌" "󰇍" "󰇎" "󰇏"))
  (telega-symbol-attachment "")
  (telega-symbol-bell "")
  (telega-symbol-lock "  ") 
  (telega-symbol-game "")
  (telega-symbol-audio "")
  (telega-symbol-poll "")
  (telega-symbol-flames "")
  (telega-symbol-lightning "󱐋")
  (telega-symbol-premium "")
  (telega-symbol-favorite "")
  (telega-symbol-telegram " ")
  (telega-symbol-ballout-check "󰱒")
  (telega-symbol-ballout-empty "󰄱")
  (telega-symbol-poll-multiple-options (list "󰄱" "󰱒"))
  (telega-symbol-phone "󰏲 ")
  (telega-symbol-blocked "󰂭  ")
  (telega-symbol-copyright "󰗦")
  (telega-symbol-verified " 󰞑")
  (telega-symbol-mode "<")
  (telega-symbol-folder " ")
    (telega-symbol-draft "Draft")
    (telega-appindicator-icon-colors '((offline "#504945" "#ebdbb2" nil)
					 (online "#458588" "#ebdbb2" "#b8bb26")
					 (connecting "#b16286" "#ebdbb2" "#d79921")))
  :config
  (require 'telega-alert)
  (telega-notifications-mode t)
  (telega-appindicator-mode t)
  (telega-alert-mode t)
  :bind
  ("C-c t t" . telega))


;; Xah Fly
(use-package xah-fly-keys
  :load-path "lisp/"
  :config
  (xah-fly-keys-set-layout "qwerty")
  (xah-fly-keys 1))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define-global "jk" 'xah-fly-command-mode-activate))  

(use-package  disable-mouse
  :ensure t
  :hook
  (c-mode . disable-mouse-mode)
  (org-mode . disable-mouse-mode))

;; Magit
(use-package magit
  :ensure t)
