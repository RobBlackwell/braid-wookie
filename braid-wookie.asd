;;;; braid-wookie.asd

(asdf:defsystem #:braid-wookie
  :version "0.0.1"
  :author "Rob Blackwell"
  :description ""
  :serial t
  :depends-on (#:alexandria 
	       #:wookie
	       #:braid)
  :components ((:file "package")
	       (:file "braid-wookie")))
