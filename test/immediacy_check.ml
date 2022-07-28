module Config = struct
  include Tact.Located.Disabled
end

module Syntax = Tact.Syntax.Make (Config)
module Parser = Tact.Parser.Make (Config)
module Lang = Tact.Lang.Make (Config)
module Show = Tact.Show.Make (Config)
module Interpreter = Tact.Interpreter.Make (Config)
module Errors = Tact.Errors
module Zint = Tact.Zint
module C = Tact.Compiler
module Codegen = Tact.Codegen_func
module Func = Tact.Func
include Core

type error = [Lang.error | Interpreter.error] [@@deriving sexp_of]

let make_errors e = new Errors.errors e

let parse_program s = Parser.program Tact.Lexer.token (Lexing.from_string s)

let strip_if_exists_in_other o1 o2 ~equal =
  List.filter o1 ~f:(fun o1_item -> not @@ List.exists o2 ~f:(equal o1_item))

let strip : program:Lang.program -> previous:Lang.program -> Lang.program =
 fun ~program ~previous ->
  { program with
    bindings =
      strip_if_exists_in_other program.bindings previous.bindings
        ~equal:(fun (x1, _) (y1, _) -> Config.equal_located equal_string x1 y1);
    structs =
      strip_if_exists_in_other program.structs previous.structs
        ~equal:(fun (id1, _) (id2, _) -> equal_int id1 id2);
    unions =
      strip_if_exists_in_other program.unions previous.unions
        ~equal:(fun (id1, _) (id2, _) -> equal_int id1 id2);
    interfaces =
      strip_if_exists_in_other program.interfaces previous.interfaces
        ~equal:(fun (id1, _) (id2, _) -> equal_int id1 id2);
    struct_signs =
      Lang.Arena.strip_if_exists program.struct_signs previous.struct_signs;
    union_signs =
      Lang.Arena.strip_if_exists program.union_signs previous.struct_signs }

let compile_pass p prev_program errors =
  let c = new Lang.constructor ~program:prev_program errors in
  let p' = c#visit_program () p in
  p'

let build_program ?(errors = make_errors Show.show_error)
    ?(strip_defaults = true) ~codegen p =
  let p' = compile_pass p (Lang.default_program ()) errors in
  let p'' =
    if strip_defaults then strip ~program:p' ~previous:(Lang.default_program ())
    else p'
  in
  errors#to_result p''
  |> Result.map_error ~f:(fun errors ->
         let errs = List.map errors ~f:(fun (_, err, _) -> err) in
         (errs, p'') )
  |> Result.map ~f:codegen

let rec pp_sexp = Sexplib.Sexp.pp_hum Caml.Format.std_formatter

and sexp_of_errors =
  sexp_of_pair (List.sexp_of_t sexp_of_error) Lang.sexp_of_program

and print_sexp e =
  pp_sexp (Result.sexp_of_t Lang.sexp_of_program sexp_of_errors e)

let compile ?(strip_defaults = true) s =
  parse_program s |> build_program ~strip_defaults ~codegen:(fun x -> x)

let pp_compile ?(strip_defaults = true) s =
  compile ~strip_defaults s |> print_sexp

open Lang

let%expect_test "Immediacy Checks Comptime Reference" =
  let scope = [[make_comptime (bl "Test", bl @@ Value Void)]] in
  let expr = bl @@ Reference (bl "Test", VoidType) in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| true |}]

let%expect_test "Immediacy Checks Runtime Reference" =
  let scope = [[make_runtime (bl "Test", VoidType)]] in
  let expr = bl @@ Reference (bl "Test", VoidType) in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| false |}]

let%expect_test "Immediacy Checks Primitive" =
  let scope = [] in
  let expr = bl @@ Primitive (Prim {name = ""; exprs = []}) in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| false |}]

