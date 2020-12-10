
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("e9d8556b1ff87b4b5e7a3bda6c694601a9a8975661a4c20b818646af715d50a9" "9e26b1c101a24a24559022a5779d4256a3d8dc9bcfff7a15e7efdcaa50a396a2" default)))
 '(package-selected-packages
   (quote
    (irony yasnippet auto-complete smartparens slime tabbar session pod-mode org muttrc-mode mutt-alias markdown-mode initsplit htmlize graphviz-dot-mode folding eproject diminish csv-mode browse-kill-ring boxquote bm bar-cursor apache-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; System-type definition
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))
(defun system-is-windows()
  (string-equal system-type "windows-nt"))

;; Start Emacs as a server
(when (system-is-linux)
    (require 'server)
    (unless (server-running-p)
      (server-start))) ;; запустить Emacs как сервер, если ОС - GNU/Linux


(setq unix-init-path "~/.emacs.d/lisp")
(add-to-list 'load-path unix-init-path)

(setq show-paren-style 'expression)
(show-paren-mode 2)

(setq make-bakup-files  nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)

(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)
(require 'sr-speedbar)
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)
(add-to-list 'load-path
	     "~/.emacs.d/lisp/yasnippet")

(require 'yasnippet)

(yas-global-mode t)


(require 'cl)
(setq-default inferior-lisp-program "sbcl")
;;Package manager:
;; Initialise package and add Melpa repository
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(defvar required-packages '(slime
                            smartparens
                            auto-complete))

(defun packages-installed-p ()
  (loop for package in required-packages
        unless (package-installed-p package)
          do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  (package-refresh-contents)
  (dolist (package required-packages)
    (unless (package-installed-p package)
      (package-install package))))

(require 'smartparens-config)
(smartparens-global-mode)

;;(require 'auto-complete-config)
;;(ac-config-default)
;;(global-auto-complete-mode t)
;;(setq-default ac-auto-start t)
;;(setq-default ac-auto-show-menu t)
;;(defvar *sources* (list
;;		   'lisp-mode
;;		   'ac-source-semantic
;;		   'ac-source-functions
;;		   'ac-source-variables
;;		   'ac-source-dictionary
;;		   'ac-source-words-in-all-buffer
;;		   'ac-source-files-in-current-dir))
;;(let (source)
  ;;(dolist (source *sources*)
    ;;(add-to-list 'ac-sources source)))
;;(add-to-list 'ac-modes 'lisp-mode)

(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-asdf
	       slime-fancy
	       slime-indentation))
(setq-default slime-net-coding-system 'utf-8-unix)


(setq-default lisp-body-indent 2)


(setq-default lisp-indent-function 'common-lisp-indent-function)
(set-face-attribute 'default nil :height 135)



(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  ;;(open-line 1)
  ;;(next-line 1)
  ;;(yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)

(require 'imenu)
(setq imenu-auto-rescan      t) ;; автоматически обновлять список функций в буфере
(setq imenu-use-popup-menu nil) ;; диалоги Imenu только в минибуфере
(global-set-key (kbd "<f6>") 'imenu)


;; Inhibit startup/splash screen
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a

;; Show-paren-mode settings
(show-paren-mode t) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

;; Electric-modes settings
(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
(electric-indent-mode 1) ;; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)

(tooltip-mode      -1)
(menu-bar-mode -1) 
(tool-bar-mode     -1) ;; отключаем tool-bar
;;(scroll-bar-mode   -1) ;; отключаем полосу прокрутки
(blink-cursor-mode -1) ;; курсор не мигает
;;(setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал

(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы  
(setq scroll-conservatively 10000)

(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'shift))

(require 'cedet) ;; использую "вшитую" версию CEDET. Мне хватает...
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)
(semantic-mode   t)
(global-ede-mode t)
(require 'ede/generic)
(require 'semantic/ia)
(ede-enable-generic-projects)

(setq unix-init-ac-path      "~/.emacs.d/elpa/auto-complete-1.5.1")
    
(setq unix-init-ac-dict-path "~/.emacs.d/elpa/auto-complete-1.5.1/dict")
;; Auto-complete plugin <http://www.emacswiki.org/emacs/AutoComplete>

(defun ac-init()
  (require 'auto-complete-config)
  (ac-config-default)
  (add-to-list 'ac-dictionary-directories unix-init-ac-dict-path)
  (setq ac-auto-start        t)
  (setq ac-auto-show-menu    t)
  (global-auto-complete-mode t)
  (add-to-list 'ac-modes   'lisp-mode)
  (add-to-list 'ac-sources 'ac-source-semantic) ;; искать автодополнения в CEDET
  (add-to-list 'ac-sources 'ac-source-variables) ;; среди переменных
  (add-to-list 'ac-sources 'ac-source-functions) ;; в названиях функций
  (add-to-list 'ac-sources 'ac-source-dictionary) ;; в той папке где редактируемый буфер
  (add-to-list 'ac-sources 'ac-source-words-in-all-buffer) ;; по всему буферу
  (add-to-list 'ac-sources 'ac-source-files-in-current-dir))
(when (file-directory-p unix-init-ac-path)
  (add-to-list 'load-path unix-init-ac-path)
  (ac-init))

(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/9")
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(require 'iedit)

(semantic-mode 1)

(global-linum-mode 0)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'vscode-dark-plus)
