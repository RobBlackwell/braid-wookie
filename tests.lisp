(ql:quickload "braid-wookie")

(defun my-request-handler (request) (braid:make-response :body "Hello World from Braid Wookie."))

(defun test1 ()
	(braid-wookie:run-wookie 'my-request-handler))

;; (test1)
;; Now browse to 8080

