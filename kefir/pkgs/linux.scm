(define-module (kefir pkgs linux)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages linux))

(define (linux-urls version)
  "Return a list of URLS for Linux VERSION."
  (list (string-append "https://www.kernel.org/pub/linux/kernel/v"
                       (version-major version) ".x/linux-" version ".tar.xz")))

(define* (corrupt-linux kernel version hash #:key (name "kefir-linux"))
  (package
    (inherit kernel)
    (name name)
    (version version)
    (source (origin
              (method url-fetch)
              (uri (linux-urls version))
              (sha256 (base32 hash))))
    (home-page "https://www.kernel.org/")
    (synopsis "Linux kernel with nonfree binary blobs included")
    (description
     "The unmodified Linux kernel, including nonfree blobs, for running Guix
System on hardware which requires nonfree software to function.")))

(define-public kefir-linux-6.0
  (corrupt-linux linux-libre-6.0 "6.0.7"
                 "03srfv33r2vc48h051zicvn9hz78kc08vh7ljzlmcnk0g0mwrnk7"))