let%expect_test "Immediacy Checks Empty Function" =
  let scope = [] in
  let expr =
    bl
    @@ Value
         (Function
            ( bl
            @@ { function_signature =
                   bl
                   @@ { function_attributes = [];
                        function_params = [];
                        function_returns = VoidType };
                 function_impl = Fn (bl @@ Block []) } ) )
  in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| true |}]

let%expect_test "Immediacy Checks Function Argument" =
  let scope = [] in
  let expr =
    bl
    @@ Value
         (Function
            ( bl
            @@ { function_signature =
                   bl
                   @@ { function_attributes = [];
                        function_params = [(bl "arg", VoidType)];
                        function_returns = VoidType };
                 function_impl =
                   Fn
                     ( bl
                     @@ Block [bl @@ Expr (bl @@ Reference (bl "arg", VoidType))]
                     ) } ) )
  in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| true |}]

let%expect_test "Immediacy Checks Let Argument" =
  let scope = [] in
  let expr =
    bl
    @@ Value
         (Function
            ( bl
            @@ { function_signature =
                   bl
                   @@ { function_attributes = [];
                        function_params = [];
                        function_returns = VoidType };
                 function_impl =
                   Fn
                     ( bl
                     @@ Block
                          [ bl @@ Let [(bl "arg", bl @@ Value Void)];
                            bl @@ Expr (bl @@ Reference (bl "arg", VoidType)) ]
                     ) } ) )
  in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| true |}]

let%expect_test "Immediacy Checks Destructuring Let" =
  let scope = [] in
  let expr =
    bl
    @@ Value
         (Function
            ( bl
            @@ { function_signature =
                   bl
                   @@ { function_attributes = [];
                        function_params = [];
                        function_returns = VoidType };
                 function_impl =
                   Fn
                     ( bl
                     @@ Block
                          [ bl
                            @@ DestructuringLet
                                 { destructuring_let =
                                     [(bl "a", bl "b"); (bl "c", bl "c")];
                                   destructuring_let_rest = false;
                                   destructuring_let_expr = bl @@ Value Void };
                            bl @@ Expr (bl @@ Reference (bl "b", VoidType));
                            bl @@ Expr (bl @@ Reference (bl "c", VoidType)) ] )
               } ) )
  in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| true |}]

let%expect_test "Immediacy Checks Function Call WITHOUT Primitive" =
  let scope = [] in
  let expr =
    bl
    @@ FunctionCall
         ( bl
           @@ Value
                (Function
                   ( bl
                   @@ { function_signature =
                          bl
                          @@ { function_attributes = [];
                               function_params = [];
                               function_returns = VoidType };
                        function_impl =
                          Fn
                            ( bl
                            @@ Block
                                 [ bl @@ Let [(bl "arg", bl @@ Value Void)];
                                   bl
                                   @@ Expr (bl @@ Reference (bl "arg", VoidType))
                                 ] ) } ) ),
           [] )
  in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| true |}]

let%expect_test "Immediacy Checks Function Call WITH Primitive" =
  let scope = [] in
  let expr =
    bl
    @@ FunctionCall
         ( bl
           @@ Value
                (Function
                   ( bl
                   @@ { function_signature =
                          bl
                          @@ { function_attributes = [];
                               function_params = [];
                               function_returns = VoidType };
                        function_impl =
                          Fn
                            ( bl
                            @@ Block
                                 [ bl
                                   @@ Expr
                                        ( bl
                                        @@ Primitive
                                             (Prim {name = ""; exprs = []}) ) ]
                            ) } ) ),
           [] )
  in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| false |}]

let f_with_primitive =
  bl
  @@ Value
       (Function
          ( bl
          @@ { function_signature =
                 bl
                 @@ { function_attributes = [];
                      function_params = [];
                      function_returns = VoidType };
               function_impl =
                 Fn
                   ( bl
                   @@ Block
                        [ bl
                          @@ Expr
                               (bl @@ Primitive (Prim {name = ""; exprs = []}))
                        ] ) } ) )

