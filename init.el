(require 'package)

;; package-archivesを上書き
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ;;("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

;; 初期化
(package-initialize)
(setq scroll-step 1)
(electric-pair-mode 1)
(display-time)
(setq initial-scratch-message nil)
(global-linum-mode)
; (global-hl-line-mode)
(show-paren-mode t)
; (setq show-paren-style 'mixed)
(setq show-paren-style 'parenthesis)
; (setq show-paren-style 'expression)
; (set-face-background 'default "#303030")
(set-language-environment "Japanese")
;; バックアップファイルを作らない
(setq backup-inhibited t)
;; オートセーブファイルを作らない
(setq auto-save-dafault nil)
(load-theme 'tango-dark t)
(setq inhibit-startup-message t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-line-numbers-type 'relative)
 '(display-time-mode t)
 '(package-selected-packages
   '(chess evil-surround package-utils highlight-defined slime-company company-plisp company-c-headers company-jedi comby))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "HackGenNerd" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))
;; SBCLをデフォルトのCommon Lisp処理系に設定
(setq inferior-lisp-program "ros run")
;; ~/.emacs.d/slimeをload-pathに追加
(add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
;; SLIMEのロード
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner slime-company)) 

(require 'evil-surround)
(global-evil-surround-mode t)

;; Package Setting
(require 'company)

(setq company-idle-delay 0)
(setq company-selection-wrap-around t)
(require 'highlight-defined)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'lisp-mode-hook 'highlight-defined-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-defined-mode)

(require 'evil)
(evil-mode t)
(if (evil-mode)
    (progn
      (evil-define-key 'normal 'global
	"L" "$"
	"H" "0"
	"j" 'evil-next-visual-line
	"gj" 'evil-next-line
	"k" 'evil-previous-visual-line
	"gk" 'evil-previous-line
	" w" 'evil-window-map
	)
      (evil-define-key 'visual 'global
	"L" "$h"
	"H" "0"
	"j" 'evil-next-visual-line
	"gj" 'evil-next-line
	"k" 'evil-previous-visual-line
	"gk" 'evil-previous-line
	)
      (setq key-chord-two-keys-delay 2.0)
      (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
      (key-chord-mode 1))
  )

