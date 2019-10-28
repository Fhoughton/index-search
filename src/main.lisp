(setf lparallel:*kernel* (lparallel:make-kernel 4))

(defun get-file (filename)
  (with-open-file (stream filename)
    (loop for line = (read-line stream nil)
       while line
       collect line)))

(defun search-for-words-simple (lines wordlist)
  (declare (optimize (speed 3) (safety 0)) ;Add (debug 0) for even stronger optimisation, only do in build/release versions though : )
           (type list wordlist lines))
  (lparallel:premove-if-not (lambda (line)
                              (declare (type simple-string line))
                              (every (lambda (word)
                                       (declare (type simple-string word))
                                       (search word line))
                                     wordlist))
                            lines))

(defun starts-with (string prefix)
  (declare (optimize (speed 3) (safety 0))
           (type simple-string prefix string))
  (and (>= (length string)
           (length prefix))
       (string= prefix string :end2 (length prefix))))

(defun dosort (list substr)
(sort list
      (lambda (a b) (and a (not b)))
      :key #'(lambda (str) (starts-with str substr))))

(defun search-index (lines wordlist)
  (declare (optimize (speed 3) (safety 0)) ;Add (debug 0) for even stronger optimisation, only do in build/release versions though : )
           (type list wordlist lines))
  (let ((results (search-for-words-simple lines wordlist)))
    (setq wordlist (push (concatenate 'string (first wordlist) ".") wordlist))
    (loop for search in (nreverse wordlist)
         do (setq results (dosort results search)))
    results))

(defun handle-search (search)
  (search-index index (split-sequence #\Space search)))
