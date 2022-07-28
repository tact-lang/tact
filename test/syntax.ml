open Core

module Config = struct
  include Tact.Located.Disabled
end

module Syntax = Tact.Syntax.Make (Config)
module Parser = Tact.Parser.Make (Config)

let parse_program s = Parser.program Tact.Lexer.token (Lexing.from_string s)

let print_sexp p =
  Sexplib.Sexp.pp_hum Format.std_formatter (Syntax.sexp_of_program p)

let pp s = parse_program s |> print_sexp

let%expect_test "empty" =
  let source = {||} in
  pp source ; [%expect {| () |}]

let%expect_test "valid identifiers" =
  let source =
    {|
  let _ = 2;
  let a = 1;
  let _a = 2;
  let a0 = 3;
  let a_4 = 5;
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let ((binding_name (Ident _)) (binding_expr (Int 2))))
       (Let ((binding_name (Ident a)) (binding_expr (Int 1))))
       (Let ((binding_name (Ident _a)) (binding_expr (Int 2))))
       (Let ((binding_name (Ident a0)) (binding_expr (Int 3))))
       (Let ((binding_name (Ident a_4)) (binding_expr (Int 5))))))) |}]

let%expect_test "integer" =
  let source = {|100;-100|} in
  pp source ; [%expect {| ((stmts ((Expr (Int 100)) (Expr (Int -100))))) |}]

let%expect_test "string" =
  let source = {|"hello world"|} in
  pp source ; [%expect {| ((stmts ((Expr (String "hello world"))))) |}]

let%expect_test "let struct" =
  let source = {|
    let MyType = struct {};
    |} in
  pp source ;
  [%expect
    {|
      ((stmts
        ((Let
          ((binding_name (Ident MyType))
           (binding_expr (Struct ((struct_span <opaque>))))))))) |}]

let%expect_test "let struct with parameter (shorthand)" =
  let source = {|
  let MyType(T: Type) = struct {};
  |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident MyType))
         (binding_expr
          (Function
           ((params (((Ident T) (Reference (Ident Type)))))
            (function_body
             ((function_stmt (Expr (Struct ((struct_span <opaque>)))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "struct definition (shorthand)" =
  let source = {|
  struct MyType {}
  |} in
  pp source ;
  [%expect
    {|
      ((stmts
        ((Let
          ((binding_name (Ident MyType))
           (binding_expr (Struct ((struct_span <opaque>))))))))) |}]

let%expect_test "struct construction" =
  let source =
    {|
    struct MyType { 
     a: Int[257]
     b: Int[257]
    }
    let my = MyType {
      a: 0,
      b: 1
    };
  |}
  in
  pp source ;
  [%expect
    {|
      ((stmts
        ((Let
          ((binding_name (Ident MyType))
           (binding_expr
            (Struct
             ((fields
               (((field_name (Ident a))
                 (field_type
                  (FunctionCall
                   ((fn (Reference (Ident Int))) (arguments ((Int 257)))))))
                ((field_name (Ident b))
                 (field_type
                  (FunctionCall
                   ((fn (Reference (Ident Int))) (arguments ((Int 257)))))))))
              (struct_span <opaque>))))))
         (Let
          ((binding_name (Ident my))
           (binding_expr
            (StructConstructor
             ((constructor_id (Reference (Ident MyType)))
              (fields_construction (((Ident a) (Int 0)) ((Ident b) (Int 1)))))))))))) |}]

let%expect_test "parameterized struct shorthand" =
  let source = {|
  struct MyType[T: Type] {}
  |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident MyType))
         (binding_expr
          (Function
           ((params (((Ident T) (Reference (Ident Type)))))
            (function_body
             ((function_stmt (Expr (Struct ((struct_span <opaque>)))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "struct fields" =
  let source =
    {|
  struct MyType {
    a: Int[257]
    f: get_type()
  }
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident MyType))
         (binding_expr
          (Struct
           ((fields
             (((field_name (Ident a))
               (field_type
                (FunctionCall
                 ((fn (Reference (Ident Int))) (arguments ((Int 257)))))))
              ((field_name (Ident f))
               (field_type (FunctionCall ((fn (Reference (Ident get_type)))))))))
            (struct_span <opaque>))))))))) |}]

let%expect_test "struct fields with semicolons" =
  let source = {|
  struct MyType { a: Int[257]; f: get_type() }
  |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident MyType))
         (binding_expr
          (Struct
           ((fields
             (((field_name (Ident a))
               (field_type
                (FunctionCall
                 ((fn (Reference (Ident Int))) (arguments ((Int 257)))))))
              ((field_name (Ident f))
               (field_type (FunctionCall ((fn (Reference (Ident get_type)))))))))
            (struct_span <opaque>))))))))) |}]

