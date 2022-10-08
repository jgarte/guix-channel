(define-module (kefir pkgs emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz))

(define-public emacs-stuff
  (let ((commit "9e279f37e99f1d46d0f0a1710d488bbab31c3567")
		(revision "0"))
	(package
      (name "emacs-stuff")
	  (version (git-version "0.1" revision commit))
      (source
       (origin
		 (method git-fetch)
		 (uri (git-reference
			   (url "https://github.com/KefirTheAutomator/stuff")
			   (commit commit)))
		 (file-name (git-file-name name version))
		 (sha256
		  (base32 "1w43155rxp992i7y034lrxm74gf4zx9v6d79h3xj56j5h7nnnn2v"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-async emacs-guix  emacs-eglot emacs-company
			 python python-lsp-server))
      (arguments
       `(#:include '("\\.el$")))
      (home-page "https://github.com/KefirTheAutomator/stuff")
      (synopsis "my emacs package")
      (description "my emacs package")
      (license license:gpl3+))))
