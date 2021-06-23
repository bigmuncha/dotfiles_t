
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes '(light-blue))
 '(package-selected-packages
   '(magit doom-themes clojure-mode lsp-mode cider treemacs flycheck company irony helm company-irony flycheck-irony smartparens))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 120 :width normal)))))


(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(setq package-selected-packages '(clojure-mode lsp-mode cider lsp-treemacs flycheck company irony helm company-irony flycheck-irony projectile rtags))


;;;;; Clojure settings
;;;;;
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil
      ; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
      ; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
      )
(setq lsp-clojure-custom-server-command '("bash" "-c" "~/.emacs.d/clojure-lsp"))
;;(setq lsp-enable-completion-at-point nil) ; use cider completion
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
(setq company-idle-delay 0)


;;;;
;;;;flycheck
(global-flycheck-mode)

;;irony
;; If irony server was never installed, install it.
;(unless (irony--find-server-executable) (call-interactively #'irony-install-server))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

;; Use compilation database first, clang_complete as fallback.
(setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
                                                      irony-cdb-clang-complete))

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  
;; I use irony with company to get code completion.
(eval-after-load 'company '(add-to-list 'company-backends 'company-irony))

  ;; I use irony with flycheck to get real-time syntax checking.

      (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

  ;; Eldoc shows argument list of the function you are currently writing in the echo area.

(add-hook 'irony-mode-hook #'irony-eldoc)

;;;;; helm
;; Helm makes searching for anything nicer.
;; It works on top of many other commands / packages and gives them nice, flexible UI.
(require 'helm-config)

;; Use C-c h instead of default C-x c, it makes more sense.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(setq
 ;; move to end or beginning of source when reaching top or bottom of source.
 helm-move-to-line-cycle-in-source t
 ;; search for library in `require' and `declare-function' sexp.
 helm-ff-search-library-in-sexp t
 ;; scroll 8 lines other window using M-<next>/M-<prior>
 helm-scroll-amount 8
 helm-ff-file-name-history-use-recentf t
 helm-echo-input-in-header-line t)

(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)

;; TOOD: helm-semantic has not syntax coloring! How can I fix that?

;; Lists all occurences of a pattern in buffer.
;;(global-set-key (kbd "C-c h o") 'helm-occur)

(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

;; open helm buffer inside current window, not occupy whole other window
(setq helm-split-window-in-side-p t)
(setq helm-autoresize-max-height 50)
(setq helm-autoresize-min-height 30)
;;(helm-autoresize-mode 1)
(helm-mode 1)

(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "<backspace>") 'helm-find-files-up-one-level)
;;; projectile
(projectile-global-mode)

;;; Rtags
(require 'rtags)
(unless (rtags-executable-find "rc") (error "Binary rc is not installed"))
;;(unless (rtags-executable-find "rdm") (error "Binary rdm is not installed"))
(load-file "/home/omar/.emacs.d/rtags/src/rtags.el")
(set-variable 'rtags-path "/home/omar/.emacs.d/rtags/bin")

(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
(use-package rtags
  :ensure t
  :hook (c++-mode . rtags-start-process-unless-running)
  :config (setq ;rtags-completions-enabled t
;		rtags-path "home/omar/.emacs.d/rtags/src/rtags.el"
;		rtags-rc-binary-name "home/omar/.emacs.d/rtags/bin/rc"
		rtags-use-helm t
;		rtags-rdm-binary-name "home/omar/.emacs.d/rtags/bin/rdm"))
))
;; My own settings
;;(setq display-line-numbers-type t)
(global-display-line-numbers-mode)

(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a

;; Show-paren-mode settings
(show-paren-mode t) ;; включить выделение выражений между {},[],()
;(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
(electric-indent-mode 1) ;; ; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)
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

(global-set-key (kbd "<C-tab>") 'next-buffer)

(setq tab-width 4)
(global-visual-line-mode t)
(global-unset-key (kbd "S-<up>") )
(global-unset-key (kbd "S-<down>") )
(global-unset-key (kbd "S-<left>") )
(global-unset-key (kbd "S-<right>") )
(global-set-key (kbd "C-o") 'next-window-any-frame)
(setq treemacs-width 23)
(global-set-key (kbd "<f12>") 'treemacs)
(global-unset-key (kbd "M-;") )
(global-unset-key (kbd "M-:") )
(global-set-key (kbd "M-;") 'eval-expression)
(global-unset-key (kbd "M-!") )
(global-set-key (kbd "M-1") 'shell-command)

(tooltip-mode      1)
(menu-bar-mode 1) 
(tool-bar-mode     -1) ;; отключаем tool-bar
(scroll-bar-mode   -1) ;; отключаем полосу прокрутки

;;(blink-cursor-mode -1) ;; курсор не мигает
;;(setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
;;(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал

(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы  
(setq scroll-conservatively 10000)
;;(load-theme 'doom-dracula t)



;;; frame full path settings
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(interactive)
(message (buffer-file-name))

;; для рефакторинга кода
;;    Run M-x swiper-all type your regex, it will list all results, you can move with up/down to see a preview for each result.
;; Now press M-q and it will ask you what you want to replace the matches with, type it and press enter.
   ;; It will now walk you through an interactive replace, you can use  y/n/! on each, y to replace, n to skip, and ! to replace all without asking.

;;M-x swipper-all
;;набираешь то что необходимо заменить
;;M-q
;;набираешь то на что хочешь заменить
;;идет опрос типо тут надо а тут не надо нажимаешь для каждого у н или ! для всего


;;; Для настройки RTags
;;; клонируещь rtags в .emacs.d/
;;; собираешь в любую бин директорию видную в PATH(типо /usr/local/bin)
;;; в этой директории должно оказаться 4 файла rdm rc и т.д.
;;; заходишь в нужный проект и делаешь генеришь cmake с нужным флагом -DCMAKE_EXPORT_COMPILE_COMMANDS=1 в
;;;; необходимую тебе директорию(там окажется json и все остальное)
;;; запускаешь rdm &
;;; запускаешь rc -J в директории с jsonoм
;;; PROFIT

(defalias 'yes-or-no-p 'y-or-n-p)
