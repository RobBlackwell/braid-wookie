(ql:quickload "braid-wookie")

(defun my-handler (request) (braid:make-response :body "Hello World"))

(braid-wookie:run-wookie 'my-handler)

;; Now browse to 8080

