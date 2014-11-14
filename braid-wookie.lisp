;;;; braid-wookie.lisp

(in-package #:braid-wookie)

(wookie:load-plugins)

(defvar *handler* nil)

(defun wookie-request-to-braid-request (request)
  "Converts a hunchentoot request object to a braid request."
  (braid:make-request (wookie:request-uri request) 
		     :method (wookie:request-method request) 
		     :headers (wookie:request-headers request)
		     :body (wookie:request-data request)))

(wookie:defroute (:get ".*") (req res)
	(let* ((fn
					(if (symbolp *handler*)
							(symbol-function *handler*)
							*handler*))
				 (response (funcall fn (wookie-request-to-braid-request req))))

		(wookie:send-response res
									 :status (braid:response-status-code response)
									 :headers (braid:message-headers response)
									 :body (braid:message-body response))))

(defun run-wookie (handler &key (bind nil) (port 8080))
  "Runs a Wookie web server to serve the given handler."

	(setf *handler* handler)
	
	;; start an event loop that catches errors (if error are not caught, they wind
	;; up in the REPL which means a non-responsive server!)
	(as:with-event-loop (:catch-app-errors t)
		;; create a listener object, and pass it to start-server, which starts Wookie
		(let* ((listener (make-instance 'wookie:listener
																		:bind nil
																		:port 8080))
					 ;; start it!!
					 (server (wookie:start-server listener)))
			;; stop server on ctrl+c
			(as:signal-handler 2
												 (lambda (sig)
													 (declare (ignore sig))
													 ;; remove our signal handler (or the event loop will just sit indefinitely)
													 (as:free-signal-handler 2)
													 ;; graceful stop...rejects all new connections, but lets current requests
													 ;; finish.
													 (as:close-tcp-server server))))))
	
(defun stop-wookie ()
  "Stops the Wookie web server."
  (cl-async:exit-event-loop))


