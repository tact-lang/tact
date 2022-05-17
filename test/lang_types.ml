open Shared
open Tact.Lang_types

let%test "aliased structures equality" =
  let source = {|
  struct T { val a: Int(257) }
  let T1 = T; 
  |} in
  Alcotest.(check bool)
    "aliased types are the same" true
    (let scope = (compile source).bindings in
     let t = List.Assoc.find scope ~equal:String.equal "T" |> Option.value_exn
     and t1 =
       List.Assoc.find scope ~equal:String.equal "T1" |> Option.value_exn
     in
     pp_sexp (Lang.sexp_of_expr t) ;
     pp_sexp (Lang.sexp_of_expr t1) ;
     Lang.equal_expr t t1 )

let%test "carbon copy structure equality" =
  let source =
    {|
  struct T { val a: Int(257) }
  struct T1 { val a: Int(257) }
  |}
  in
  Alcotest.(check bool)
    "carbon copy types are not the same" false
    (let scope = (compile source).bindings in
     let t = List.Assoc.find scope ~equal:String.equal "T" |> Option.value_exn
     and t1 =
       List.Assoc.find scope ~equal:String.equal "T1" |> Option.value_exn
     in
     pp_sexp (Lang.sexp_of_expr t) ;
     pp_sexp (Lang.sexp_of_expr t1) ;
     Lang.equal_expr t t1 )

let%test "parameterized structure equality" =
  let source =
    {|
  struct T(X: Type) { val a: X }
  let T1 = T(Int(257));
  let T2 = T(Bool);
  let T3 = T(Int(257));
  |}
  in
  Alcotest.(check bool)
    "differently parameterized types are not the same" false
    (let scope = (compile source).bindings in
     let t1 = List.Assoc.find scope ~equal:String.equal "T1" |> Option.value_exn
     and t2 =
       List.Assoc.find scope ~equal:String.equal "T2" |> Option.value_exn
     in
     pp_sexp (Lang.sexp_of_expr t1) ;
     pp_sexp (Lang.sexp_of_expr t2) ;
     Lang.equal_expr t1 t2 ) ;
  Alcotest.(check bool)
    "equally parameterized types are the same" true
    (let scope = (compile source).bindings in
     let t1 = List.Assoc.find scope ~equal:String.equal "T1" |> Option.value_exn
     and t3 =
       List.Assoc.find scope ~equal:String.equal "T3" |> Option.value_exn
     in
     pp_sexp (Lang.sexp_of_expr t1) ;
     pp_sexp (Lang.sexp_of_expr t3) ;
     Lang.equal_expr t1 t3 )

let%test "builtin function equality" =
  let f1 =
    { function_params = [];
      function_returns = VoidType;
      function_impl = BuiltinFn (builtin_fun (fun _ _ -> Value Void)) }
  and f2 =
    { function_params = [];
      function_returns = VoidType;
      function_impl = BuiltinFn (builtin_fun (fun _ _ -> Value Void)) }
  in
  Alcotest.(check bool)
    "different instances of the same builtin function are not equal" false
    (equal_function_ f1 f2) ;
  Alcotest.(check bool)
    "same instances of the same builtin function are equal" true
    (equal_function_ f1 f1)
