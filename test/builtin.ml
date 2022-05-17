open Shared

let%expect_test "Int(bits) constructor" =
  let source =
    {|
      let i = Int(257).new(100);
      let overflow = Int(8).new(513);
    |}
  in
  pp source ;
  [%expect
    {|
    (Ok
     ((bindings
       ((overflow
         (Value
          (StructInstance
           (((struct_fields ((integer ((field_type IntegerType)))))
             (struct_methods
              ((new
                ((function_params ((integer IntegerType)))
                 (function_returns (RefType <opaque>))
                 (function_impl (BuiltinFn (<fun> 6)))))))
             (struct_id <opaque>))
            ((integer (Integer 1)))))))
        (i
         (Value
          (StructInstance
           (((struct_fields ((integer ((field_type IntegerType)))))
             (struct_methods
              ((new
                ((function_params ((integer IntegerType)))
                 (function_returns (RefType <opaque>))
                 (function_impl (BuiltinFn (<fun> 1)))))))
             (struct_id <opaque>))
            ((integer (Integer 100))))))))))) |}]
