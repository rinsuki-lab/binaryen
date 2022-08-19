;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.
;; RUN: wasm-opt %s -all --generate-stack-ir --optimize-stack-ir --roundtrip -S -o - | filecheck %s
;; RUN: wasm-opt %s -all --generate-stack-ir --optimize-stack-ir --roundtrip --nominal -S -o - | filecheck %s --check-prefix NOMNL

(module
 (type ${i32} (struct (field i32)))
 ;; CHECK:      (export "export" (func $test))
 ;; NOMNL:      (export "export" (func $test))
 (export "export" (func $test))
 ;; CHECK:      (func $test
<<<<<<< HEAD
 ;; CHECK-NEXT:  (local $0 (ref $\7bi32\7d))
=======
 ;; CHECK-NEXT:  (local $0 (ref null $\7bi32\7d))
>>>>>>> origin/s-name
 ;; CHECK-NEXT:  (call $help
 ;; CHECK-NEXT:   (block (result (ref $\7bi32\7d))
 ;; CHECK-NEXT:    (local.set $0
 ;; CHECK-NEXT:     (struct.new_default $\7bi32\7d)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:    (nop)
<<<<<<< HEAD
 ;; CHECK-NEXT:    (local.get $0)
=======
 ;; CHECK-NEXT:    (ref.as_non_null
 ;; CHECK-NEXT:     (local.get $0)
 ;; CHECK-NEXT:    )
>>>>>>> origin/s-name
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 1)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 ;; NOMNL:      (func $test (type $none_=>_none)
<<<<<<< HEAD
 ;; NOMNL-NEXT:  (local $0 (ref $\7bi32\7d))
=======
 ;; NOMNL-NEXT:  (local $0 (ref null $\7bi32\7d))
>>>>>>> origin/s-name
 ;; NOMNL-NEXT:  (call $help
 ;; NOMNL-NEXT:   (block (result (ref $\7bi32\7d))
 ;; NOMNL-NEXT:    (local.set $0
 ;; NOMNL-NEXT:     (struct.new_default $\7bi32\7d)
 ;; NOMNL-NEXT:    )
 ;; NOMNL-NEXT:    (nop)
<<<<<<< HEAD
 ;; NOMNL-NEXT:    (local.get $0)
=======
 ;; NOMNL-NEXT:    (ref.as_non_null
 ;; NOMNL-NEXT:     (local.get $0)
 ;; NOMNL-NEXT:    )
>>>>>>> origin/s-name
 ;; NOMNL-NEXT:   )
 ;; NOMNL-NEXT:   (i32.const 1)
 ;; NOMNL-NEXT:  )
 ;; NOMNL-NEXT: )
 (func $test
  (call $help
   (struct.new_default ${i32})
   ;; Stack IR optimizations can remove this block, leaving a nop in an odd
   ;; "stacky" location. On load, we will use a local to work around that. It
   ;; is fine for the local to be non-nullable since the get is later in that
   ;; same block.
   (block (result i32)
    (nop)
    (i32.const 1)
   )
  )
 )
 ;; CHECK:      (func $help (param $3 (ref $\7bi32\7d)) (param $4 i32)
 ;; CHECK-NEXT:  (nop)
 ;; CHECK-NEXT: )
 ;; NOMNL:      (func $help (type $ref|$\7bi32\7d|_i32_=>_none) (param $3 (ref $\7bi32\7d)) (param $4 i32)
 ;; NOMNL-NEXT:  (nop)
 ;; NOMNL-NEXT: )
 (func $help (param $3 (ref ${i32})) (param $4 i32)
  (nop)
 )
)