let%expect_test "struct methods" =
  let source =
    {|
    struct MyType {
      fn test() -> Bool {}
      fn todo() -> Int[257]
    }
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident MyType))
         (binding_expr
          (Struct
           ((struct_bindings
             (((binding_name (Ident test))
               (binding_expr
                (Function
                 ((returns (Reference (Ident Bool)))
                  (function_body ((function_stmt (CodeBlock ()))))
                  (function_def_span <opaque>)))))
              ((binding_name (Ident todo))
               (binding_expr
                (Function
                 ((returns
                   (FunctionCall
                    ((fn (Reference (Ident Int))) (arguments ((Int 257))))))
                  (function_def_span <opaque>)))))))
            (struct_span <opaque>))))))))) |}]

let%expect_test "struct with fields and methods" =
  let source =
    {|
    struct MyType {
      a: Int[257]
      fn test() -> Bool {}
    }
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident MyType))
         (binding_expr
          (Struct
           ((fields
             (((field_name (Ident a))
               (field_type
                (FunctionCall
                 ((fn (Reference (Ident Int))) (arguments ((Int 257)))))))))
            (struct_bindings
             (((binding_name (Ident test))
               (binding_expr
                (Function
                 ((returns (Reference (Ident Bool)))
                  (function_body ((function_stmt (CodeBlock ()))))
                  (function_def_span <opaque>)))))))
            (struct_span <opaque>))))))))) |}]