let%expect_test "Immediacy Checks Function Call that contains function with \
                 primitive" =
  let scope = [] in
  let expr =
    bl
    @@ FunctionCall
         ( bl
           @@ Value
                (Function
                   ( bl
                   @@ { function_signature =
                          bl
                          @@ { function_attributes = [];
                               function_params = [];
                               function_returns = VoidType };
                        function_impl =
                          Fn
                            ( bl
                            @@ Block [bl @@ Let [(bl "_", f_with_primitive)]] )
                      } ) ),
           [] )
  in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| true |}]

let%expect_test "Immediacy Checks Function Call that Call function with \
                 primitive" =
  let scope = [] in
  let expr =
    bl
    @@ FunctionCall
         ( bl
           @@ Value
                (Function
                   ( bl
                   @@ { function_signature =
                          bl
                          @@ { function_attributes = [];
                               function_params = [];
                               function_returns = VoidType };
                        function_impl =
                          Fn
                            ( bl
                            @@ Block
                                 [ bl
                                   @@ Expr
                                        ( bl
                                        @@ FunctionCall (f_with_primitive, [])
                                        ) ] ) } ) ),
           [] )
  in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| false |}]

let%expect_test "Immediacy Checks Top Level Fn With Sign" =
  let scope = [] in
  let expr =
    bl
    @@ Value
         (Function
            ( bl
            @@ { function_signature =
                   bl
                   @@ { function_attributes = [];
                        function_params = [];
                        function_returns = StructSig 0 };
                 function_impl = Fn (bl @@ Block []) } ) )
  in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| true |}]

let%expect_test "Immediacy Checks Struct Sig" =
  let scope = [] in
  let expr = bl @@ Value (Type (StructSig 0)) in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| false |}]

let%expect_test "Immediacy Checks Self Type" =
  let scope = [] in
  let expr =
    bl @@ FunctionCall (bl @@ Value Void, [bl @@ Value (Type SelfType)])
  in
  pp_sexp @@ sexp_of_bool @@ is_immediate_expr scope (default_program ()) expr ;
  [%expect {| false |}]

let%expect_test "Immediacy Checks MyInt Type" =
  let source =
    {|
      struct Cell {
        c: builtin_Cell
      }
      struct Builder {
        b: builtin_Builder
        fn serialize_int(self: Self, int: Integer, bits: Integer) -> Self {
          let b = builtin_store_int(self.b, int, bits);
          Self { b: b }
        }
      }

      struct Slice {
        s: builtin_Slice
        fn load_int(self: Self, bits: Integer) -> LoadResult(Integer) {
          let output = builtin_load_int(self.s, bits);
          let slice = Self { s: output.value1 };
          let int = output.value2;
          LoadResult(Integer) { slice: slice, value: int }
        }
      }
      struct MyInt[bits: Integer] {
        value: Integer
        impl Deserialize {
          fn deserialize(s: Slice) -> LoadResult(Self) {
            let res = s.load_int(bits);

            LoadResult(Self) {
              slice: res.slice,
              value: Self { value: res.value }
            }
          }
        }
      }
    |}
  in
  let p = Option.value_exn @@ Result.ok @@ compile source in
  let res =
    is_immediate_expr
      [List.map p.bindings ~f:make_comptime]
      p
      ( bl
      @@ FunctionCall
           ( List.Assoc.find_exn p.bindings (bl @@ "MyInt")
               ~equal:(Config.equal_located equal_string),
             [bl @@ Value (Integer (Z.of_int 123))] ) )
  in
  pp_sexp @@ sexp_of_bool res ;
  [%expect {| true |}]

let%expect_test "Immediacy Checks Unions Functions" =
  let source =
    {|
    union MsgAddressExt {
      case Integer
      fn serialize(self: Self) { }
    }
     |}
  in
  let _ = Option.value_exn @@ Result.ok @@ compile source in
  pp_sexp @@ sexp_of_bool true ;
  [%expect {| true |}]
