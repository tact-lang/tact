open Shared
open Tact.Lang_types

let incr_f =
  Function
    { function_params = [("value", IntegerType)];
      function_returns = IntegerType;
      function_impl =
        BuiltinFn
          (builtin_fun (fun _p -> function
             | Integer arg :: _ ->
                 Value (Integer (Zint.succ arg))
             | _ ->
                 Value (Integer Zint.zero) ) ) }

let%expect_test "scope resolution" =
  let source = {|
    let T = Int(257);
  |} in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((T
         (Value
          (Struct
           ((struct_fields ((integer ((field_type IntegerType)))))
            (struct_methods
             ((new
               ((function_params ((integer IntegerType)))
                (function_returns (RefType <opaque>))
                (function_impl (BuiltinFn (<fun> 1)))))))
            (struct_id <opaque>))))))))) |}]

let%expect_test "binding resolution" =
  let source =
    {|
    let T = Int(257);
    let T_ = T;
    let a = 1;
    let a_ = a;
  |}
  in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((a_ (Value (Integer 1))) (a (Value (Integer 1)))
        (T_
         (Value
          (Struct
           ((struct_fields ((integer ((field_type IntegerType)))))
            (struct_methods
             ((new
               ((function_params ((integer IntegerType)))
                (function_returns (RefType <opaque>))
                (function_impl (BuiltinFn (<fun> 1)))))))
            (struct_id <opaque>)))))
        (T
         (Value
          (Struct
           ((struct_fields ((integer ((field_type IntegerType)))))
            (struct_methods
             ((new
               ((function_params ((integer IntegerType)))
                (function_returns (RefType <opaque>))
                (function_impl (BuiltinFn (<fun> 1)))))))
            (struct_id <opaque>))))))))) |}]

let%expect_test "failed scope resolution" =
  let source = {|
    let T = Int256;
  |} in
  pp source ; [%expect {|
    (Error ((UnresolvedIdentifier Int256))) |}]

let%expect_test "scope resolution after let binding" =
  let source = {|
    let A = Int(257);
    let B = A;
  |} in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((B
         (Value
          (Struct
           ((struct_fields ((integer ((field_type IntegerType)))))
            (struct_methods
             ((new
               ((function_params ((integer IntegerType)))
                (function_returns (RefType <opaque>))
                (function_impl (BuiltinFn (<fun> 1)))))))
            (struct_id <opaque>)))))
        (A
         (Value
          (Struct
           ((struct_fields ((integer ((field_type IntegerType)))))
            (struct_methods
             ((new
               ((function_params ((integer IntegerType)))
                (function_returns (RefType <opaque>))
                (function_impl (BuiltinFn (<fun> 1)))))))
            (struct_id <opaque>))))))))) |}]

let%expect_test "basic struct definition" =
  let source = {|
    struct T { val t: Int(257) }
  |} in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((T
         (Value
          (Struct
           ((struct_fields
             ((t
               ((field_type
                 (StructType
                  ((struct_fields ((integer ((field_type IntegerType)))))
                   (struct_methods
                    ((new
                      ((function_params ((integer IntegerType)))
                       (function_returns (RefType <opaque>))
                       (function_impl (BuiltinFn (<fun> 1)))))))
                   (struct_id <opaque>))))))))
            (struct_methods ()) (struct_id <opaque>))))))))) |}]

let%expect_test "native function evaluation" =
  let source = {|
    let v = incr(incr(incr(1)));
  |} in
  pp source ~bindings:(("incr", Value incr_f) :: Lang.default_bindings) ;
  [%expect {|
    (Ok ((bindings ((v (Value (Integer 4))))))) |}]

let%expect_test "Tact function evaluation" =
  let source =
    {|
    fn test(i: Int(257)) -> Int(257) {
      i
    }
    let a = test(test(1));
  |}
  in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((a (Value (Integer 1)))
        (test
         (Value
          (Function
           ((function_params
             ((i
               (StructType
                ((struct_fields ((integer ((field_type IntegerType)))))
                 (struct_methods
                  ((new
                    ((function_params ((integer IntegerType)))
                     (function_returns (RefType <opaque>))
                     (function_impl (BuiltinFn (<fun> 1)))))))
                 (struct_id <opaque>))))))
            (function_returns
             (StructType
              ((struct_fields ((integer ((field_type IntegerType)))))
               (struct_methods
                ((new
                  ((function_params ((integer IntegerType)))
                   (function_returns (RefType <opaque>))
                   (function_impl (BuiltinFn (<fun> 1)))))))
               (struct_id <opaque>))))
            (function_impl
             (Fn
              (((Break
                 (Expr
                  (Reference
                   (i
                    (StructType
                     ((struct_fields ((integer ((field_type IntegerType)))))
                      (struct_methods
                       ((new
                         ((function_params ((integer IntegerType)))
                          (function_returns (RefType <opaque>))
                          (function_impl (BuiltinFn (<fun> 1)))))))
                      (struct_id <opaque>))))))))))))))))))) |}]

