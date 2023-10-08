(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(c-basic-offset 4)
 '(counsel-find-file-extern-extensions '("mp4" "mkv" "xlsx" "pcap" "pcapng"))
 '(custom-safe-themes
   '("0c6471dc1af916bfe2493300ddfec2d11c87e09d364e24b659a3c3de555c9e3d" "f0eb51d80f73b247eb03ab216f94e9f86177863fb7e48b44aacaddbfe3357cf1" "db5b906ccc66db25ccd23fc531a213a1afb500d717125d526d8ff67df768f2fc" "1ca05bdae217adeb636e9bc5e84c8f1d045be2c8004fafd5337d141d9b67a96f" "bd3b9675010d472170c5d540dded5c3d37d83b7c5414462737b60f44351fb3ed" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))
 '(grep-find-ignored-files
   '(".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "compile_commands.json"))
 '(helm-buffer-max-length 40)
 '(helm-grep-ignored-files
   '(".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "compile_commands.json"))
 '(history-delete-duplicates t)
 '(indent-tabs-mode t)
 '(lsp-clangd-binary-path "/usr/bin/clangd-13")
 '(lsp-clients-clangd-args
   '("--header-insertion=never" "--completion-style=detailed" "--limit-results=500" "--background-index" "--all-scopes-completion=1" "-j=6" "--clang-tidy=1"))
 '(lsp-imenu-sort-methods '(kind position))
 '(lsp-lens-enable t)
 '(lsp-semantic-tokens-apply-modifiers nil)
 '(lsp-semantic-tokens-enable t)
 '(lsp-ui-doc-show-with-cursor t)
 '(org-file-apps
   '((auto-mode . emacs)
     (directory . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default)
     ("\\.pcap\\'" . default)
     ("\\.pcapng\\'" . default)))
 '(package-selected-packages
   '(nasm-mode pcap-mode lsp-p4 p4 evil flycheck-clang-tidy dap-mode clojure-mode-extra-font-locking magit nix-mode counsel pyenv-mode exec-path-from-shell nix-sandbox log4j-mode flycheck-mypy flycheck-pyflakes poetry flycheck-pycheckers docker sudo-edit dired-ranger yasnippet-snippets pandoc nano-modeline nano-theme elpy exwm rtags aggressive-indent python-mode ipython-shell-send highlight-escape-sequences highlight-function-calls fira-code-mode vterm ibuffer-vc ibuffer-project highlight-operators highlight-parentheses project color-identifiers-mode company-posframe telega doom-modeline clang-format json-mode yaml-mode clojure-mode lsp-mode helm projectile company-box smart-mode-line sml-modeline go-mode lsp-ui cider flycheck company))
 '(project-vc-ignores '(".cache/*" "*.cache*" "compile_commands.json"))
 '(projectile-globally-ignored-directories
   '(".idea" ".vscode" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".ccls-cache" ".cache" ".clangd"))
 '(projectile-globally-ignored-file-suffixes '(".idx"))
 '(projectile-globally-ignored-files '("TAGS" "compile_commands.json"))
 '(show-paren-mode t)
 '(telega-company-tooltip-always-below nil)
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
	       [92 9])))
 '(widget-image-enable nil)
 '(x-underline-at-descent-line t))


;;; Package settings
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(setq package-selected-packages '(clojure-mode lsp-mode helm projectile all-the-icons 
					       company-box  smart-mode-line  sml-modeline go-mode lsp-ui
					       telega ivy
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

;;; projectile
(projectile-global-mode)


;;; Display

(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a

;; Show-paren-mode settings
(show-paren-mode t) ;; включить выделение выражений между {},[],()
;(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок



(setq auto-save-list-file-name nil)
(setq auto-save-default nil)

(global-set-key (kbd "C-,") (kbd "RET"))

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

(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
;;(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал


;;(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы  
(setq scroll-conservatively 10000)
;(load-theme 'nano-dark t)
(load-theme 'light-blue t)

(defalias 'yes-or-no-p 'y-or-n-p)

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
 '(default ((t (:family "Ricty Diminished" :foundry "PfEd" :slant normal :weight normal :height 148 :width normal))))
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
(setq telega-use-docker t)
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


(global-set-key (kbd "C-x b") 'helm-mini)

(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-set-key (kbd "C-=") 'hs-toggle-hiding)
(add-hook 'c-mode-hook 'hide-ifdef-mode)
(add-hook 'c++-mode-hook 'hide-ifdef-mode)
;;(add-hook 'c-mode-hook 'lsp-semantic-tokens-mode)
;;(add-hook 'c++-mode-hook 'lsp-semantic-tokens-mode)
;('font-lock-function-name-face)
    (use-package dap-mode
      :ensure t
      :config
      (require 'dap-lldb)
      (require 'dap-cpptools))

(add-hook 'c++-mode-hook (lambda () (setq comment-start "/* "
                                          comment-end   " */")))
(add-hook 'c-mode-hook (lambda () (setq comment-start "/* "
                                        comment-end   " */")))

(setq hs-special-modes-alist
      '((c-mode "[{[(]" "[)]}]" "/[*/]"  nil nil)
       (c++-mode "{" "}" "/[*/]" nil nil)
       (bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
       (java-mode "{" "}" "/[*/]" nil nil)
       (js-mode "{" "}" "/[*/]" nil)
       (mhtml-mode "{\\|<[^/>]*?" "}\\|</[^/>]*[^/]>" "<!--" mhtml-forward nil)))

