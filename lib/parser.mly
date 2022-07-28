%parameter<Config : Config.T>

%start <program> program
%start <stmt located> just_stmt

%{              
  (* This is a workaround for Dune and Menhir as discovered in https://github.com/ocaml/dune/issues/2450#issuecomment-515895672 and
   * https://github.com/ocaml/dune/issues/1504#issuecomment-434702650 that seems to fix the issue of Menhir wrongly inferring
   * the reference to Syntax.Make as Tact.Syntax.Make which makes Parser depend on Tact, which doesn't work
   *)
   module Tact = struct end
   open struct module Syntax = Syntax.Make(Config) end
   open Syntax
%}

%{
  let expand_fn_sugar params expr fn_span =
    Function (make_function_definition ~function_def_span: fn_span ~params: params
                  ~function_body:(make_function_body ~function_stmt:({value = (Expr expr); span = expr.span}) ())
                                           ())

  let remove_trailing_break stmts = 
    match List.rev stmts with
    | [] -> []
    | stmt :: rest ->
      (match Syntax.value stmt with 
        | Break s -> s
        | _ -> stmt
      ) :: rest
    |> List.rev

  let cast span (expr : expr located) (typ : expr) =
    make_located ~span ~value:
    (FunctionCall {
      fn = make_located ~span ~value:
          (Function (make_function_definition 
                              ~function_def_span: (span_of_concrete span)
                              ~params: [make_located ~span ~value: (make_located ~span ~value: (Ident "v") (), 
                                                                   make_located ~span ~value: typ ()) ()]
                              ~returns: (make_located ~span ~value: typ ())
                              ~function_body: (make_function_body ~function_stmt:({value=Return (expr); span = expr.span}) ()) 
                              ()
                    )) ();
      arguments = [expr]
    }) ()

%}

%%

