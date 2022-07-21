open Base

exception Unsupported

(* Subset of FunC used by FunC codegen *)

type function_ =
  { function_name : ident;
    function_args : (ident * type_) list;
    function_returns : type_;
    function_body : function_body;
    function_forall : ident list }

and function_body =
  | AsmFn of Asm.instr list [@sexp.list]
  | Fn of stmt list [@sexp.list]

and stmt =
  | Vars of (type_ * ident * expr) list
  | DestructuringBinding of (type_ option * ident) list * expr
  | Assignment of (ident * expr)
  | Return of expr
  | Expr of expr
  | Block of stmt list
  | If of (expr * stmt * stmt option)

and expr =
  | Integer of Zint.t
  | Reference of (ident * type_)
  | Tuple of expr list
  | FunctionCall of (ident * expr list * type_)
  | Operator of (expr * operator * expr)

and operator = EqualityOperator

and ident = string

and type_ =
  | IntType
  | CellType
  | SliceType
  | BuilderType
  | TupleType of type_ list
  | UnknownTuple
  | TensorType of type_ list
  | FunctionType of function_
  | ContType
  | InferType
  | NamedType of ident

and top_level_expr = Function of function_ | Global of type_ * ident

and program = top_level_expr list [@@deriving sexp_of]

exception UnknownType

let rec type_of = function
  | Integer _ ->
      IntType
  | Reference (_, ty) ->
      ty
  | Tuple exprs ->
      TupleType (List.map exprs ~f:type_of)
  | FunctionCall (_, _, ty) ->
      ty
  | Operator (_, EqualityOperator, _) ->
      IntType

open Caml.Format

let list_iter ~f ~flast l =
  match (List.drop_last l, List.last l) with
  | Some rest, Some last ->
      List.iter rest ~f ; flast last
  | _ ->
      ()

let indentation = "  "

let rec pp_program f program =
  let prev_margin = pp_get_margin f () in
  let prev_indent = pp_get_max_indent f () in
  pp_set_margin f 80 ;
  pp_set_max_indent f 40 ;
  List.iter program ~f:(function
    | Function fn ->
        pp_function f fn ; pp_print_newline f ()
    | Global _ ->
        () ) ;
  pp_set_margin f prev_margin ;
  pp_set_max_indent f prev_indent

and pp_function f fn =
  pp_open_box f 4 ;
  ( match fn.function_forall with
  | [] ->
      ()
  | typeargs ->
      pp_print_string f "forall" ;
      pp_print_space f () ;
      list_iter typeargs
        ~f:(fun ident -> pp_ident f ident ; pp_print_string f ", ")
        ~flast:(pp_ident f) ;
      pp_print_space f () ;
      pp_print_string f "->" ;
      pp_print_space f () ) ;
  pp_type f fn.function_returns ;
  pp_print_space f () ;
  pp_ident f fn.function_name ;
  pp_print_string f "(" ;
  list_iter fn.function_args
    ~f:(fun (name, t) ->
      pp_type f t ;
      pp_print_space f () ;
      pp_ident f name ;
      pp_print_string f ", " )
    ~flast:(fun (name, t) -> pp_type f t ; pp_print_space f () ; pp_ident f name) ;
  pp_print_string f ")" ;
  pp_print_space f () ;
  pp_print_string f "{" ;
  pp_print_newline f () ;
  pp_function_body f indentation fn.function_body ;
  pp_print_string f "}" ;
  pp_close_box f ()

and pp_function_body f indentation = function
  | Fn stmts ->
      List.iter stmts ~f:(fun stmt ->
          pp_print_string f indentation ;
          pp_open_hovbox f 2 ;
          pp_stmt f stmt ;
          pp_close_box f () )
  | _ ->
      raise Unsupported