let%expect_test "let function definition" =
  let source = {|
  let F = fn (A: T) -> P(1) {};
  |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident F))
         (binding_expr
          (Function
           ((params (((Ident A) (Reference (Ident T)))))
            (returns
             (FunctionCall ((fn (Reference (Ident P))) (arguments ((Int 1))))))
            (function_body ((function_stmt (CodeBlock ()))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "function definition shorthand" =
  let source = {|
  fn F(A: T) -> P(1) {}
  |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident F))
         (binding_expr
          (Function
           ((params (((Ident A) (Reference (Ident T)))))
            (returns
             (FunctionCall ((fn (Reference (Ident P))) (arguments ((Int 1))))))
            (function_body ((function_stmt (CodeBlock ()))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "function without a return type" =
  let source =
    {|
    let f1 = fn(t: Int[257]);
    let f2 = fn(t: Int[257]) {};
    fn f4(t: Int[257]) {}
    |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident f1))
         (binding_expr
          (Function
           ((params
             (((Ident t)
               (FunctionCall
                ((fn (Reference (Ident Int))) (arguments ((Int 257))))))))
            (function_def_span <opaque>))))))
       (Let
        ((binding_name (Ident f2))
         (binding_expr
          (Function
           ((params
             (((Ident t)
               (FunctionCall
                ((fn (Reference (Ident Int))) (arguments ((Int 257))))))))
            (function_body ((function_stmt (CodeBlock ()))))
            (function_def_span <opaque>))))))
       (Let
        ((binding_name (Ident f4))
         (binding_expr
          (Function
           ((params
             (((Ident t)
               (FunctionCall
                ((fn (Reference (Ident Int))) (arguments ((Int 257))))))))
            (function_body ((function_stmt (CodeBlock ()))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "parse parameterized return type as part of function \
                 signature, not a function call" =
  let source = {|
  let F = fn (A: T) -> P(1);
  |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident F))
         (binding_expr
          (Function
           ((params (((Ident A) (Reference (Ident T)))))
            (returns
             (FunctionCall ((fn (Reference (Ident P))) (arguments ((Int 1))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "fn signature returning function signature" =
  let source = {|
  let F = fn (A: T) -> (fn () -> T);
  |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident F))
         (binding_expr
          (Function
           ((params (((Ident A) (Reference (Ident T)))))
            (returns
             (Function
              ((returns (Reference (Ident T))) (function_def_span <opaque>))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "enforcing precedence of a function call over a signature" =
  let source = {|
  let F = (fn (A: T) -> P)(1);
  |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident F))
         (binding_expr
          (FunctionCall
           ((fn
             (Function
              ((params (((Ident A) (Reference (Ident T)))))
               (returns (Reference (Ident P))) (function_def_span <opaque>))))
            (arguments ((Int 1))))))))))) |}]

let%expect_test "function call" =
  let source = {|
  let F = func(1);
  |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident F))
         (binding_expr
          (FunctionCall ((fn (Reference (Ident func))) (arguments ((Int 1))))))))))) |}]

let%expect_test "function call in a list of statements" =
  let source = {|
  let F = fn() -> T { 
       func(1);
  };
|} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident F))
         (binding_expr
          (Function
           ((returns (Reference (Ident T)))
            (function_body
             ((function_stmt
               (CodeBlock
                ((Expr
                  (FunctionCall
                   ((fn (Reference (Ident func))) (arguments ((Int 1)))))))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "let in function body" =
  let source =
    {|
      let f = fn() -> Integer { 
          let a = 1;
          return a;
      };
    |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident f))
         (binding_expr
          (Function
           ((returns (Reference (Ident Integer)))
            (function_body
             ((function_stmt
               (CodeBlock
                ((Let ((binding_name (Ident a)) (binding_expr (Int 1))))
                 (Return (Reference (Ident a))))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "code block without trailing semicolon" =
  let source =
    {|
    let f = fn() -> Integer { 
      let a = 1;
      a
    };
    |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident f))
         (binding_expr
          (Function
           ((returns (Reference (Ident Integer)))
            (function_body
             ((function_stmt
               (CodeBlock
                ((Let ((binding_name (Ident a)) (binding_expr (Int 1))))
                 (Break (Expr (Reference (Ident a)))))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "if with an empty body and no else statement" =
  let source = {|
  fn test() -> A {
    if (1) {}
  }
  |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident test))
         (binding_expr
          (Function
           ((returns (Reference (Ident A)))
            (function_body
             ((function_stmt
               (CodeBlock
                ((Break (If ((condition (Int 1)) (body (CodeBlock ()))))))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "if with a body and an empty else" =
  let source =
    {|
          fn test() -> A {
            if (1) {
              a;
            }
            else {}
          }
          |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident test))
         (binding_expr
          (Function
           ((returns (Reference (Ident A)))
            (function_body
             ((function_stmt
               (CodeBlock
                ((Break
                  (If
                   ((condition (Int 1))
                    (body (CodeBlock ((Expr (Reference (Ident a))))))
                    (else_ (CodeBlock ()))))))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "if with else if" =
  let source =
    {|
    fn test() -> A {
      if (1) {}
      else if (10) {}
    }
    |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident test))
         (binding_expr
          (Function
           ((returns (Reference (Ident A)))
            (function_body
             ((function_stmt
               (CodeBlock
                ((Break
                  (If
                   ((condition (Int 1)) (body (CodeBlock ()))
                    (else_ (If ((condition (Int 10)) (body (CodeBlock ())))))))))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "struct construction over a parameterized type" =
  let source = {|
  let a = A(X) { field: value };
  |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident a))
         (binding_expr
          (StructConstructor
           ((constructor_id
             (FunctionCall
              ((fn (Reference (Ident A))) (arguments ((Reference (Ident X)))))))
            (fields_construction (((Ident field) (Reference (Ident value))))))))))))) |}]

let%expect_test "struct construction over an anonymous type" =
  let source =
    {|
  let a = (struct { field: Int[257] }) { field: value };
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident a))
         (binding_expr
          (StructConstructor
           ((constructor_id
             (Struct
              ((fields
                (((field_name (Ident field))
                  (field_type
                   (FunctionCall
                    ((fn (Reference (Ident Int))) (arguments ((Int 257)))))))))
               (struct_span <opaque>))))
            (fields_construction (((Ident field) (Reference (Ident value))))))))))))) |}]

let%expect_test "struct construction over an anonymous type's function call" =
  let source =
    {|
  let a = struct[T: Type] { field: T }(X) { field: value };
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident a))
         (binding_expr
          (StructConstructor
           ((constructor_id
             (FunctionCall
              ((fn
                (Function
                 ((params (((Ident T) (Reference (Ident Type)))))
                  (function_body
                   ((function_stmt
                     (Expr
                      (Struct
                       ((fields
                         (((field_name (Ident field))
                           (field_type (Reference (Ident T))))))
                        (struct_span <opaque>)))))))
                  (function_def_span <opaque>))))
               (arguments ((Reference (Ident X)))))))
            (fields_construction (((Ident field) (Reference (Ident value))))))))))))) |}]

let%expect_test "tilde syntax" =
  let source = {|
    fn test() -> A {
      ~var;
    }
    |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident test))
         (binding_expr
          (Function
           ((returns (Reference (Ident A)))
            (function_body
             ((function_stmt (CodeBlock ((Expr (MutRef (Ident var))))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "field access syntax" =
  let source = {|
    fn test() -> A {
      foo.bar;
    }
    |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident test))
         (binding_expr
          (Function
           ((returns (Reference (Ident A)))
            (function_body
             ((function_stmt
               (CodeBlock
                ((Expr
                  (FieldAccess
                   ((from_expr (Reference (Ident foo))) (to_field (Ident bar))))))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "field access over other expressions" =
  let source =
    {|
    fn test() -> A {
      ~foo.bar;
      Struct{field: value}.field.other_field;
    }
    |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident test))
         (binding_expr
          (Function
           ((returns (Reference (Ident A)))
            (function_body
             ((function_stmt
               (CodeBlock
                ((Expr
                  (FieldAccess
                   ((from_expr (MutRef (Ident foo))) (to_field (Ident bar)))))
                 (Expr
                  (FieldAccess
                   ((from_expr
                     (FieldAccess
                      ((from_expr
                        (StructConstructor
                         ((constructor_id (Reference (Ident Struct)))
                          (fields_construction
                           (((Ident field) (Reference (Ident value))))))))
                       (to_field (Ident field)))))
                    (to_field (Ident other_field))))))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "method access" =
  let source = {|
      foo.bar(1);
    |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Expr
        (MethodCall
         ((receiver (Reference (Ident foo))) (receiver_fn (Ident bar))
          (receiver_arguments ((Int 1))))))))) |}]

let%expect_test "union definition" =
  let source =
    {|
    union U {
       case Int[257]
       case Bool
    }  
    |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident U))
         (binding_expr
          (Union
           ((union_members
             ((FunctionCall
               ((fn (Reference (Ident Int))) (arguments ((Int 257)))))
              (Reference (Ident Bool))))
            (union_span <opaque>))))))))) |}]

let%expect_test "union definition using let binding" =
  let source =
    {|
    let U = union {
       case Int[257]
       case Bool
    };
    |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident U))
         (binding_expr
          (Union
           ((union_members
             ((FunctionCall
               ((fn (Reference (Ident Int))) (arguments ((Int 257)))))
              (Reference (Ident Bool))))
            (union_span <opaque>))))))))) |}]

let%expect_test "parameterized union definition" =
  let source =
    {|
    union Option[T: Type] {
       case T
       case Null 
    }  
    |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident Option))
         (binding_expr
          (Function
           ((params (((Ident T) (Reference (Ident Type)))))
            (function_body
             ((function_stmt
               (Expr
                (Union
                 ((union_members
                   ((Reference (Ident T)) (Reference (Ident Null))))
                  (union_span <opaque>)))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "parameterized union definition using let binding" =
  let source =
    {|
    let Option(T: Type) = union {
       case T
       case Null 
    };
    |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident Option))
         (binding_expr
          (Function
           ((params (((Ident T) (Reference (Ident Type)))))
            (function_body
             ((function_stmt
               (Expr
                (Union
                 ((union_members
                   ((Reference (Ident T)) (Reference (Ident Null))))
                  (union_span <opaque>)))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "single-line comments" =
  let source = {|
    let a = 1; // Useful binding
  |} in
  pp source ;
  [%expect
    {| ((stmts ((Let ((binding_name (Ident a)) (binding_expr (Int 1))))))) |}]

let%expect_test "multi-line comment started in a single-line comment is ignored"
    =
  let source =
    {|
    let a = 1; // Useful binding /* this shouldn't get recognized as a comment
    let b = 2;
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let ((binding_name (Ident a)) (binding_expr (Int 1))))
       (Let ((binding_name (Ident b)) (binding_expr (Int 2))))))) |}]

let%expect_test "multi-line comment" =
  let source =
    {|
    let a = 1; /* multi-line comment started here
    and ended here */
    let b = 2;
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let ((binding_name (Ident a)) (binding_expr (Int 1))))
       (Let ((binding_name (Ident b)) (binding_expr (Int 2))))))) |}]

let%expect_test "nested multi-line comment" =
  let source =
    {|
    let a = 1; /* multi-line comment started here
      /* I hope you like comments */
    and ended here */
    let b = 2;
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let ((binding_name (Ident a)) (binding_expr (Int 1))))
       (Let ((binding_name (Ident b)) (binding_expr (Int 2))))))) |}]

let%expect_test "interface impls inside structs" =
  let source =
    {|
      struct Something {
        impl Interface {
          fn new() -> Self { }
        }
      }
    |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident Something))
         (binding_expr
          (Struct
           ((impls
             (((interface (Reference (Ident Interface)))
               (methods
                (((binding_name (Ident new))
                  (binding_expr
                   (Function
                    ((returns (Reference (Ident Self)))
                     (function_body ((function_stmt (CodeBlock ()))))
                     (function_def_span <opaque>))))))))))
            (struct_span <opaque>))))))))) |}]

let%expect_test "interface impls inside structs" =
  let source = {|
      interface Foo {
        fn method()
      }
    |} in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident Foo))
         (binding_expr
          (Interface
           ((interface_members
             (((binding_name (Ident method))
               (binding_expr (Function ((function_def_span <opaque>))))))))))))))) |}]

