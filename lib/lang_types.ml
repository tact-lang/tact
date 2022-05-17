open Base

class ['s] base_map =
  object (_ : 's)
    inherit ['s] Zint.map

    inherit ['s] Asm.map
  end

class virtual ['s] base_visitor =
  object (_ : 's)
    inherit ['s] VisitorsRuntime.map

    inherit ['s] Zint.map

    inherit ['s] Asm.map
  end

type comptime_counter = (int[@sexp.opaque])

and binding = string * expr

and program = {bindings : (string * expr) list}

and expr =
  | FunctionCall of function_call
  | Reference of (string * type_)
  | Value of value
  | Asm of Asm.instr list
  | InvalidExpr

and value =
  | Void
  | Struct of struct_
  (* Instance of a Struct *)
  | StructInstance of (struct_ * (string * value) list)
  | Function of function_
  | Integer of (Zint.t[@visitors.name "z"])
  | String of string
  | Builtin of builtin
  | Type of type_

and stmt =
  | Let of (string * expr) list
  | Return of expr
  | Break of stmt
  | Expr of expr
  | Invalid

and builtin = string

and type_ =
  | TypeType
  | IntegerType
  | StringType
  | VoidType
  | BuiltinType of builtin
  | StructType of struct_
  | FunctionType of function_
  | RefType of (type_ ref[@sexp.opaque] [@equal.ignore])
  | InvalidType

and struct_ =
  { struct_fields : (string * struct_field) list;
    struct_methods : (string * function_) list;
    struct_id : (int * int[@sexp.opaque]) }

and struct_field = {field_type : type_}

and function_body = (stmt list option[@sexp.option])

and native_function =
  (program -> value list -> expr[@visitors.opaque] [@equal.ignore])

and builtin_fn = native_function * int

and function_ =
  { function_params : (string * type_) list;
    function_returns : type_;
    function_impl : function_impl }

and function_impl = Fn of function_body | BuiltinFn of builtin_fn | InvalidFn

and function_call = expr * expr list
[@@deriving
  equal,
    sexp_of,
    yojson_of,
    visitors {variety = "map"; polymorphic = true; ancestors = ["base_map"]},
    visitors {variety = "fold"; name = "visitor"; ancestors = ["base_visitor"]}]

let expr_to_type = function
  | Value (Struct s) ->
      StructType s
  | Value (StructInstance (struct_, _)) ->
      StructType struct_
  | Value (Function function_) ->
      FunctionType function_
  | Value (Builtin builtin) ->
      BuiltinType builtin
  | Value (Integer _) ->
      IntegerType
  | Value Void ->
      VoidType
  | Value (Type type_) ->
      type_
  | FunctionCall (Value (Function {function_returns; _}), _) ->
      function_returns
  | Reference (_, t) ->
      t
  | _ ->
      InvalidType

let rec is_immediate_expr = function
  | Value _ ->
      true
  | FunctionCall (_, args) ->
      are_immediate_arguments args
  | Reference _ ->
      false
  | Asm _ ->
      false
  | InvalidExpr ->
      false

and are_immediate_arguments args =
  Option.is_none (List.find args ~f:(fun a -> not (is_immediate_expr a)))

let rec builtin_fun_counter = ref 0

and builtin_fun f =
  let res = (f, !builtin_fun_counter) in
  builtin_fun_counter := !builtin_fun_counter + 1 ;
  res

let find_in_scope : 'a. string -> (string * 'a) list list -> 'a option =
 fun ref scope ->
  List.find_map scope ~f:(fun bindings ->
      Option.map
        (List.find bindings ~f:(fun (s, _) -> String.equal ref s))
        ~f:(fun (_name, a) -> a) )

(* We declare the struct counter here to count all structs *)
let struct_counter = ref 0
