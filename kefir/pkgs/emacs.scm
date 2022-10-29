(define-module (kefir pkgs emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs-xyz))

(define-public emacs-stuff
  (let ((commit "7f6439098129bf77977913636bad23123e820c3b")
	(revision "1"))
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
	  (base32 "0h3va3znlv8j53zihmx9arsyzvngwvl304grqkrq4f10qasc2r72"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-async))
      (arguments
       `(#:include '("\\.el$")))
      (home-page "https://github.com/KefirTheAutomator/stuff")
      (synopsis "my emacs package")
      (description "my emacs package")
      (license license:gpl3+))))