let%expect_test "switch statement" =
  let source =
    {|
    fn test() {
      switch (expr) {
        case Type(T) vax => { let a = 10; }
        case Baz vax => {
          let a = 10;
          let b = 20;
        }
      }
    }
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident test))
         (binding_expr
          (Function
           ((function_body
             ((function_stmt
               (CodeBlock
                ((Break
                  (Switch
                   ((switch_condition (Reference (Ident expr)))
                    (branches
                     (((ty
                        (FunctionCall
                         ((fn (Reference (Ident Type)))
                          (arguments ((Reference (Ident T)))))))
                       (var (Ident vax))
                       (stmt
                        (CodeBlock
                         ((Let
                           ((binding_name (Ident a)) (binding_expr (Int 10))))))))
                      ((ty (Reference (Ident Baz))) (var (Ident vax))
                       (stmt
                        (CodeBlock
                         ((Let
                           ((binding_name (Ident a)) (binding_expr (Int 10))))
                          (Let
                           ((binding_name (Ident b)) (binding_expr (Int 20))))))))))))))))))
            (function_def_span <opaque>))))))))) |}]

let%expect_test "switch statement with a default case" =
  let source =
    {|
    fn test() {
      switch (expr) {
        case Type[T] vax => { let a = 10; }
        case Baz vax => {
          let a = 10;
          let b = 20;
        }
        else => {
           let c = 30;
        }
      }
    }
  |}
  in
  pp source ;
  [%expect
    {|
      ((stmts
        ((Let
          ((binding_name (Ident test))
           (binding_expr
            (Function
             ((function_body
               ((function_stmt
                 (CodeBlock
                  ((Break
                    (Switch
                     ((switch_condition (Reference (Ident expr)))
                      (branches
                       (((ty
                          (FunctionCall
                           ((fn (Reference (Ident Type)))
                            (arguments ((Reference (Ident T)))))))
                         (var (Ident vax))
                         (stmt
                          (CodeBlock
                           ((Let
                             ((binding_name (Ident a)) (binding_expr (Int 10))))))))
                        ((ty (Reference (Ident Baz))) (var (Ident vax))
                         (stmt
                          (CodeBlock
                           ((Let
                             ((binding_name (Ident a)) (binding_expr (Int 10))))
                            (Let
                             ((binding_name (Ident b)) (binding_expr (Int 20))))))))))
                      (default
                       (CodeBlock
                        ((Let ((binding_name (Ident c)) (binding_expr (Int 30)))))))))))))))
              (function_def_span <opaque>)))))))))
      |}]

