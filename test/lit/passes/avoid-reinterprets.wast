;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.
;; NOTE: This test was ported using port_passes_tests_to_lit.py and could be cleaned up.

;; RUN: foreach %s %t wasm-opt --avoid-reinterprets -S -o - | filecheck %s

(module
  (memory 1)
  ;; CHECK:      (type $none_=>_none (func))

  ;; CHECK:      (type $none_=>_f32 (func (result f32)))

  ;; CHECK:      (memory $0 1)

  ;; CHECK:      (func $simple
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (f32.load
  ;; CHECK-NEXT:    (i32.const 1024)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (i32.load
  ;; CHECK-NEXT:    (i32.const 1024)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (f64.load
  ;; CHECK-NEXT:    (i32.const 1024)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (i64.load
  ;; CHECK-NEXT:    (i32.const 1024)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $simple
    (drop (f32.reinterpret_i32 (i32.load (i32.const 1024))))
    (drop (i32.reinterpret_f32 (f32.load (i32.const 1024))))
    (drop (f64.reinterpret_i64 (i64.load (i32.const 1024))))
    (drop (i64.reinterpret_f64 (f64.load (i32.const 1024))))
  )
  ;; CHECK:      (func $one
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local $1 i32)
  ;; CHECK-NEXT:  (local $2 f32)
  ;; CHECK-NEXT:  (local.set $x
  ;; CHECK-NEXT:   (block (result i32)
  ;; CHECK-NEXT:    (local.set $1
  ;; CHECK-NEXT:     (i32.const 1024)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (local.set $2
  ;; CHECK-NEXT:     (f32.load
  ;; CHECK-NEXT:      (local.get $1)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (i32.load
  ;; CHECK-NEXT:     (local.get $1)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $2)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $one
    (local $x i32)
    (local.set $x (i32.load (i32.const 1024)))
    (drop (f32.reinterpret_i32 (local.get $x)))
  )
  ;; CHECK:      (func $one-b
  ;; CHECK-NEXT:  (local $x f32)
  ;; CHECK-NEXT:  (local $1 i32)
  ;; CHECK-NEXT:  (local $2 i32)
  ;; CHECK-NEXT:  (local.set $x
  ;; CHECK-NEXT:   (block (result f32)
  ;; CHECK-NEXT:    (local.set $1
  ;; CHECK-NEXT:     (i32.const 1024)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (local.set $2
  ;; CHECK-NEXT:     (i32.load
  ;; CHECK-NEXT:      (local.get $1)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (f32.load
  ;; CHECK-NEXT:     (local.get $1)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $2)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $one-b
    (local $x f32)
    (local.set $x (f32.load (i32.const 1024)))
    (drop (i32.reinterpret_f32 (local.get $x)))
  )
  ;; CHECK:      (func $both
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local $1 i32)
  ;; CHECK-NEXT:  (local $2 f32)
  ;; CHECK-NEXT:  (local.set $x
  ;; CHECK-NEXT:   (block (result i32)
  ;; CHECK-NEXT:    (local.set $1
  ;; CHECK-NEXT:     (i32.const 1024)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (local.set $2
  ;; CHECK-NEXT:     (f32.load
  ;; CHECK-NEXT:      (local.get $1)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (i32.load
  ;; CHECK-NEXT:     (local.get $1)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $2)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $2)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $both
    (local $x i32)
    (local.set $x (i32.load (i32.const 1024)))
    (drop (f32.reinterpret_i32 (local.get $x)))
    (drop (f32.reinterpret_i32 (local.get $x)))
  )
  ;; CHECK:      (func $half
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local $1 i32)
  ;; CHECK-NEXT:  (local $2 f32)
  ;; CHECK-NEXT:  (local.set $x
  ;; CHECK-NEXT:   (block (result i32)
  ;; CHECK-NEXT:    (local.set $1
  ;; CHECK-NEXT:     (i32.const 1024)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (local.set $2
  ;; CHECK-NEXT:     (f32.load
  ;; CHECK-NEXT:      (local.get $1)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (i32.load
  ;; CHECK-NEXT:     (local.get $1)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $x)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $2)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $half
    (local $x i32)
    (local.set $x (i32.load (i32.const 1024)))
    (drop (local.get $x))
    (drop (f32.reinterpret_i32 (local.get $x)))
  )
  ;; CHECK:      (func $copy
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local $y i32)
  ;; CHECK-NEXT:  (local $2 i32)
  ;; CHECK-NEXT:  (local $3 f32)
  ;; CHECK-NEXT:  (local.set $x
  ;; CHECK-NEXT:   (block (result i32)
  ;; CHECK-NEXT:    (local.set $2
  ;; CHECK-NEXT:     (i32.const 1024)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (local.set $3
  ;; CHECK-NEXT:     (f32.load
  ;; CHECK-NEXT:      (local.get $2)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (i32.load
  ;; CHECK-NEXT:     (local.get $2)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (local.set $y
  ;; CHECK-NEXT:   (local.get $x)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $3)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $copy
    (local $x i32)
    (local $y i32)
    (local.set $x (i32.load (i32.const 1024)))
    (local.set $y (local.get $x))
    (drop (f32.reinterpret_i32 (local.get $y)))
  )
  ;; CHECK:      (func $partial1 (result f32)
  ;; CHECK-NEXT:  (f32.reinterpret_i32
  ;; CHECK-NEXT:   (i32.load16_u
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $partial1 (result f32)
   (f32.reinterpret_i32
    (i32.load16_u
     (i32.const 3)
    )
   )
  )
  ;; CHECK:      (func $partial2 (result f32)
  ;; CHECK-NEXT:  (f32.reinterpret_i32
  ;; CHECK-NEXT:   (i32.load8_u
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $partial2 (result f32)
   (f32.reinterpret_i32
    (i32.load8_u
     (i32.const 3)
    )
   )
  )
  ;; CHECK:      (func $nofallthrough
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local.set $x
  ;; CHECK-NEXT:   (i32.load
  ;; CHECK-NEXT:    (i32.const 1024)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (f32.reinterpret_i32
  ;; CHECK-NEXT:    (block $a-name-avoids-fallthrough (result i32)
  ;; CHECK-NEXT:     (nop)
  ;; CHECK-NEXT:     (local.get $x)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $nofallthrough
    (local $x i32)
    (local.set $x
     (i32.load
      (i32.const 1024)
     )
    )
    (drop
     (f32.reinterpret_i32
      (block $a-name-avoids-fallthrough (result i32)
       (nop) ;; this would be removed by other opts, but in general, we can't
             ;; just look at the fallthrough, as we can't just remove code here
             ;; (note that we need a name on the block, or else we would look at
             ;; the fallthrough)
       (local.get $x)
      )
     )
    )
  )
)
