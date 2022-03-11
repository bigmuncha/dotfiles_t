(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 8)
 '(counsel-find-file-extern-extensions '("mp4" "mkv" "xlsx" "pcap" "pcapng"))
 '(custom-safe-themes
   '("1ca05bdae217adeb636e9bc5e84c8f1d045be2c8004fafd5337d141d9b67a96f" "bd3b9675010d472170c5d540dded5c3d37d83b7c5414462737b60f44351fb3ed" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))
 '(grep-find-ignored-files
   '(".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "compile_commands.json"))
 '(helm-buffer-max-length 40)
 '(helm-grep-ignored-files
   '(".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "compile_commands.json"))
 '(history-delete-duplicates t)
 '(lsp-clangd-binary-path "/usr/bin/clangd")
 '(lsp-clients-clangd-args
   '("--header-insertion=never" "--completion-style=detailed" "--limit-results=500" "--background-index=1" "--all-scopes-completion=1"))
 '(lsp-imenu-sort-methods '(kind position))
 '(lsp-lens-enable t)
 '(lsp-semantic-tokens-apply-modifiers nil)
 '(lsp-semantic-tokens-enable t)
 '(org-file-apps
   '((auto-mode . emacs)
     (directory . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default)
     ("\\.pcap\\'" . default)
     ("\\.pcapng\\'" . default)))
 '(package-selected-packages
   '(magit nix-mode counsel pyenv-mode exec-path-from-shell nix-sandbox log4j-mode flycheck-mypy flycheck-pyflakes poetry flycheck-pycheckers docker sudo-edit dired-ranger yasnippet-snippets pandoc nano-modeline nano-theme elpy exwm rtags aggressive-indent python-mode ipython-shell-send highlight-escape-sequences highlight-function-calls fira-code-mode vterm ibuffer-vc ibuffer-project highlight-operators highlight-parentheses project color-identifiers-mode company-posframe telega doom-modeline clang-format json-mode yaml-mode clojure-mode lsp-mode helm projectile company-box smart-mode-line sml-modeline go-mode lsp-ui cider flycheck company))
 '(project-vc-ignores '(".cache/*" "*.cache*" "compile_commands.json" "lldpv2"))
 '(projectile-globally-ignored-directories
   '(".idea" ".vscode" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".ccls-cache" ".cache" ".clangd" "lldpv2"))
 '(projectile-globally-ignored-file-suffixes '(".idx" "lldpv2"))
 '(projectile-globally-ignored-files '("TAGS" "compile_commands.json" "lldpv2"))
 '(show-paren-mode t)
 '(telega-company-tooltip-always-below nil)
 '(telega-server-libs-prefix "/home/omar/td/tdlib/")
 '(tool-bar-mode nil)
 '(whitespace-display-mappings
   '((space-mark 32
		 [183]
		 [46])
     (space-mark 160
		 [164]
		 [95])
     (newline-mark 32
		   [36])
     (tab-mark 9
	       [124 9]
	       [92 9]))))


;;; Package settings
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(setq package-selected-packages '(clojure-mode lsp-mode helm projectile
					       company-box  smart-mode-line  sml-modeline go-mode lsp-ui
					       cider lsp-treemacs flycheck company ))


