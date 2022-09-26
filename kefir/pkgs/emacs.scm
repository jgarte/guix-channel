(define-module (kefir pkgs emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs-xyz))

(define-public emacs-stuff
  (package
    (name "emacs-stuff")
    (version "main")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/KefirTheAutomator/stuff")
	     (commit version)))
       (file-name (git-file-name name version))
       (sha256
	(base32 "0xlwvkpydgq0910ih20imvsx2figjs60licgqfg1f9z9ba2kjcb7"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-async))
    (arguments
     `(#:include '("\\.el$")))
    (home-page "https://github.com/KefirTheAutomator/stuff")
    (synopsis "my emacs package")
    (description "my emacs package")
    (license license:gpl3+)))
