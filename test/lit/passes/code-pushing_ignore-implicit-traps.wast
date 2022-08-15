;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.
;; NOTE: This test was ported using port_passes_tests_to_lit.py and could be cleaned up.

;; RUN: foreach %s %t wasm-opt --code-pushing --ignore-implicit-traps -S -o - | filecheck %s

(module
  (memory 1)
  ;; CHECK:      (type $none_=>_none (func))

  ;; CHECK:      (type $none_=>_i32 (func (result i32)))

  ;; CHECK:      (memory $0 1)

  ;; CHECK:      (func $push1
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $push1
    (local $x i32)
    (block $out
      (local.set $x (i32.const 1))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $push2
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local $y i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $y
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $y)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $push2
    (local $x i32)
    (local $y i32)
    (block $out
      (local.set $x (i32.const 1))
      (local.set $y (i32.const 3))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
      (drop (local.get $y))
    )
  )
  ;; CHECK:      (func $push1-twice
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $push1-twice
    (local $x i32)
    (block $out
      (local.set $x (i32.const 1))
      (br_if $out (i32.const 2))
      (br_if $out (i32.const 3))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $push1-twiceb
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (nop)
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $push1-twiceb
    (local $x i32)
    (block $out
      (local.set $x (i32.const 1))
      (br_if $out (i32.const 2))
      (nop)
      (br_if $out (i32.const 3))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $push2-twice
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local $y i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $y
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $y)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $push2-twice
    (local $x i32)
    (local $y i32)
    (block $out
      (local.set $x (i32.const 1))
      (local.set $y (i32.const 3))
      (br_if $out (i32.const 2))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
      (drop (local.get $y))
    )
  )
  ;; CHECK:      (func $ignore-last
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $ignore-last
    (local $x i32)
    (block $out
      (local.set $x (i32.const 1))
      (br_if $out (i32.const 2))
    )
  )
  ;; CHECK:      (func $ignore-last2
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (nop)
  ;; CHECK-NEXT:   (nop)
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $ignore-last2
    (local $x i32)
    (block $out
      (local.set $x (i32.const 1))
      (nop)
      (nop)
      (br_if $out (i32.const 2))
    )
  )
  ;; CHECK:      (func $push-if
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (if
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:    (nop)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $push-if
    (local $x i32)
    (block $out
      (local.set $x (i32.const 1))
      (if (i32.const 2) (nop))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $push-dropped (result i32)
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out (result i32)
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (br_if $out
  ;; CHECK-NEXT:     (i32.const 2)
  ;; CHECK-NEXT:     (i32.const 3)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (i32.const 4)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $push-dropped (result i32)
    (local $x i32)
    (block $out (result i32)
      (local.set $x (i32.const 1))
      (drop (br_if $out (i32.const 2) (i32.const 3)))
      (drop (local.get $x))
      (i32.const 4)
    )
  )
  ;; CHECK:      (func $push-past-stuff
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (call $push-past-stuff)
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $push-past-stuff
    (local $x i32)
    (block $out
      (local.set $x (i32.const 1))
      (call $push-past-stuff)
      (drop (i32.const 1))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $fail-then-push
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local $y i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $y
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $y)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $fail-then-push
    (local $x i32)
    (local $y i32)
    (block $out
      (local.set $x (i32.const 1))
      (drop (local.get $x))
      (br_if $out (i32.const 2))
      (local.set $y (i32.const 1))
      (br_if $out (i32.const 3))
      (drop (local.get $x))
      (drop (local.get $y))
    )
  )
  ;; and now for stuff that should *not* be pushed
  ;; CHECK:      (func $used
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $used
    (local $x i32)
    (block $out
      (local.set $x (i32.const 1))
      (br_if $out (local.get $x))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $not-sfa
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local.set $x
  ;; CHECK-NEXT:   (i32.const 1)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $not-sfa
    (local $x i32)
    (local.set $x (i32.const 1))
    (block $out
      (local.set $x (i32.const 1))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $not-sfa2
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $x)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $not-sfa2
    (local $x i32)
    (drop (local.get $x))
    (block $out
      (local.set $x (i32.const 1))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $used-out
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $x)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $used-out
    (local $x i32)
    (block $out
      (local.set $x (i32.const 1))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
    )
    (drop (local.get $x))
  )
  ;; CHECK:      (func $value-might-interfere
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.load
  ;; CHECK-NEXT:     (i32.const 0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $value-might-interfere ;; but doesn't
    (local $x i32)
    (block $out
      (local.set $x (i32.load (i32.const 0)))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $value-interferes
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.load
  ;; CHECK-NEXT:     (i32.const 0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (i32.store
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $value-interferes
    (local $x i32)
    (block $out
      (local.set $x (i32.load (i32.const 0)))
      (i32.store (i32.const 1) (i32.const 3))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $value-interferes-accumulation
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.load
  ;; CHECK-NEXT:     (i32.const 0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (nop)
  ;; CHECK-NEXT:   (i32.store
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (nop)
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $value-interferes-accumulation
    (local $x i32)
    (block $out
      (local.set $x (i32.load (i32.const 0)))
      (nop)
      (i32.store (i32.const 1) (i32.const 3))
      (nop)
      (br_if $out (i32.const 2))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $value-interferes-in-pushpoint
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.load
  ;; CHECK-NEXT:     (i32.const 0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (if
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:    (call $value-interferes)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $value-interferes-in-pushpoint
    (local $x i32)
    (block $out
      (local.set $x (i32.load (i32.const 0)))
      (if (i32.const 1)
        (call $value-interferes)
      )
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $values-might-interfere
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local $y i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (call $push-dropped)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $y
  ;; CHECK-NEXT:    (call $push-dropped)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $y)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $values-might-interfere ;; they don't, as we keep the order - but here their side effects prevent pushing
    (local $x i32)
    (local $y i32)
    (block $out
      (local.set $x (call $push-dropped))
      (local.set $y (call $push-dropped))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
      (drop (local.get $y))
    )
  )
  ;; CHECK:      (func $unpushed-interferes
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local $y i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (call $push-dropped)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $y
  ;; CHECK-NEXT:    (call $push-dropped)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $y)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $y)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $unpushed-interferes
    (local $x i32)
    (local $y i32)
    (block $out
      (local.set $x (call $push-dropped))
      (local.set $y (call $push-dropped))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
      (drop (local.get $y))
    )
    (drop (local.get $y)) ;; $y can't be pushed, so x can't be
  )
  ;; CHECK:      (func $unpushed-ignorable
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local $y i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $y
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $y)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $x)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $unpushed-ignorable
    (local $x i32)
    (local $y i32)
    (block $out
      (local.set $x (i32.const 1))
      (local.set $y (i32.const 3))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
      (drop (local.get $y))
    )
    (drop (local.get $x)) ;; $x can't be pushed, but y doesn't care
  )
  ;; CHECK:      (func $unpushed-ignorable-side-effect
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (local $y i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (call $push-dropped)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (local.set $y
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $y)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $unpushed-ignorable-side-effect
    (local $x i32)
    (local $y i32)
    (block $out
      (local.set $x (call $push-dropped)) ;; $x can't be pushed, but y doesn't care
      (local.set $y (i32.const 3))
      (br_if $out (i32.const 2))
      (drop (local.get $x))
      (drop (local.get $y))
    )
  )
  ;; CHECK:      (func $unpushed-side-effect-into-drop
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (call $push-dropped)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $unpushed-side-effect-into-drop
    (local $x i32)
    (block $out
      (local.set $x (call $push-dropped))
      (br_if $out (i32.const 1))
      (drop (local.get $x))
    )
  )
  ;; CHECK:      (func $unpushed-side-effect-into-if
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (local.set $x
  ;; CHECK-NEXT:    (call $push-dropped)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (br_if $out
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (if
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:    (nop)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $unpushed-side-effect-into-if
    (local $x i32)
    (block $out
      (local.set $x (call $push-dropped))
      (br_if $out (i32.const 1))
      (if
        (local.get $x)
        (nop)
      )
    )
  )
)

