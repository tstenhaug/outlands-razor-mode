;;; razor-mode.el --- Simple mode for editing Razor scripts for Outlands -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Thomas Stenhaug
;;
;; Author: Thomas Stenhaug <thomas.stenhaug@gmail.com>
;; Maintainer: Thomas Stenhaug <thomas.stenhaug@gmail.com>
;; Created: November 07, 2022
;; Modified: November 07, 2022
;; Version: 0.0.1
;; Keywords: faces files languages
;; Homepage: https://github.com/tstenhaug/razor-mode
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;; Simple generic mode for editing Razor scripts with the Outlands dialect.
;;
;;; Code:

(defvar razor-mode-builtins
  '("alliance"
    "atlist"
    "attack"
    "bandaging"
    "cast"
    "classicuo"
    "clearall"
    "cleardragdrop"
    "clearignore"
    "clearhands"
    "cooldown"
    "counttype"
    "createlist"
    "createtimer"
    "dclick"
    "dclicktype"
    "dead"
    "diffhits"
    "diffmana"
    "diffstam"
    "diffweight"
    "dress"
    "drop"
    "droprelloc"
    "emote"
    "find"
    "findlayer"
    "findtype"
    "findtypelist"
    "followers"
    "getlabel"
    "guild"
    "gumpclose"
    "gumpexists"
    "hotkey"
    "hue"
    "ignore"
    "ingump"
    "inlist"
    "insysmsg"
    "interrupt"
    "invul"
    "lasttarget"
    "lifttype"
    "list"
    "listexists"
    "mana"
    "maxweight"
    "menu"
    "menuresponse"
    "music"
    "name"
    "noto"
    "organizer"
    "overhead"
    "pause"
    "potion"
    "promptresponse"
    "poplist"
    "pushlist"
    "random"
    "removelist"
    "removetimer"
    "rename"
    "restock"
    "say"
    "scavenger"
    "sell"
    "setability"
    "setskill"
    "settimer"
    "setvar"
    "skill"
    "sound"
    "stop"
    "sysmsg"
    "target"
    "targetexists"
    "targetrelloc"
    "targetloc"
    "targettype"
    "timer"
    "timerexists"
    "undress"
    "unignore"
    "unsetvar"
    "useonce"
    "varexist"
    "virtue"
    "warmode"
    "wait"
    "waitforgump"
    "waitformenu"
    "waitforprompt"
    "waitforsysmsg"
    "waitfortarget"
    "walk"
    "wft"
    "whisper"
    "yell"))

(defvar razor-mode-builtins-regexp
  (regexp-opt razor-mode-builtins 'words)
  "Regular expression used to highlight builtin words.")

(define-generic-mode
    'razor-mode
  '("#")
  '("if" "else" "elseif" "endif" "while" "endwhile" "for" "endfor" "not")
  (list '("\\('[^']+'\\)" 1 font-lock-string-face)
        (cons razor-mode-builtins-regexp 'font-lock-builtin-face)
        (cons "\\<\\([A-Z][A-Z0-9_]*\\)\\>" 'font-lock-constant-face))
  '("\\.razor$")
  '(highlight-numbers-mode)
  "A mode for editing ClassicUO Razor files, particularly the Outlands variant.")

(provide 'razor-mode)
;;; razor-mode.el ends here