let%expect_test "compile-time function evaluation within a function" =
  let source =
    {|
    fn test() {
      let v = incr(incr(incr(1)));
      v
    }
  |}
  in
  pp source ~bindings:(("incr", Value incr_f) :: Lang.default_bindings) ;
  [%expect
    {|
    (Ok
     ((bindings
       ((test
         (Value
          (Function
           ((function_params ()) (function_returns IntegerType)
            (function_impl
             (Fn
              (((Let ((v (Value (Integer 4)))))
                (Break (Expr (Value (Integer 4)))))))))))))))) |}]

let%expect_test "struct definition" =
  let source =
    {|
  let MyType = struct {
       val a: Int(257)
       val b: Bool
  };
  |}
  in
  pp source ;
  [%expect
    {|
      (Ok
       ((bindings
         ((MyType
           (Value
            (Struct
             ((struct_fields
               ((a
                 ((field_type
                   (StructType
                    ((struct_fields ((integer ((field_type IntegerType)))))
                     (struct_methods
                      ((new
                        ((function_params ((integer IntegerType)))
                         (function_returns (RefType <opaque>))
                         (function_impl (BuiltinFn (<fun> 1)))))))
                     (struct_id <opaque>))))))
                (b ((field_type (BuiltinType Bool))))))
              (struct_methods ()) (struct_id <opaque>))))))))) |}]

let%expect_test "duplicate type field" =
  let source =
    {|
  let MyType = struct {
      val a: Int(257)
      val a: Bool
  };
  |}
  in
  pp source ;
  [%expect
    {|
    (Error
     ((DuplicateField
       (a
        ((struct_fields
          ((a
            ((field_type
              (StructType
               ((struct_fields ((integer ((field_type IntegerType)))))
                (struct_methods
                 ((new
                   ((function_params ((integer IntegerType)))
                    (function_returns (RefType <opaque>))
                    (function_impl (BuiltinFn (<fun> 1)))))))
                (struct_id <opaque>))))))
           (a ((field_type (BuiltinType Bool))))))
         (struct_methods ()) (struct_id <opaque>)))))) |}]

let%expect_test "parametric struct instantiation" =
  let source =
    {|
      struct T(A: Type) { val a: A }
      let TA = T(Int(257));
   |}
  in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((TA
         (Value
          (Struct
           ((struct_fields ((a ((field_type (BuiltinType Type))))))
            (struct_methods ()) (struct_id <opaque>)))))
        (T
         (Value
          (Function
           ((function_params ((A (BuiltinType Type))))
            (function_returns (BuiltinType Type))
            (function_impl
             (Fn
              (((Expr
                 (Value
                  (Struct
                   ((struct_fields ((a ((field_type (BuiltinType Type))))))
                    (struct_methods ()) (struct_id <opaque>))))))))))))))))) |}]

let%expect_test "function without a return type" =
  let source = {|
    fn f() { 1 }
    let a = f();
    |} in
  pp source ;
  [%expect
    {|
      (Ok
       ((bindings
         ((a (Value (Integer 1)))
          (f
           (Value
            (Function
             ((function_params ()) (function_returns IntegerType)
              (function_impl (Fn (((Break (Expr (Value (Integer 1)))))))))))))))) |}]

let%expect_test "scoping that `let` introduces in code" =
  let source =
    {|
    fn f(i: Int(257)) {
      let a = i;
      a
    }
    let b = f(1);
    |}
  in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((b (Value (Integer 1)))
        (f
         (Value
          (Function
           ((function_params
             ((i
               (StructType
                ((struct_fields ((integer ((field_type IntegerType)))))
                 (struct_methods
                  ((new
                    ((function_params ((integer IntegerType)))
                     (function_returns (RefType <opaque>))
                     (function_impl (BuiltinFn (<fun> 1)))))))
                 (struct_id <opaque>))))))
            (function_returns
             (StructType
              ((struct_fields ((integer ((field_type IntegerType)))))
               (struct_methods
                ((new
                  ((function_params ((integer IntegerType)))
                   (function_returns (RefType <opaque>))
                   (function_impl (BuiltinFn (<fun> 1)))))))
               (struct_id <opaque>))))
            (function_impl
             (Fn
              (((Let
                 ((a
                   (Reference
                    (i
                     (StructType
                      ((struct_fields ((integer ((field_type IntegerType)))))
                       (struct_methods
                        ((new
                          ((function_params ((integer IntegerType)))
                           (function_returns (RefType <opaque>))
                           (function_impl (BuiltinFn (<fun> 1)))))))
                       (struct_id <opaque>))))))))
                (Break
                 (Expr
                  (Reference
                   (a
                    (StructType
                     ((struct_fields ((integer ((field_type IntegerType)))))
                      (struct_methods
                       ((new
                         ((function_params ((integer IntegerType)))
                          (function_returns (RefType <opaque>))
                          (function_impl (BuiltinFn (<fun> 1)))))))
                      (struct_id <opaque>)))))))))))))))))))
     |}]