(* At the very top, there's a program *)
let program :=
  | stmts = block_stmt; EOF; { make_program ~stmts: (remove_trailing_break stmts) () }
  | EOF; { make_program ~stmts: [] () }

(*
  Type, struct fields, impls and function definitions can have optional attributes:

  @attr
  @another_attr(<expr>[, ...])
*)
let attributes :=
  | attributes = list(attribute); { attributes }

let attribute :=
  | AT; attribute_ident = located(ident); 
        attribute_exprs = option(delimited_separated_trailing_list(LPAREN, located(expr), COMMA, RPAREN));
  { make_attribute ~attribute_ident ~attribute_exprs:(match attribute_exprs with None -> [] | Some attrs -> attrs) () }  

(* Binding definition

let Name = <expression>

See Expression

There is another "sugared" form of bindings for structs and functions:

```
struct S{ ... }
struct S(T: Type){v: T}
```

They are equivalent to these:

```
let S = struct { ... }
let S(T: Type) = struct {v: T}
```

Same applies to enums, interfaces, unions and fns

It's also possible to specify a valid type in let bindings:

```
let a: Int(32) = 1
```

*)
let let_binding ==
| located (
  LET;
  name = located(ident);
  typ = option(COLON; i = type_expr; { i });
  EQUALS;
  expr = located(expr);
  { let expr = Option.map (cast $loc expr) typ |> Option.value ~default: expr in
    make_binding ~binding_name: name ~binding_expr: expr () }
)
| located (
  LET;
  name = located(ident);
  params = delimited_separated_trailing_list(LPAREN, function_param, COMMA, RPAREN);
  EQUALS;
  expr = located(expr);
  { make_binding ~binding_name: name
      ~binding_expr:
      (make_located ~span: $loc ~value: (expand_fn_sugar params expr name.span) ()) 
      ()
  }
)

(* 
Let also allows to do destructuring assignment for structs:

```
let {x,y,z} = (struct { x: Integer; y: Integer; z: Integer }){x: 1, y: 2, z: 3};
```

It is also possible to rename assignments:

```
let {x as x_,y as y_,z} = (struct { x: Integer; y: Integer; z: Integer }){x: 1, y: 2, z: 3};
```

For brevity, unused fields can be omitted using `..` syntax:

```
let {x,..} = (struct { x: Integer; y: Integer; z: Integer }){x: 1, y: 2, z: 3};
```

*)
let destructuring_let_binding ==
located (
  LET;
  (fields, rest) = delimited_separated_trailing_list_followed_by(LBRACE, destructuring_field, COMMA, rest, RBRACE);
  EQUALS;
  expr = located(expr);
  { make_destructuring_binding ~destructuring_binding: (make_located ~span: $loc ~value: fields ())
      ~destructuring_binding_expr: expr
      ~destructuring_binding_rest: rest
      ()
  }

)

let destructuring_field ==
  | id = located(ident); { (id, id) }
  | id = located(ident); AS; new_id = located(ident); { (id, new_id) }

let rest ==
  r = option(DOUBLEDOT); { Option.is_some r }

let shorthand_binding(funbody) ==
| sugared_function_definition(funbody)
| located( (name, expr) = struct_definition(located(ident)); { make_binding ~binding_name: name ~binding_expr: (make_located ~span: $loc ~value: expr ())  () })
| located( ((name, params), expr) = struct_definition(located_ident_with_params); {
  make_binding ~binding_name: name ~binding_expr: (
    make_located ~span: $loc ~value: (expand_fn_sugar params (make_located ~span: $loc ~value: expr ()) name.span) ()
  ) () })
| located( (name, expr) = interface_definition(located(ident)); { make_binding ~binding_name: name ~binding_expr: (make_located ~span: $loc ~value: expr ()) () })
| located( ((name, params), expr) = interface_definition(located_ident_with_params); {
  make_binding ~binding_name: name ~binding_expr: (
    make_located ~span: $loc ~value: (expand_fn_sugar params (make_located ~span: $loc ~value: expr ()) name.span) ()
  ) () })
| located( (name, expr) = enum_definition(located(ident)); { make_binding ~binding_name: name ~binding_expr: (make_located ~span: $loc ~value: expr ()) () })
| located( ((name, params), expr) = enum_definition(located_ident_with_params); {
  make_binding ~binding_name: name ~binding_expr: ( 
    make_located ~span: $loc ~value: (expand_fn_sugar params (make_located ~span: $loc ~value: expr ()) name.span) ()
  ) () })
| located( (name, expr) = union_definition(located(ident)); { make_binding ~binding_name: name ~binding_expr: (make_located ~span: $loc ~value: expr ()) () })
| located( ((name, params), expr) = union_definition(located_ident_with_params); {
  make_binding ~binding_name: name ~binding_expr: (
    make_located ~span: $loc ~value: (expand_fn_sugar params (make_located ~span: $loc ~value: expr ()) name.span) ()
  ) () })

let located_ident_with_params ==
   ~ = located(ident);
   ~ = params;
   <>

let sugared_function_definition(funbody) ==
   | located( (name, expr) = function_definition(located(ident), funbody); { make_binding ~binding_name: name ~binding_expr: (make_located ~span: $loc ~value: expr ()) () })
   | located( ((name, params), expr) = function_definition(located_ident_with_params, funbody); {
     make_binding ~binding_name: name ~binding_expr: 
       (make_located ~span: $loc
                     ~value: (expand_fn_sugar params (make_located ~span: $loc ~value: expr ()) name.span)
                     () (* FIXME: Function type is a temp punt *)
       ) () })


(* Function definition

 fn (arg: Type, ...) [-> Type] [{
  expr
  expr
  ...
}]

*)
let function_definition(name, funbody) :=
  function_attributes = attributes;
  function_def_span = located(FN);
  n = name;
  params = delimited_separated_trailing_list(LPAREN, function_param, COMMA, RPAREN);
  returns = option(preceded(RARROW, located(fexpr)));
  body = funbody;
  { (n, Function (make_function_definition ~function_attributes ~params:params ~function_def_span: function_def_span.span ?returns:returns 
                    ?function_body:(Option.map (fun x -> make_function_body ~function_stmt: x ()) body)
                    ())) } 

let function_signature_binding ==
    (n, f) = function_definition(located(ident), nothing); {
    make_binding ~binding_name: n ~binding_expr: (make_located ~span: $loc ~value: f ()) ()
  }

let function_param ==
  located (
  ~ = located(ident);
  COLON;
  ~ = located(expr);
  <>
  )

(* Function call

   name([argument,])
   <expr>([argument,])

  * Trailing commas are allowed
*)
let function_call :=
  | fn = located(fexpr);
  arguments = delimited_separated_trailing_list(LPAREN, located(expr), COMMA, RPAREN);
  { FunctionCall (make_function_call ~fn: fn ~arguments: arguments ()) }
  | fn = located(fexpr);
  arguments = delimited_separated_trailing_list(LBRACKET, located(expr), COMMA, RBRACKET);
  { FunctionCall (make_function_call ~fn: fn ~arguments: arguments ()) }


let else_ :=
  | ELSE; ~= if_; <>
  | ELSE; c = code_block; { c }

(* If statement 

   if (boolean_expr) {
     ...
   } [else { ... }]

*)
let if_ :=
  IF;
  condition = delimited(LPAREN, located(expr), RPAREN);
  body = located(code_block);
  else_ = option(located(else_));
  { If (make_if_ ~condition ~body ?else_ ()) }

let code_block :=
  | c = delimited(LBRACE, block_stmt, RBRACE); { CodeBlock c }
  | LBRACE; RBRACE; { CodeBlock [] }

(*
  Switch stmt

  switch (<expr>) {
    case Type1 var => { <stmts> }
    case Type2 var => { <stmts> }
    ...
    [else => { <stmts> }]
  }
*)

let switch :=
  | SWITCH; LPAREN; switch_condition = located(expr); RPAREN; LBRACE;
    branches = list(located(switch_branch));
    default = option(default_branch);
    RBRACE;
    { Switch (make_switch ~switch_condition ~branches ?default ()) }

let switch_branch := 
  | CASE; 
    ty = located(type_expr);
    var = located(ident);
    REARROW;
    (* TODO: what kind of stmts should be allowed here? *)
    stmt = located(code_block);
    { make_switch_branch ~ty ~var ~stmt () }

let default_branch := 
  | ELSE; 
    REARROW;
    (* TODO: what kind of stmts should be allowed here? *)
    stmt = code_block;
    { stmt } 


let block_stmt :=
  | left = located(non_semicolon_stmt); right = block_stmt;
    { left :: right }
  | left = located(semicolon_stmt); SEMICOLON; right = block_stmt; 
    { left :: right }
  | left = located(semicolon_stmt); SEMICOLON; 
    { [left] }
  | left = located(stmt);
    { [{value = (Break left); span = (span left)}] }


let stmt := 
  | semicolon_stmt 
  | non_semicolon_stmt

let just_stmt := 
  | stmt = located(stmt) ; EOF; { stmt }

let semicolon_stmt :=
  | ~= located(stmt_expr); <Expr>
  | ~= let_binding; <Let>
  | ~= destructuring_let_binding; <DestructuringLet>
  | RETURN; ~= located(expr); <Return>

let non_semicolon_stmt :=
  | ~= shorthand_binding(some(located(code_block))); <Let>
  | if_
  | code_block
  | switch

(* Type expression
  
   Difference between type expression and simple expression is that in type expression
   it is not allowed to use exprs with brackets such as `if {}`, `type {}` and `fn() {}`.
 
*)
let type_expr :=
  (* can be any expr delimited by () *)
  | expr = delimited(LPAREN, expr_, RPAREN); {expr}
  (* can be an ident *)
  | ~= located(ident); <Reference>
  (* can be a function call *)
  | function_call

(* Expression that is valid in the statement *)
let stmt_expr :=
 | expr_
 (* can be access to the field via dot *)
 | from_expr = located(expr); DOT; to_field = located(ident); 
    {FieldAccess (make_field_access ~from_expr ~to_field ())}
| receiver = located(expr); DOT; 
  receiver_fn = located(ident);
  receiver_arguments = delimited_separated_trailing_list(LPAREN, located(expr), COMMA, RPAREN);
    {MethodCall (make_method_call ~receiver ~receiver_fn ~receiver_arguments ())}
 (* can be a type constructor *)
 | struct_constructor
 (* can be a function definition *)
 | (_, f) = function_definition(nothing, some(located(code_block))); { f }


(* Expression *)
let expr :=
 | expr_
 (* can be access to the field via dot *)
 | from_expr = located(expr); DOT; to_field = located(ident); 
    {FieldAccess (make_field_access ~from_expr ~to_field ())}
| receiver = located(expr); DOT; 
  receiver_fn = located(ident);
  receiver_arguments = delimited_separated_trailing_list(LPAREN, located(expr), COMMA, RPAREN);
    {MethodCall (make_method_call ~receiver ~receiver_fn ~receiver_arguments ())}
 (* can be a type constructor *)
 | struct_constructor
 (* can be a function definition *)
 | (_, f) = function_definition(nothing, option(located(code_block))); { f }

let fexpr :=
 | expr_
  (* can be a type constructor, in parens *)
 | delimited(LPAREN, struct_constructor, RPAREN)
 (* can be a function definition, in parens *)
 | (_, f) = delimited(LPAREN, function_definition(nothing, nothing), RPAREN); { f }

 let expr_ ==
 (* can be a `struct` definition *)
 | (n, s) = struct_definition(option(params)); { 
    match n with 
    | None -> s 
    | Some(params) -> (
        expand_fn_sugar params 
        (make_located ~value: s ~span: $loc ())
        (span_of_concrete $loc)) }
  (* can be an `interface` definition *)
 | (_, i) = interface_definition(nothing); { i }
 (* can be an `enum` definition *)
 | (_, e) = enum_definition(nothing); { e }
 (* can be an `union` definition *)
 | (_, u) = union_definition(nothing); { u }
 (* can be an identifier, as a reference to some identifier *)
 | ~= located(ident); <Reference>
 (* can be a function call *)
 | function_call
 (* can be an integer *)
 | ~= INT; <Int>
 (* can be a boolean *)
 | ~= BOOL; <Bool>
 (* can be a string *)
 | ~= STRING; <String>
 (* can be mutation ref *)
 | TILDE; ~= located(ident); <MutRef>

let params ==
    delimited_separated_trailing_list(LBRACKET, function_param, COMMA, RBRACKET)

(* Struct

   struct {
    field_name: <type expression>
    ...
    
    fn name(...) -> ... { ... }
    ...
  }

  * Empty structs are allowed

*)
let struct_definition(name) ==
  struct_attributes = attributes;
  struct_span = located(STRUCT);
  n = name;
  LBRACE;
  items = list(struct_item);
  RBRACE;
  { (n, Struct (make_struct_definition ~struct_attributes 
                  ~fields:(List.filter_map (function `Field f -> Some f | _ -> None) items)
                  ~struct_bindings: (List.filter_map (function `Binding b -> Some b | _ -> None) items)
                  ~impls:(List.filter_map (function `Impl i -> Some i | _ -> None) items) ~struct_span: struct_span.span  ())) }

let struct_item ==
    | f = struct_field; { `Field f }
    | b = sugared_function_definition(option(located(code_block))); { `Binding b }
    | i = impl; { `Impl i }

let impl == 
  impl_attributes = attributes;
  IMPL; 
  interface = located(fexpr); 
  LBRACE;
  methods = list(sugared_function_definition(option(located(code_block))));
  RBRACE;
  { make_impl ~impl_attributes ~interface ~methods () }

(* Struct field

   field_name: <type expression>
*)
let struct_field ==
| located ( 
  field_attributes = attributes;
  name = located(ident); COLON; typ = located(expr); option(SEMICOLON); { make_struct_field ~field_attributes ~field_name: name ~field_type: typ () } )

(* Struct constructor 
 *
 * MyStruct {
 *   field_name: 1
 * }
 *
 * *)
let struct_constructor :=
  constructor_id = located(type_expr);
  fields_construction = delimited_separated_trailing_list(
    LBRACE, 
    separated_pair(
      located(ident), 
      COLON, 
      located(expr)
    ), 
    COMMA, 
    RBRACE);
  {StructConstructor (make_struct_constructor ~constructor_id ~fields_construction ())}

(* Interface

   interface {
     fn name(...) -> Type
   }

*) 

let interface_definition(name) ==
  interface_attributes = attributes;
  INTERFACE;
  n = name;
  bindings = delimited(LBRACE, list(located(function_signature_binding)), RBRACE);
  { (n, Interface (make_interface_definition ~interface_attributes ~interface_members: bindings ())) }

(* Identifier *)
let ident ==
  ~= IDENT ; <Ident>

(* Enum

  enum {
    member,
    member = expr,
    ...
    fn name(...) -> ... { ... }
    ...

  }

  * Empty enums are allowed
  * Trailing commas are allowed
  * exprs must evaluate to integers

*)
let enum_definition(name) ==
  enum_attributes = attributes;
  ENUM;
  n = name;
  (members, bindings) = delimited_separated_trailing_list_followed_by(LBRACE, enum_member, COMMA, list(sugared_function_definition(option(located(code_block)))), RBRACE);
  { (n, Enum (make_enum_definition ~enum_attributes ~enum_members: members ~enum_bindings: bindings ())) }

 (* Enum member

    Can be an identifier alone or `identifier = expr` where expr
    must evaluate to integers
*)
let enum_member ==
| located ( name = located(ident); { make_enum_member ~enum_name: name () } )
| located ( name = located(ident); EQUALS; value = located(expr); { make_enum_member ~enum_name: name ~enum_value: value () } )

(* Union

  union {
    case member_type
    case member_type
    ...

    fn name(...) -> ... { ... }
    ...

  }

  * Empty unions are allowed

*)
let union_definition(name) ==
  union_attributes = attributes;
  union_span = located(UNION);
  n = name;
  LBRACE;
  items = list(union_item);
  RBRACE;
  { (n, Union (make_union_definition ~union_attributes ~union_span: union_span.span
                 ~union_members:(List.filter_map (function `Case c -> Some c | _ -> None) items)
                 ~union_bindings:(List.filter_map (function `Binding b -> Some b | _ -> None) items)
                 ~union_impls:(List.filter_map (function `Impl i -> Some i | _ -> None) items)
                  ())) }

let union_item ==
    | case = preceded(CASE, located(expr)); { `Case case }
    | b = sugared_function_definition(option(located(code_block))); { `Binding b }
    | i = impl; { `Impl i }

(* Delimited list, separated by a separator that may have a trailing separator *)
let delimited_separated_trailing_list(opening, x, sep, closing) ==
 | l = delimited(opening, nonempty_list(terminated(x, sep)), closing); { l }
 | l = delimited(opening, separated_list(sep, x), closing); { l }

(* Delimited list, separated by a separator that may have a trailing separator and followed by something else *)
let delimited_separated_trailing_list_followed_by(opening, x, sep, next, closing) ==
 | opening; ~ = nonempty_list(terminated(x, sep)); ~ = next; closing; <>
 | opening; ~ = separated_list(sep, x); ~ = next; closing; <>

(* Wraps into an `'a located` record *)
let located(x) ==
  ~ = x; { make_located ~span: $loc ~value: x () }

let nothing == { None }

let some(x) == ~ = x; <Some>
