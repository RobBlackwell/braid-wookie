(ql:quickload "braid-wookie")

(defun my-handler (request) (braid:make-response :body "Hello World"))

(defun my-handler (request)
	;;(format t "~s" (braid:message-headers request))
	(braid:make-response :body (format nil "~s" (braid:message-headers request))))

(braid-wookie:run-wookie 'my-handler)

;; Now browse to 8080

