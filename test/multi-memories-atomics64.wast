(module
 (type $0 (func))
 (memory $appMemory (shared i64 23 256))
 (memory $dataMemory (shared i64 23 256))
 (memory $instrumentMemory (shared i64 23 256))
 (func $atomic-loadstore
  (local $0 i64)
  (local $1 i64)
  (local $2 i32)
  (drop
   (i32.atomic.load8_u $appMemory offset=4
    (local.get $0)
   )
  )
  (drop
   (i32.atomic.load8_u $appMemory offset=4
    (local.get $0)
   )
  )
  (drop
   (i32.atomic.load16_u $dataMemory offset=4
    (local.get $0)
   )
  )
  (drop
   (i32.atomic.load16_u $instrumentMemory offset=4
    (local.get $0)
   )
  )
  (drop
   (i32.atomic.load $dataMemory offset=4
    (local.get $0)
   )
  )
  (drop
   (i32.atomic.load $appMemory offset=4
    (local.get $0)
   )
  )
  (drop
   (i64.atomic.load8_u $appMemory
    (local.get $0)
   )
  )
  (drop
   (i64.atomic.load8_u $dataMemory
    (local.get $0)
   )
  )
  (drop
   (i64.atomic.load16_u $appMemory
    (local.get $0)
   )
  )
  (drop
   (i64.atomic.load16_u $appMemory
    (local.get $0)
   )
  )
  (drop
   (i64.atomic.load32_u $instrumentMemory
    (local.get $0)
   )
  )
  (drop
   (i64.atomic.load32_u $appMemory
    (local.get $0)
   )
  )
  (drop
   (i64.atomic.load $appMemory
    (local.get $0)
   )
  )
  (drop
   (i64.atomic.load $instrumentMemory
    (local.get $0)
   )
  )
  (i32.atomic.store $appMemory offset=4
   (local.get $0)
   (local.get $2)
  )
  (i32.atomic.store $appMemory offset=4
   (local.get $0)
   (local.get $2)
  )
  (i32.atomic.store8 $instrumentMemory offset=4
   (local.get $0)
   (local.get $2)
  )
  (i32.atomic.store8 $dataMemory offset=4
   (local.get $0)
   (local.get $2)
  )
  (i32.atomic.store16 $appMemory offset=4
   (local.get $0)
   (local.get $2)
  )
  (i32.atomic.store16 $dataMemory offset=4
   (local.get $0)
   (local.get $2)
  )
  (i64.atomic.store $appMemory offset=4
   (local.get $0)
   (local.get $1)
  )
  (i64.atomic.store $appMemory offset=4
   (local.get $0)
   (local.get $1)
  )
  (i64.atomic.store8 $dataMemory offset=4
   (local.get $0)
   (local.get $1)
  )
  (i64.atomic.store8 $instrumentMemory offset=4
   (local.get $0)
   (local.get $1)
  )
  (i64.atomic.store16 $appMemory offset=4
   (local.get $0)
   (local.get $1)
  )
  (i64.atomic.store16 $appMemory offset=4
   (local.get $0)
   (local.get $1)
  )
  (i64.atomic.store32 $instrumentMemory offset=4
   (local.get $0)
   (local.get $1)
  )
  (i64.atomic.store32 $dataMemory offset=4
   (local.get $0)
   (local.get $1)
  )
 )
 (func $atomic-rmw
  (local $0 i64)
  (local $1 i64)
  (local $2 i32)
  (drop
   (i32.atomic.rmw.add $dataMemory offset=4
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (i32.atomic.rmw.add $instrumentMemory offset=4
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (i32.atomic.rmw8.add_u $appMemory offset=4
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (i32.atomic.rmw8.add_u $appMemory offset=4
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (i32.atomic.rmw16.and_u $dataMemory
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (i32.atomic.rmw16.and_u $instrumentMemory
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (i64.atomic.rmw32.or_u $appMemory
    (local.get $0)
    (local.get $1)
   )
  )
  (drop
   (i64.atomic.rmw32.or_u $appMemory
    (local.get $0)
    (local.get $1)
   )
  )
  (drop
   (i32.atomic.rmw8.xchg_u $appMemory
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (i32.atomic.rmw8.xchg_u $dataMemory
    (local.get $0)
    (local.get $2)
   )
  )
 )
 (func $atomic-cmpxchg
  (local $0 i64)
  (local $1 i64)
  (local $2 i32)
  (drop
   (i32.atomic.rmw.cmpxchg $appMemory offset=4
    (local.get $0)
    (local.get $2)
    (local.get $2)
   )
  )
  (drop
   (i32.atomic.rmw.cmpxchg $instrumentMemory offset=4
    (local.get $0)
    (local.get $2)
    (local.get $2)
   )
  )
  (drop
   (i32.atomic.rmw8.cmpxchg_u $appMemory
    (local.get $0)
    (local.get $2)
    (local.get $2)
   )
  )
  (drop
   (i32.atomic.rmw8.cmpxchg_u $appMemory
    (local.get $0)
    (local.get $2)
    (local.get $2)
   )
  )
  (drop
   (i64.atomic.rmw.cmpxchg $appMemory offset=4
    (local.get $0)
    (local.get $1)
    (local.get $1)
   )
  )
  (drop
   (i64.atomic.rmw.cmpxchg $dataMemory offset=4
    (local.get $0)
    (local.get $1)
    (local.get $1)
   )
  )
  (drop
   (i64.atomic.rmw32.cmpxchg_u $instrumentMemory
    (local.get $0)
    (local.get $1)
    (local.get $1)
   )
  )
  (drop
   (i64.atomic.rmw32.cmpxchg_u $dataMemory
    (local.get $0)
    (local.get $1)
    (local.get $1)
   )
  )
 )
 (func $atomic-wait-notify
  (local $0 i64)
  (local $1 i64)
  (local $2 i32)
  (drop
   (memory.atomic.wait32 $dataMemory
    (local.get $0)
    (local.get $2)
    (local.get $1)
   )
  )
  (drop
   (memory.atomic.wait32 $instrumentMemory
    (local.get $0)
    (local.get $2)
    (local.get $1)
   )
  )
  (drop
   (memory.atomic.wait32 $appMemory offset=4
    (local.get $0)
    (local.get $2)
    (local.get $1)
   )
  )
  (drop
   (memory.atomic.wait32 $instrumentMemory offset=4
    (local.get $0)
    (local.get $2)
    (local.get $1)
   )
  )
  (drop
   (memory.atomic.notify $dataMemory
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (memory.atomic.notify $dataMemory
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (memory.atomic.notify $appMemory offset=24
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (memory.atomic.notify $dataMemory offset=24
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (memory.atomic.wait64 $instrumentMemory
    (local.get $0)
    (local.get $1)
    (local.get $1)
   )
  )
  (drop
   (memory.atomic.wait64 $instrumentMemory
    (local.get $0)
    (local.get $1)
    (local.get $1)
   )
  )
  (drop
   (memory.atomic.wait64 $appMemory offset=16
    (local.get $0)
    (local.get $1)
    (local.get $1)
   )
  )
  (drop
   (memory.atomic.wait64 $appMemory offset=16
    (local.get $0)
    (local.get $1)
    (local.get $1)
   )
  )
 )
 (func $atomic-fence
  (atomic.fence)
 )
)