let%expect_test "reference in function bodies" =
  let source =
    {|
      fn op(i: Int(257), i_: Int(257)) {
        i
      }

      fn f(x: Int(257)) {
        let a = op(x, x);
        let b = op(a, a);
      }
    |}
  in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((f
         (Value
          (Function
           ((function_params
             ((x
               (StructType
                ((struct_fields ((integer ((field_type IntegerType)))))
                 (struct_methods
                  ((new
                    ((function_params ((integer IntegerType)))
                     (function_returns (RefType <opaque>))
                     (function_impl (BuiltinFn (<fun> 1)))))))
                 (struct_id <opaque>))))))
            (function_returns VoidType)
            (function_impl
             (Fn
              (((Let
                 ((a
                   (FunctionCall
                    ((Value
                      (Function
                       ((function_params
                         ((i
                           (StructType
                            ((struct_fields
                              ((integer ((field_type IntegerType)))))
                             (struct_methods
                              ((new
                                ((function_params ((integer IntegerType)))
                                 (function_returns (RefType <opaque>))
                                 (function_impl (BuiltinFn (<fun> 1)))))))
                             (struct_id <opaque>))))
                          (i_
                           (StructType
                            ((struct_fields
                              ((integer ((field_type IntegerType)))))
                             (struct_methods
                              ((new
                                ((function_params ((integer IntegerType)))
                                 (function_returns (RefType <opaque>))
                                 (function_impl (BuiltinFn (<fun> 1)))))))
                             (struct_id <opaque>))))))
                        (function_returns
                         (StructType
                          ((struct_fields ((integer ((field_type IntegerType)))))
                           (struct_methods
                            ((new
                              ((function_params ((integer IntegerType)))
                               (function_returns (RefType <opaque>))
                               (function_impl (BuiltinFn (<fun> 1)))))))
                           (struct_id <opaque>))))
                        (function_impl
                         (Fn
                          (((Break
                             (Expr
                              (Reference
                               (i
                                (StructType
                                 ((struct_fields
                                   ((integer ((field_type IntegerType)))))
                                  (struct_methods
                                   ((new
                                     ((function_params ((integer IntegerType)))
                                      (function_returns (RefType <opaque>))
                                      (function_impl (BuiltinFn (<fun> 1)))))))
                                  (struct_id <opaque>))))))))))))))
                     ((Reference
                       (x
                        (StructType
                         ((struct_fields ((integer ((field_type IntegerType)))))
                          (struct_methods
                           ((new
                             ((function_params ((integer IntegerType)))
                              (function_returns (RefType <opaque>))
                              (function_impl (BuiltinFn (<fun> 1)))))))
                          (struct_id <opaque>)))))
                      (Reference
                       (x
                        (StructType
                         ((struct_fields ((integer ((field_type IntegerType)))))
                          (struct_methods
                           ((new
                             ((function_params ((integer IntegerType)))
                              (function_returns (RefType <opaque>))
                              (function_impl (BuiltinFn (<fun> 1)))))))
                          (struct_id <opaque>)))))))))))
                (Let
                 ((b
                   (FunctionCall
                    ((Value
                      (Function
                       ((function_params
                         ((i
                           (StructType
                            ((struct_fields
                              ((integer ((field_type IntegerType)))))
                             (struct_methods
                              ((new
                                ((function_params ((integer IntegerType)))
                                 (function_returns (RefType <opaque>))
                                 (function_impl (BuiltinFn (<fun> 1)))))))
                             (struct_id <opaque>))))
                          (i_
                           (StructType
                            ((struct_fields
                              ((integer ((field_type IntegerType)))))
                             (struct_methods
                              ((new
                                ((function_params ((integer IntegerType)))
                                 (function_returns (RefType <opaque>))
                                 (function_impl (BuiltinFn (<fun> 1)))))))
                             (struct_id <opaque>))))))
                        (function_returns
                         (StructType
                          ((struct_fields ((integer ((field_type IntegerType)))))
                           (struct_methods
                            ((new
                              ((function_params ((integer IntegerType)))
                               (function_returns (RefType <opaque>))
                               (function_impl (BuiltinFn (<fun> 1)))))))
                           (struct_id <opaque>))))
                        (function_impl
                         (Fn
                          (((Break
                             (Expr
                              (Reference
                               (i
                                (StructType
                                 ((struct_fields
                                   ((integer ((field_type IntegerType)))))
                                  (struct_methods
                                   ((new
                                     ((function_params ((integer IntegerType)))
                                      (function_returns (RefType <opaque>))
                                      (function_impl (BuiltinFn (<fun> 1)))))))
                                  (struct_id <opaque>))))))))))))))
                     ((Reference
                       (a
                        (StructType
                         ((struct_fields ((integer ((field_type IntegerType)))))
                          (struct_methods
                           ((new
                             ((function_params ((integer IntegerType)))
                              (function_returns (RefType <opaque>))
                              (function_impl (BuiltinFn (<fun> 1)))))))
                          (struct_id <opaque>)))))
                      (Reference
                       (a
                        (StructType
                         ((struct_fields ((integer ((field_type IntegerType)))))
                          (struct_methods
                           ((new
                             ((function_params ((integer IntegerType)))
                              (function_returns (RefType <opaque>))
                              (function_impl (BuiltinFn (<fun> 1)))))))
                          (struct_id <opaque>)))))))))))))))))))
        (op
         (Value
          (Function
           ((function_params
             ((i
               (StructType
                ((struct_fields ((integer ((field_type IntegerType)))))
                 (struct_methods
                  ((new
                    ((function_params ((integer IntegerType)))
                     (function_returns (RefType <opaque>))
                     (function_impl (BuiltinFn (<fun> 1)))))))
                 (struct_id <opaque>))))
              (i_
               (StructType
                ((struct_fields ((integer ((field_type IntegerType)))))
                 (struct_methods
                  ((new
                    ((function_params ((integer IntegerType)))
                     (function_returns (RefType <opaque>))
                     (function_impl (BuiltinFn (<fun> 1)))))))
                 (struct_id <opaque>))))))
            (function_returns
             (StructType
              ((struct_fields ((integer ((field_type IntegerType)))))
               (struct_methods
                ((new
                  ((function_params ((integer IntegerType)))
                   (function_returns (RefType <opaque>))
                   (function_impl (BuiltinFn (<fun> 1)))))))
               (struct_id <opaque>))))
            (function_impl
             (Fn
              (((Break
                 (Expr
                  (Reference
                   (i
                    (StructType
                     ((struct_fields ((integer ((field_type IntegerType)))))
                      (struct_methods
                       ((new
                         ((function_params ((integer IntegerType)))
                          (function_returns (RefType <opaque>))
                          (function_impl (BuiltinFn (<fun> 1)))))))
                      (struct_id <opaque>))))))))))))))))))) |}]