and pp_stmt f = function
  | Vars vars ->
      List.iter vars ~f:(fun (t, n, expr) ->
          pp_type f t ;
          pp_print_space f () ;
          pp_ident f n ;
          pp_print_space f () ;
          pp_print_string f "=" ;
          pp_print_space f () ;
          pp_expr f expr ;
          pp_print_string f ";" ;
          pp_print_newline f () )
  | DestructuringBinding (vars, expr) ->
      let tensor =
        match expr with Reference (_, TensorType _) -> true | _ -> false
      in
      pp_print_string f (if tensor then "(" else "[") ;
      list_iter vars
        ~f:(fun (t, n) ->
          ( match t with
          | Some t ->
              pp_type f t ; pp_print_space f ()
          | None ->
              () ) ;
          pp_ident f n ; pp_print_string f "," ; pp_print_space f () )
        ~flast:(fun (t, n) ->
          ( match t with
          | Some t ->
              pp_type f t ; pp_print_space f ()
          | None ->
              () ) ;
          pp_ident f n ) ;
      pp_print_string f (if tensor then ")" else "]") ;
      pp_print_space f () ;
      pp_print_string f "=" ;
      pp_print_space f () ;
      pp_expr f expr ;
      pp_print_string f ";" ;
      pp_print_newline f ()
  | Assignment (ident, expr) ->
      pp_ident f ident ;
      pp_print_space f () ;
      pp_print_string f "=" ;
      pp_print_space f () ;
      pp_expr f expr ;
      pp_print_string f ";" ;
      pp_print_newline f ()
  | Return expr ->
      pp_print_string f "return" ;
      pp_print_space f () ;
      pp_expr f expr ;
      pp_print_string f ";" ;
      pp_print_newline f ()
  | Expr expr ->
      pp_expr f expr ; pp_print_string f ";" ; pp_print_newline f ()
  | Block [stmt] ->
      pp_print_string f "{" ;
      pp_print_newline f () ;
      pp_print_string f indentation ;
      pp_open_hovbox f 2 ;
      pp_stmt f stmt ;
      pp_close_box f () ;
      pp_print_string f "}"
  | Block stmts ->
      pp_print_string f "{" ;
      pp_print_newline f () ;
      pp_print_string f indentation ;
      pp_open_hovbox f 2 ;
      List.iter stmts ~f:(pp_stmt f) ;
      pp_close_box f () ;
      pp_print_string f "}"
  | If (condition, then_, else_) ->
      pp_print_string f "if" ;
      pp_print_space f () ;
      pp_print_string f "(" ;
      pp_expr f condition ;
      pp_print_string f ")" ;
      pp_print_space f () ;
      pp_stmt f then_ ;
      Option.iter else_ ~f:(fun e ->
          pp_print_space f () ;
          pp_print_string f "else" ;
          pp_print_space f () ;
          pp_stmt f e )

and pp_expr f = function
  | Integer i ->
      pp_print_string f (Zint.to_string i)
  | Reference (ref, _) ->
      pp_ident f ref
  | FunctionCall (name, args, _) ->
      pp_print_string f name ;
      pp_print_string f "(" ;
      list_iter args
        ~f:(fun t -> pp_expr f t ; pp_print_string f ", ")
        ~flast:(pp_expr f) ;
      pp_print_string f ")"
  | Tuple tuple ->
      pp_print_string f "[" ;
      list_iter tuple
        ~f:(fun t -> pp_expr f t ; pp_print_string f ", ")
        ~flast:(pp_expr f) ;
      pp_print_string f "]"
  | Operator (left, op, right) ->
      pp_expr f left ;
      pp_print_space f () ;
      pp_operator f op ;
      pp_print_space f () ;
      pp_expr f right

and pp_operator f = function EqualityOperator -> pp_print_string f "=="

and pp_type f = function
  | IntType ->
      pp_print_string f "int"
  | CellType ->
      pp_print_string f "cell"
  | SliceType ->
      pp_print_string f "slice"
  | BuilderType ->
      pp_print_string f "builder"
  | ContType ->
      pp_print_string f "cont"
  | TupleType tuple ->
      pp_print_string f "[" ;
      list_iter tuple
        ~f:(fun (t : type_) -> pp_type f t ; pp_print_string f ", ")
        ~flast:(pp_type f) ;
      pp_print_string f "]"
  | UnknownTuple ->
      pp_print_string f "tuple"
  | TensorType tuple ->
      pp_print_string f "(" ;
      list_iter tuple
        ~f:(fun t -> pp_type f t ; pp_print_string f ", ")
        ~flast:(pp_type f) ;
      pp_print_string f ")"
  | InferType ->
      pp_print_string f "_"
  | FunctionType _ ->
      raise UnknownType
  | NamedType name ->
      pp_print_string f name

and pp_ident f i =
  match i with
  | "int" | "cell" | "slice" | "builder" | "cont" | "tuple " ->
      pp_print_string f (i ^ "_")
  | _ ->
      pp_print_string f i
