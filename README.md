braid-wookie
============

An adapter that allows Common Lisp braid middleware to be used with the
Wookie web server.

See
[braid](https://github.com/RobBlackwell/braid).

	(ql:quickload "braid-wookie")

	(defun my-handler (request) (braid:make-response :body "Hello World"))

	(braid-wookie:run-wookie 'my-handler)

	;; Now browse to 8080
	
THIS IS EXPERIMENTAL CODE THAT IS SUBJECT TO CHANGE. I welcome
feedback, but it's probably too early to consider including in
Quicklisp yet. That doesnt stop you trying it with quicklisp by using
[local-projects](http://www.quicklisp.org/beta/faq.html).

Rob Blackwell
November 2014