let%expect_test "resolving a reference from inside a function" =
  let source =
    {|
      let i = 1;
      fn f() {
        i
      }
      let x = f();
    |}
  in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((x (Value (Integer 1)))
        (f
         (Value
          (Function
           ((function_params ()) (function_returns IntegerType)
            (function_impl (Fn (((Break (Expr (Value (Integer 1))))))))))))
        (i (Value (Integer 1))))))) |}]

let%expect_test "method access" =
  let source =
    {|
      struct Foo {
        fn bar(self: Type, i: Integer) {
           i
        }
      }
      let foo = Foo {};
      let res = foo.bar(1);
    |}
  in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((res (Value (Integer 1)))
        (foo
         (Value
          (StructInstance
           (((struct_fields ())
             (struct_methods
              ((bar
                ((function_params ((self (BuiltinType Type)) (i IntegerType)))
                 (function_returns IntegerType)
                 (function_impl
                  (Fn (((Break (Expr (Reference (i IntegerType))))))))))))
             (struct_id <opaque>))
            ()))))
        (Foo
         (Value
          (Struct
           ((struct_fields ())
            (struct_methods
             ((bar
               ((function_params ((self (BuiltinType Type)) (i IntegerType)))
                (function_returns IntegerType)
                (function_impl
                 (Fn (((Break (Expr (Reference (i IntegerType))))))))))))
            (struct_id <opaque>))))))))) |}]

let%expect_test "can't use asm in compile-time" =
  let source = {|
    asm("SWAP 2 XCHG0");
    asm("ADD");
  |} in
  pp source ;
  [%expect
    {|
    (Error
     ((UninterpretableStatement (Expr (Asm (SWAP (XCHG0 2)))))
      (UninterpretableStatement (Expr (Asm (ADD)))))) |}]

let%expect_test "use of asm in a function" =
  let source =
    {|
    fn f() {
      asm("SWAP 2 XCHG0");
      asm("ADD");
    }
  |}
  in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((f
         (Value
          (Function
           ((function_params ()) (function_returns VoidType)
            (function_impl
             (Fn (((Expr (Asm (SWAP (XCHG0 2)))) (Expr (Asm (ADD))))))))))))))) |}]