let%expect_test "destructuring let" =
  let source =
    {|
  let {x, y, z} = (struct {x: Integer; y: Integer; z: Integer}){x: 1, y: 2, z: 3};
  |}
  in
  pp source ;
  [%expect
    {|
      ((stmts
        ((DestructuringLet
          ((destructuring_binding
            (((Ident x) (Ident x)) ((Ident y) (Ident y)) ((Ident z) (Ident z))))
           (destructuring_binding_expr
            (StructConstructor
             ((constructor_id
               (Struct
                ((fields
                  (((field_name (Ident x))
                    (field_type (Reference (Ident Integer))))
                   ((field_name (Ident y))
                    (field_type (Reference (Ident Integer))))
                   ((field_name (Ident z))
                    (field_type (Reference (Ident Integer))))))
                 (struct_span <opaque>))))
              (fields_construction
               (((Ident x) (Int 1)) ((Ident y) (Int 2)) ((Ident z) (Int 3)))))))
           (destructuring_binding_rest false))))))
    |}]

let%expect_test "destructuring let with renaming" =
  let source =
    {|
  let {x as x1, y, z as z1} = (struct {x: Integer; y: Integer; z: Integer}){x: 1, y: 2, z: 3};
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((DestructuringLet
        ((destructuring_binding
          (((Ident x) (Ident x1)) ((Ident y) (Ident y)) ((Ident z) (Ident z1))))
         (destructuring_binding_expr
          (StructConstructor
           ((constructor_id
             (Struct
              ((fields
                (((field_name (Ident x))
                  (field_type (Reference (Ident Integer))))
                 ((field_name (Ident y))
                  (field_type (Reference (Ident Integer))))
                 ((field_name (Ident z))
                  (field_type (Reference (Ident Integer))))))
               (struct_span <opaque>))))
            (fields_construction
             (((Ident x) (Int 1)) ((Ident y) (Int 2)) ((Ident z) (Int 3)))))))
         (destructuring_binding_rest false)))))) |}]

