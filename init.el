;;;
(require 'package)
;;;
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")
;;(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm))
  ;;(require 'setup-helm-gtags))
;;(require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)

(add-to-list 'load-path
             "~/.emacs.d/custom/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e9d8556b1ff87b4b5e7a3bda6c694601a9a8975661a4c20b818646af715d50a9" default)))
 '(package-selected-packages
   (quote
    (foo yasnippet-snippets sr-speedbar smartparens irony--compile-options company-irony company-c-headers company-go helm-gtags helm yasnippet volatile-highlights use-package iedit dtrt-indent counsel-projectile company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq speedbar-show-unknown-files t)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)

(add-to-list 'company-c-headers-path-system "/usr/include/c++/9" )
(add-to-list 'company-c-headers-path-system "/usr/include/boost")
(add-to-list 'company-c-headers-path-system "/usr/include/x86_64-linux-gnu/qt5/QtWidgets/")
;;(require 'qt-header)



(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)



(semantic-add-system-include "/usr/include/boost" 'c++-mode)
(semantic-add-system-include "/usr/include/c++/9" 'c++-mode)
(semantic-add-system-include "~/linux-5.7.4/kernel")
(semantic-add-system-include "~/linux-5.7.4/include")
(semantic-add-system-include "/usr/include/x86_64-linux-gnu/qt5/QtWidgets/"
                             'c++-mode)
(require 'ede)
(global-ede-mode)
(require 'semantic/ia)
(require 'semantic/bovine/c)

(setq qt-source-directory  "/home/omar/Qt/5.15.1/Src" 
      qt-include-directory "/usr/include/x86_64-linux-gnu/qt5" 
					     )
(add-to-list 'auto-mode-alist (cons qt-source-directory 'c++-mode))
(add-to-list 'auto-mode-alist (cons qt-include-directory 'c++-mode))

(dolist (file (directory-files qt-include-directory))
  (let ((path (expand-file-name file qt-include-directory)))
    (when (and (file-directory-p path) 
	       (not (or (equal file ".") (equal file ".."))))
      (progn
	(semantic-add-system-include path 'c++-mode)))))

(dolist (file (list "QtCore/qconfig.h" "QtCore/qconfig-bootsrapped.h"
                    "QtCore/qglobal.h"))
  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (expand-file-name file qt-include-directory)))

(print semantic-lex-c-preprocessor-symbol-file)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)


(global-semantic-idle-summary-mode 1)
(semantic-ia-complete-symbol 1)
(global-semantic-stickyfunc-mode 0)
;;(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)



;;
;;(use-package company-irony
 ;; :ensure t
  ;;:config
 ;; (require 'company)
  ;;(add-to-list 'company-backends 'company-irony))

;;(use-package irony  :ensure t :config  (add-hook 'c++-mode-hook 'irony-mode)  (add-hook 'c-mode-hook 'irony-mode)  (add-hook 'irony-mode-hook  'irony-cdb-autosetup-compile-options))

;;(with-eval-after-load 'company (add-hook 'c++-mode-hook 'company-mode)  (add-hook 'c-mode-hook 'company-mode))

(defvar required-packages '(smartparens))

  (require 'smartparens-config)
  (smartparens-global-mode)
(show-paren-mode t) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

;; Electric-modes settings
(electric-pair-mode    -1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
(electric-indent-mode  -1)

;; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)

(tooltip-mode      -1)
(menu-bar-mode -1)
(tool-bar-mode     -1) ;; отключаем tool-bar
(scroll-bar-mode   -1) ;; отключаем полосу прокрутки
(blink-cursor-mode -1) ;; курсор не мигает
(setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
;;(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал

(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы
(setq scroll-conservatively 10000)
(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'shift))



(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'vscode-dark-plus)


(setq show-paren-style 'expression)
(show-paren-mode 2)

(setq make-bakup-files  nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)

(defun duplicate-line()
     (interactive)
     (move-beginning-of-line 1)
     (kill-line)
     (yank)
     ;;(open-line 1)
     ;;(next-line 1)
     )
(global-unset-key (kbd "C-d") )

(global-set-key (kbd "C-d") 'duplicate-line)






(require 'imenu)

(setq imenu-auto-rescan      t) ;; автоматически обновлять список функций в буфере
(setq imenu-use-popup-menu nil) ;; диалоги Imenu только в минибуфере
(global-set-key (kbd "<f6>") 'imenu)


;; Inhibit startup/splash screen
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching 1)

(require 'sr-speedbar)
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)


;;(add-hook 'after-init-hook #'global-flycheck-mode)
;;(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))
(add-to-list 'helm-completing-read-handlers-alist '(org-capture . helm-org-completing-read-tags))
(add-to-list 'helm-completing-read-handlers-alist '(org-set-tags . helm-org-completing-read-tags))



;;(eval-after-load 'company
  ;;'(add-to-list
    ;;'company-backends '(company-yasnippet company-capf)))

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map [tab] 'company-complete-common-or-cycle)))
;; (setq company-selection t) <-- this doesn't make sense -- Dmitry
(setq company-idle-delay 0)
(put 'erase-buffer 'disabled nil)

(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)
(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas-minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(global-set-key [backtab] 'tab-indent-or-complete)
