{
  programs.xbindkeys.enable = true;

  programs.xbindkeys.config.guile = ''
;;======================================;;

(use-modules (ice-9 format))

;;======================================;;

(define (notify-send title message)

  (run-command
   (format #f "notify-send '~a' '~a'" title message)))

;;--------------------------------------;;

(define (sboosali-popup-date)

  (let ((DATE (date->string (current-date) "~A, ~B ~e ~Y ~H:~S"))
        )

  (notify-send "date" DATE)))

;;======================================;;

(xbindkey-function '(control alt shift d) sboosali-popup-date)

;;======================================;;
'';

}