let%expect_test "destructuring let with rest ignored" =
  let source =
    {|
  let {x, ..}  = (struct {x: Integer; y: Integer; z: Integer}){x: 1, y: 2, z: 3};
  |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((DestructuringLet
        ((destructuring_binding (((Ident x) (Ident x))))
         (destructuring_binding_expr
          (StructConstructor
           ((constructor_id
             (Struct
              ((fields
                (((field_name (Ident x))
                  (field_type (Reference (Ident Integer))))
                 ((field_name (Ident y))
                  (field_type (Reference (Ident Integer))))
                 ((field_name (Ident z))
                  (field_type (Reference (Ident Integer))))))
               (struct_span <opaque>))))
            (fields_construction
             (((Ident x) (Int 1)) ((Ident y) (Int 2)) ((Ident z) (Int 3)))))))
         (destructuring_binding_rest true)))))) |}]

let%expect_test "program returns" =
  let sources = [{| 1 |}; {| return 1|}] in
  List.iter ~f:pp sources ;
  [%expect {| ((stmts ((Expr (Int 1)))))((stmts ((Return (Int 1))))) |}]

let%expect_test "attributes" =
  let source =
    {|
    @attr
    @attr(1)
    @attr(1,2)
    struct T {
      @attr a: Integer
      @attr fn x() { true }
    }

    @attr
    struct Ta[X: Integer] {}

    let T1 = @attr struct { };

    @attr
    fn x() { }

    let x1 = @attr fn () { };

    @attr
    interface I {
      @attr
      fn x() -> Bool
    }

    @attr
    union U { case Void }

    let U1 = @attr union { case Void };

    struct Ti {
      @attr
      impl I {
        @attr
        fn x() -> Bool { true } 
      }
    }

    @attr
    enum E {
      @attr fn x() { true }
    }

    let E1 = @attr enum { }

    |}
  in
  pp source ;
  [%expect
    {|
    ((stmts
      ((Let
        ((binding_name (Ident T))
         (binding_expr
          (Struct
           ((struct_attributes
             (((attribute_ident (Ident attr)))
              ((attribute_ident (Ident attr)) (attribute_exprs ((Int 1))))
              ((attribute_ident (Ident attr))
               (attribute_exprs ((Int 1) (Int 2))))))
            (fields
             (((field_attributes (((attribute_ident (Ident attr)))))
               (field_name (Ident a)) (field_type (Reference (Ident Integer))))))
            (struct_bindings
             (((binding_name (Ident x))
               (binding_expr
                (Function
                 ((function_attributes (((attribute_ident (Ident attr)))))
                  (function_body
                   ((function_stmt (CodeBlock ((Break (Expr (Bool true))))))))
                  (function_def_span <opaque>)))))))
            (struct_span <opaque>))))))
       (Let
        ((binding_name (Ident Ta))
         (binding_expr
          (Function
           ((params (((Ident X) (Reference (Ident Integer)))))
            (function_body
             ((function_stmt
               (Expr
                (Struct
                 ((struct_attributes (((attribute_ident (Ident attr)))))
                  (struct_span <opaque>)))))))
            (function_def_span <opaque>))))))
       (Let
        ((binding_name (Ident T1))
         (binding_expr
          (Struct
           ((struct_attributes (((attribute_ident (Ident attr)))))
            (struct_span <opaque>))))))
       (Let
        ((binding_name (Ident x))
         (binding_expr
          (Function
           ((function_attributes (((attribute_ident (Ident attr)))))
            (function_body ((function_stmt (CodeBlock ()))))
            (function_def_span <opaque>))))))
       (Let
        ((binding_name (Ident x1))
         (binding_expr
          (Function
           ((function_attributes (((attribute_ident (Ident attr)))))
            (function_body ((function_stmt (CodeBlock ()))))
            (function_def_span <opaque>))))))
       (Let
        ((binding_name (Ident I))
         (binding_expr
          (Interface
           ((interface_attributes (((attribute_ident (Ident attr)))))
            (interface_members
             (((binding_name (Ident x))
               (binding_expr
                (Function
                 ((function_attributes (((attribute_ident (Ident attr)))))
                  (returns (Reference (Ident Bool)))
                  (function_def_span <opaque>))))))))))))
       (Let
        ((binding_name (Ident U))
         (binding_expr
          (Union
           ((union_attributes (((attribute_ident (Ident attr)))))
            (union_members ((Reference (Ident Void)))) (union_span <opaque>))))))
       (Let
        ((binding_name (Ident U1))
         (binding_expr
          (Union
           ((union_attributes (((attribute_ident (Ident attr)))))
            (union_members ((Reference (Ident Void)))) (union_span <opaque>))))))
       (Let
        ((binding_name (Ident Ti))
         (binding_expr
          (Struct
           ((impls
             (((impl_attributes (((attribute_ident (Ident attr)))))
               (interface (Reference (Ident I)))
               (methods
                (((binding_name (Ident x))
                  (binding_expr
                   (Function
                    ((function_attributes (((attribute_ident (Ident attr)))))
                     (returns (Reference (Ident Bool)))
                     (function_body
                      ((function_stmt (CodeBlock ((Break (Expr (Bool true))))))))
                     (function_def_span <opaque>))))))))))
            (struct_span <opaque>))))))
       (Let
        ((binding_name (Ident E))
         (binding_expr
          (Enum
           ((enum_attributes (((attribute_ident (Ident attr)))))
            (enum_bindings
             (((binding_name (Ident x))
               (binding_expr
                (Function
                 ((function_attributes (((attribute_ident (Ident attr)))))
                  (function_body
                   ((function_stmt (CodeBlock ((Break (Expr (Bool true))))))))
                  (function_def_span <opaque>))))))))))))
       (Let
        ((binding_name (Ident E1))
         (binding_expr
          (Enum ((enum_attributes (((attribute_ident (Ident attr))))))))))))) |}]
