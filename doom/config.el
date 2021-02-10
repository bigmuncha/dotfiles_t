;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'shift))
(global-set-key (kbd "<C-tab>") 'next-buffer)
(setq display-line-numbers-type nil)
;;(require 'ergoemacs-status)
;;(ergoemacs-status-mode)
(setq make-bakup-files  nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)
;;(setq show-paren-style 'expression)
(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы
(setq scroll-conservatively 10000)
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  ;;(open-line 1)
  ;;(next-line 1)
  )
(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w" ) 'duplicate-line)

(global-set-key (kbd "C-o") 'delete-backward-char)
(global-set-key (kbd "C-,") (kbd "RET"))
(global-set-key (kbd "C--") (kbd "C-/"))
(global-unset-key "\C-z")
(global-set-key "\C-z" 'advertised-undo)

(setq tab-width 4)
(global-visual-line-mode t)
(global-unset-key (kbd "S-<up>") )
(global-unset-key (kbd "S-<down>") )
(global-unset-key (kbd "S-<left>") )
(global-unset-key (kbd "S-<right>") )
(global-set-key (kbd "C-o") 'next-window-any-frame)
(setq treemacs-width 23)
(global-set-key (kbd "<f12>") 'treemacs)



;; для рефакторинга кода
;;    Run M-x swiper-all type your regex, it will list all results, you can move with up/down to see a preview for each result.
  ;;  Now press M-q and it will ask you what you want to replace the matches with, type it and press enter.
   ;; It will now walk you through an interactive replace, you can use  y/n/! on each, y to replace, n to skip, and ! to replace all without asking.

;;M-x swipper-all
;;набираешь то что необходимо заменить
;;M-q
;;набираешь то на что хочешь заменить
;;идет опрос типо тут надо а тут не надо нажимаешь для каждого у н или ! для всего