;;; Clojure settings
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)
(eval-after-load 'clojure-mode '(require 'clojure-mode-extra-font-locking))
(setq lsp-clojure-custom-server-command '("bash" "-c" "~/.emacs.d/clojure-lsp"))

;;; Company
(add-hook 'prog-mode-hook 'company-mode)
;;(global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
(setq company-idle-delay 0)
(setq company-global-modes '(not shell-mode))
 
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
;;;;
;;;flycheck
;;(global-flycheck-mode)
;(require 'helm-config)

;; ;;; Helm
;;  (setq ;;to end or beginning of source when reaching top or bottom of source.
;; ;  helm-move-to-line-cycle-in-source t
;;   ;; search for library in `require' and `declare-function' sexp.
;;   helm-ff-search-library-in-sexp t
;; ;;  ;; scroll 8 lines other window using M-<next>/M-<prior>
;;   helm-scroll-amount 8
;;   helm-ff-file-name-history-use-recentf t
;;   helm-echo-input-in-header-line t)

 ;(global-set-key (kbd "M-x") 'helm-M-x)
;; (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)

;;  (setq helm-buffers-fuzzy-matching t
;;        helm-recentf-fuzzy-match t)

;; (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

;open helm buffer inside current window, not occupy whole other window
;; (setq helm-split-window-in-side-p t)
;; (setq helm-autoresize-max-height 50)
;; (setq helm-autoresize-min-height 30)
;; (helm-autoresize-mode 1)
;; (helm-mode 1)
;; (add-hook 'prog-mode-hook 'line-number-mode)
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; (add-hook 'yaml-mode-hook 'display-line-numbers-mode)
;(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

;(define-key helm-find-files-map (kbd "<backspace>") 'helm-find-files-up-one-level)
;;(define-key helm- (kbd "TAB") 'helm-execute-persistent-action)

;;; projectile
(projectile-global-mode)


;;; Display
;;(ad)(global-display-line-numbers-mode)

(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a

;; Show-paren-mode settings
(show-paren-mode t) ;; включить выделение выражений между {},[],()
;(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
;;(electric-indent-mode 1) ;; ; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)


(setq auto-save-list-file-name nil)
(setq auto-save-default nil)

(global-set-key (kbd "C-,") (kbd "RET"))
;;(global-set-key (kbd "C--") (kbd "C-/"))
(global-unset-key "\C-z")
(global-set-key "\C-z" 'advertised-undo)

(global-set-key (kbd "<C-tab>") 'next-buffer)
(setq tab-width 8)

(global-unset-key (kbd "S-<up>") )
(global-unset-key (kbd "S-<down>") )
(global-unset-key (kbd "S-<left>") ) 
(global-unset-key (kbd "S-<right>") )
(global-set-key (kbd "C-o") 'next-multiframe-window)

(setq window-size-fixed nil)

(global-unset-key (kbd "M-;") )
(global-unset-key (kbd "M-:") )
(global-set-key (kbd "M-;") 'eval-expression)
(global-unset-key (kbd "M-!") )
(global-set-key (kbd "M-1") 'shell-command)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(define-key ibuffer--filter-map (kbd "C-o") 'next-multiframe-window)

(tooltip-mode      1)
(menu-bar-mode 1) 
(tool-bar-mode     -1) ;; отключаем tool-bar

;;(blink-cursor-mode -1) ;; курсор не мигает
;;(setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
;;(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал


;;(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы  
(setq scroll-conservatively 10000)
;(load-theme 'nano-dark t)
(load-theme 'light-blue t)
;; для рефакторинга кода
;;    Run M-x swiper-all type your regex, it will list all results, you can move with up/down to see a preview for each result.
;; Now press M-q and it will ask you what you want to replace the matches with, type it and press enter.
   ;; It will now walk you through an interactive replace, you can use  y/n/! on each, y to replace, n to skip, and ! to replace all without asking.

;;M-x swipper-all
;;набираешь то что необходимо заменить
;;M-q
;;набираешь то на что хочешь заменить
;;идет опрос типо тут надо а тут не надо нажимаешь для каждого у н или ! для всего

(defalias 'yes-or-no-p 'y-or-n-p)



;; (defun next-code-buffer ()
;;   (interactive)
;;   (let (( bread-crumb (buffer-name) ))
;;     (next-buffer)
;;     (while
;;         (and
;; 	 (string-match-p "^\*" (buffer-name))

;;          (not ( equal bread-crumb (buffer-name) )) )
;;       (next-buffer))))
;; (global-set-key [remap next-buffer] 'next-code-buffer)

 (defface font-lock-func-face 
     '((nil (:foreground "#7F0055" :weight bold))
       (t (:bold t :italic t)))
   "Font Lock mode face used for function calls."
   :group 'font-lock-highlighting-faces)

;; (font-lock-add-keywords 
;;   'emacs-lisp-mode
;;   '(("(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)\\_>"
;;      1 'font-lock-func-face)))


;;backup files

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty Diminished" :foundry "PfEd" :slant normal :weight normal :height 128 :width normal))))
 '(lsp-face-semhl-function ((t (:inherit font-lock-keyword-face))))
 '(lsp-face-semhl-implementation ((t (:inherit font-lock-keyword-face :weight bold))))
 '(lsp-face-semhl-macro ((t (:inherit font-lock-keyword-face))))
 '(lsp-face-semhl-member ((t nil)))
 '(lsp-face-semhl-method ((t (:inherit font-lock-keyword-face))))
 '(lsp-face-semhl-parameter ((t (:inherit font-lock-variable-name-face))))
 '(lsp-face-semhl-property ((t nil)))
 '(lsp-face-semhl-variable ((t nil)))
 '(whitespace-empty ((t (:foreground "firebrick"))))
 '(whitespace-indentation ((t (:foreground "deep sky blue"))))
 '(whitespace-line ((t nil)))
 '(whitespace-newline ((t (:foreground "yellow" :weight normal))))
 '(whitespace-space ((t (:foreground "deep sky blue"))))
 '(whitespace-space-after-tab ((t (:foreground "firebrick"))))
 '(whitespace-tab ((t (:foreground "gainsboro")))))


;;; Treemacs
;;(add-hook 'prog-mode-hook (lambda () (idle-highlight-mode t)))
;(add-hook 'treemacs-mode-hook (lambda () (text-scale-decrease 2)))
(add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1)))

(global-set-key (kbd "<f10>") 'treemacs)

(setq treemacs-width 23)
(setq treemacs-width-is-initially-locked nil)

;;(set-window-scroll-bars 'treemacs-window nil)
 (font-lock-add-keywords 'c-mode
			'(("\\<\\([a-z1-9A-Z_]*\\) *("  1 font-lock-keyword-face)))
 (font-lock-add-keywords 'c++-mode
			'(("\\<\\([a-z1-9A-Z_]*\\) *("  1 font-lock-keyword-face)))

; (global-set-key (kbd "<f12>") 'helm-etags-select)
 (global-set-key (kbd "M-/") 'xref-find-references)

;; (setq c-default-style "bsd"
;;       c-basic-offset 8)

(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(put 'upcase-region 'disabled nil)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))
 ; one line at a time
(setq mouse-wheel-progressive-speed nil)            ; don't accelerate scrolling
(setq-default smooth-scroll-margin 0)
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 100000)
(setq backup-directory-alist
      '((".*" . "~/.emacs.d/backups/")))

(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/backups/" t)))

(setq create-lockfiles nil)
(fringe-mode '(8 . 0))


(require 'lsp-ui)
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
;;(doom-modeline-mode t)
;;(setq doom-modeline-height 20)
(smart-mode-line-enable t)
;;(load "/usr/share/emacs/site-lisp/clang-format-12/clang-format.el")
;;(global-set-key [C-M-tab] 'clang-format-region)
;;(setq indent-tabs-mode nil)
(setq show-trailing-whitespace t)

;;;; LSP
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
     lsp-lens-enable t
     lsp-signature-auto-activate nil
     lsp-ui-doc-include-signature t
					; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
					; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
      )
(require 'lsp-clangd)
;;(setq lsp-clients-clangd-args "--header-insertion-decorators=0"
;;			       "--background-index")
(setq load-prefer-newer t)

(setq c-default-style "linux"
          c-basic-offset 4)
 ;; (require 'cc-mode)
 ;;    (add-to-list 'c-mode-common-hook
 ;;      (lambda () (setq c-syntactic-indentation nil)))
;;(define-key  (kbd "TAB") 'clang-format-region)

(when (display-graphic-p)
  (require 'all-the-icons))
;; or
(use-package all-the-icons
  :if (display-graphic-p))
(setq company-posframe-mode t)

(add-hook 'c++-mode-hook 'highlight-operators-mode)
(add-hook 'c-mode-hook 'highlight-operators-mode)
(add-to-list 'auto-mode-alist '("\\.def\\'" . c-mode))
;(highlight-function-calls-mode t)
(line-number-mode 1)

(setq whitespace-style
      '(face
	tabs spaces trailing lines space-before-tab 
	indentation empty space-after-tab
	space-mark tab-mark ))
(add-hook 'prog-mode-hook 'whitespace-mode)
;;(global-visual-line-mode t)
(add-hook 'prog-mode-hook 'visual-line-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'telega-root-mode-hook 'visual-line-mode)
(setq telega-chat--display-buffer-action
       '((display-buffer-reuse-window
	  display-buffer-use-some-window)))

(require 'telega)
(define-key  telega-root-mode-map (kbd "<mouse-1>") #'push-button)
(define-key  telega-chat-mode-map (kbd "<mouse-1>") #'push-button)

(telega-appindicator-mode 1)
(add-hook 'telega-active-locations-mode-hook 'visual-line-mode
	  )
(add-hook 'telega-root-mode-hook 'visual-line-mode)
(add-hook 'telega-chat-mode-hook 'visual-line-mode)
(setcdr (assq t org-file-apps-gnu) 'browse-url-xdg-open)
(setq telega-open-file-function 'org-open-file)

(global-set-key (kbd "M-m") 'projectile-grep)

(ivy-mode 1)
;(setq ivy-use-virtual-buffers t)
;(setq ivy-count-format "(%d/%d) ")
					;(global-set-key (kbd "M-x") 'counsel-M-x)
 (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(setq doc-view-continuous t)
(add-hook 'c++-mode-hook 'yas-minor-mode)
(add-hook 'c-mode-hook 'yas-minor-mode)
(global-set-key (kbd "M-s") 'swiper)

(use-package log4j-mode
  :ensure t
  :disabled t
  :init
  (add-hook #'log4j-mode-hook #'view-mode)
  (add-hook #'log4j-mode-hook #'read-only-mode)
  (add-hook #'log4j-mode-hook 'eos/turn-on-hl-line))
(use-package view
  :config
  (defun View-goto-line-last (&optional line)
    "goto last line"
    (interactive "P")
    (goto-line (line-number-at-pos (point-max))))

  (define-key view-mode-map (kbd "e") 'View-scroll-half-page-forward)
  (define-key view-mode-map (kbd "u") 'View-scroll-half-page-backward)

  ;; less like
  (define-key view-mode-map (kbd "N") 'View-search-last-regexp-backward)
  (define-key view-mode-map (kbd "?") 'View-search-regexp-backward?)
  (define-key view-mode-map (kbd "g") 'View-goto-line)
  (define-key view-mode-map (kbd "G") 'View-goto-line-last)
  ;; vi/w3m like
  (define-key view-mode-map (kbd "h") 'backward-char)
  (define-key view-mode-map (kbd "j") 'next-line)
  (define-key view-mode-map (kbd "k") 'previous-line)
  (define-key view-mode-map (kbd "l") 'forward-char))
(set-default 'truncate-lines t)

;; activate all packages

;; fetch the list of packages available

;; define list of packages to install
;; (defvar myPackages
;;   '(exec-path-from-shell
;;     elpy
;;     pyenv-mode))

;; ;; install all packages in list
;; (mapc #'(lambda (package)
;;     (unless (package-installed-p package)
;;       (package-install package)))
;;       myPackages)

;; ;; Use shell's $PATH
;; (exec-path-from-shell-copy-env "PATH")
;; (elpy-enable)
;; (pyenv-mode)
;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "-i --simple-prompt")

(global-set-key (kbd "C-x b") 'helm-mini)
;; (defun buffer-binary-p (&optional buffer)
;;   "Return whether BUFFER or the current buffer is binary.

;; A binary buffer is defined as containing at least on null byte.

;; Returns either nil, or the position of the first null byte."
;;   (with-current-buffer (or buffer (current-buffer))
;;     (save-excursion
;;       (goto-char (point-min))
;;       (search-forward (string ?\x00) nil t 1))))

;; (defun hexl-if-binary ()
;;   "If `hexl-mode' is not already active, and the current buffer
;; is binary, activate `hexl-mode'."
;;   (interactive)
;;   (unless (eq major-mode 'hexl-mode)
;;     (when (buffer-binary-p)
;;       (hexl-mode))))

;;(add-hook 'find-file-hooks 'hexl-if-binary)
;; (defun counsel-locate-action-extern (x)
;;   "Use xdg-open shell command on X."
;;   (call-process shell-file-name nil
;;                 nil nil
;;                 shell-command-switch
;;                 (format "%s %s"
;;                         (if (eq system-type 'darwin)
;;                             "open"
;;                           "xdg-open")
;;                         (shell-quote-argument x))))

(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-set-key (kbd "C-=") 'hs-toggle-hiding)
;(add-hook 'c-mode-hook 'hide-ifdef-mode)
;(add-hook 'c++-mode-hook 'hide-ifdef-mode)
;(add-hook 'c-mode-hook 'lsp-semantic-tokens-mode)
;(add-hook 'c++-mode-hook 'lsp-semantic-tokens-mode)
;('font-lock-function-name-face)
