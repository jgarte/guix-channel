(define-module (kefir misc base)
  #:use-module (kefir pkgs emacs)
  #:use-module (gnu system)
  #:use-module (gnu packages)
  #:export (%kefir-system-packages))

(define %kefir-system-packages
  (append
   %base-packages
   (map (compose list specification->package+output)
	'("git"
	  "git:send-email"
	  "xrandr"
	  "openssh"
	  "emacs"
	  "emacs-exwm"
	  "emacs-async"
	  "nss-certs"))))
