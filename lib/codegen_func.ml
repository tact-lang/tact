open Base

module Make =
functor
  (Config : Config.T)
  ->
  struct
    module T = Lang_types.Make (Config)
    module F = Func
    include Errors
    open Config

    exception Invalid

    exception Unsupported

    class constructor (program : T.program) =
      object (self)
        val mutable struct_representations : (T.struct_ * F.type_) list = []

        val mutable fn_name_counter = 0

        val mutable functions : (T.function_ * F.function_) list = []

        method cg_Fn body = F.Fn (List.concat (Option.value_exn body))

        method build_Integer : Zint.t -> F.expr = fun i -> F.Integer i

        method cg_Let : _ -> F.stmt =
          fun bindings ->
            F.Vars
              (List.map bindings ~f:(fun (name, expr) ->
                   let expr = self#cg_expr expr in
                   (F.type_of expr, name, expr) ) )

        method cg_DestructuringLet : T.destructuring_let -> F.stmt =
          fun let_ ->
            let expr = let_.destructuring_let_expr in
            match T.type_of program expr with
            | StructType id ->
                let struct_ = T.Program.get_struct program id in
                let expr' = self#cg_expr expr in
                let fields =
                  List.map struct_.struct_fields
                    ~f:(fun (field_name, {field_type; _}) ->
                      match
                        List.Assoc.find let_.destructuring_let
                          ~equal:(equal_located String.equal)
                          field_name
                      with
                      | Some new_name ->
                          ( Some (self#lang_type_to_type field_type),
                            new_name.value )
                      | None ->
                          (None, "_") )
                in
                F.DestructuringBinding (fields, expr')
            | _x ->
                T.print_sexp (T.sexp_of_type_ _x) ;
                raise Invalid

        method cg_Struct : T.struct_ * (string * T.expr) list -> F.expr =
          function
          | _, [(_, expr)] ->
              self#cg_expr expr
          | _, args ->
              F.Tuple (List.map args ~f:(fun (_, expr) -> self#cg_expr expr))

        method cg_expr : T.expr -> F.expr =
          fun expr ->
            match expr.value with
            | Value (Integer i) ->
                F.Integer i
            | Value (Bool true) ->
                F.Integer (Zint.of_int (-1))
            | Value (Bool false) ->
                F.Integer Zint.zero
            | StructField x ->
                self#cg_StructField x
            | Value (Struct ({value = Value (Type (StructType id)); _}, inst))
              ->
                self#cg_Struct (T.Program.get_struct program id, inst)
            | ResolvedReference s ->
                self#cg_ResolvedReference s
            | Reference (name, ty) ->
                F.Reference (name.value, self#lang_type_to_type ty)
            | Primitive p ->
                self#cg_Primitive p
            | Value (Function f) ->
                let f' = self#add_function f in
                F.Reference (f'.function_name, F.FunctionType f')
            | FunctionCall (func, args) -> (
                let args = List.map args ~f:self#cg_expr in
                match self#cg_expr func with
                | Reference (name, F.FunctionType f) ->
                    F.FunctionCall (name, args, f.function_returns)
                | _ ->
                    raise Invalid )
            | MakeUnionVariant (expr, union) ->
                self#cg_union_variant expr union
            | Value (UnionVariant (v, u)) ->
                self#cg_union_variant {value = Value v; span = expr.span} u
            | _ ->
                raise Unsupported

        method cg_union_variant expr union =
          let e_ty = T.type_of program expr in
          let expr = self#cg_expr expr in
          let union =
            List.Assoc.find_exn program.unions union ~equal:equal_int
          in
          let (T.Discriminator discr) =
            List.Assoc.find_exn union.cases e_ty ~equal:T.equal_type_
          in
          F.Tuple [F.Integer (Z.of_int discr); expr]

        method get_discriminator : T.union -> T.type_ -> int =
          fun union ty ->
            let (T.Discriminator discr) =
              List.Assoc.find_exn union.cases ty ~equal:T.equal_type_
            in
            discr

        method cg_stmt : T.stmt -> F.stmt =
          fun stmt ->
            match stmt.value with
            | Let bindings ->
                self#cg_Let
                @@ List.map bindings ~f:(fun (n, ex) -> (n.value, ex))
            | DestructuringLet let_ ->
                self#cg_DestructuringLet let_
            | Return expr ->
                F.Return (self#cg_expr expr)
            | Expr e ->
                F.Expr (self#cg_expr e)
            | Block stmts ->
                F.Block (List.map stmts ~f:self#cg_stmt)
            | If {if_condition; if_then; if_else} ->
                F.If
                  ( self#cg_expr if_condition,
                    self#cg_stmt if_then,
                    Option.map if_else ~f:self#cg_stmt )
            | Break stmt ->
                self#cg_stmt stmt (* FIXME: this is unlikely to be correct *)
            | Switch s ->
                self#cg_switch s
            | _ ->
                raise Unsupported

        method cg_switch switch =
          let f_cond =
            F.Vars
              [(F.UnknownTuple, "temp", self#cg_expr switch.switch_condition)]
          in
          let f_discr =
            F.Vars
              [ ( F.IntType,
                  "discr",
                  F.FunctionCall
                    ("first", [Reference ("temp", F.UnknownTuple)], F.IntType)
                ) ]
          in
          let union =
            match T.type_of program switch.switch_condition with
            | UnionType u ->
                List.Assoc.find_exn program.unions u ~equal:equal_int
            | _ ->
                raise InternalCompilerError
          in
          let branches =
            List.fold (List.rev switch.branches) ~init:(F.Block [])
              ~f:(fun acc b ->
                let ty_discr = self#get_discriminator union b.value.branch_ty in
                let cond =
                  F.Operator
                    ( F.Reference ("discr", F.IntType),
                      EqualityOperator,
                      F.Integer (Z.of_int ty_discr) )
                in
                let inner =
                  F.Block
                    [ F.Vars
                        [ ( self#lang_type_to_type b.value.branch_ty,
                            b.value.branch_var.value,
                            F.FunctionCall
                              ( "second",
                                [Reference ("temp", F.UnknownTuple)],
                                F.IntType ) ) ];
                      self#cg_stmt b.value.branch_stmt ]
                in
                F.If (cond, inner, Some acc) )
          in
          F.Block [f_cond; f_discr; branches]

        method cg_function_ : string -> T.function_ -> F.function_ =
          fun name fn ->
            let body =
              match fn.value.function_impl with
              | Fn {value = Block stmts; _} ->
                  stmts
              | Fn stmt ->
                  [stmt]
              | _ ->
                  []
            in
            { function_forall = [];
              function_name = name;
              function_args =
                List.map fn.value.function_signature.value.function_params
                  ~f:(fun (name, ty) -> (name.value, self#lang_type_to_type ty));
              function_returns =
                self#lang_type_to_type
                  fn.value.function_signature.value.function_returns;
              function_body = F.Fn (List.map body ~f:self#cg_stmt) }

        method cg_top_level_stmt : string -> T.expr -> F.top_level_expr option =
          fun name expr ->
            match expr.value with
            | Value (Function f) -> (
              try Some (F.Function (self#add_function f ~name:(Some name)))
              with ex ->
                if equal_string name "deserialize_union" then raise ex else None
              )
            | _ ->
                None

        method cg_program : T.program -> F.program =
          fun program ->
            let _ =
              List.filter_map (List.rev program.bindings)
                ~f:(fun (name, top_level_stmt) ->
                  self#cg_top_level_stmt name.value top_level_stmt )
            and make_tensor_accessors (sz : int) =
              let typeargs =
                List.map ~f:(fun i -> "Value" ^ Int.to_string i)
                @@ List.range ~start:`inclusive ~stop:`inclusive 1 sz
              in
              List.map ~f:(fun i ->
                  let ret = List.nth_exn typeargs (i - 1)
                  and tensor_type =
                    F.TensorType
                      (List.map typeargs ~f:(fun ident -> F.NamedType ident))
                  in
                  F.Function
                    { function_forall = typeargs;
                      function_name =
                        "tensor" ^ Int.to_string sz ^ "_value" ^ Int.to_string i;
                      function_args = [("tensor", tensor_type)];
                      function_returns = NamedType ret;
                      function_body =
                        Fn
                          [ DestructuringBinding
                              ( List.mapi typeargs ~f:(fun i' typearg ->
                                    if Int.equal i (i' + 1) then
                                      (Some (F.NamedType typearg), "value")
                                    else (None, "_") ),
                                Reference ("tensor", tensor_type) );
                            Return (Reference ("value", NamedType ret)) ] } )
              @@ List.range ~start:`inclusive ~stop:`inclusive 1 sz
            in
            make_tensor_accessors 2
            @ List.map (List.rev functions) ~f:(fun (_, f) -> F.Function f)

        method cg_StructField : T.expr * string located * T.type_ -> _ =
          fun (from_expr, field, _) ->
            let build_access ~(tensor : int option) struct_ty field field_ty =
              match tensor with
              | None ->
                  let name =
                    match field with
                    | 0 ->
                        "first"
                    | 1 ->
                        "second"
                    | 2 ->
                        "third"
                    | 3 ->
                        "fourth"
                    | _ ->
                        raise Unsupported
                  in
                  F.FunctionCall (name, [struct_ty], field_ty)
              | Some arity ->
                  let name =
                    "tensor" ^ Int.to_string arity ^ "_value"
                    ^ Int.to_string (field + 1)
                  in
                  F.FunctionCall (name, [struct_ty], field_ty)
            in
            match T.type_of program from_expr with
            | StructType s -> (
                let s = T.Program.get_struct program s in
                match s.struct_fields with
                | [_] ->
                    self#cg_expr from_expr
                | _ ->
                    let field_id, (_, field) =
                      Option.value_exn
                        (List.findi s.struct_fields ~f:(fun _ (name, _) ->
                             equal_string name.value field.value ) )
                    in
                    build_access
                      ~tensor:
                        ( if s.tensor then Some (List.length s.struct_fields)
                        else None )
                      (self#cg_expr from_expr) field_id
                      (self#lang_type_to_type field.field_type) )
            | _ ->
                raise Invalid

        method cg_ResolvedReference : 'a. 'a * T.expr -> F.expr =
          fun (_, expr) -> self#cg_expr expr

        method cg_Primitive : T.primitive -> F.expr =
          function
          | Prim {name; exprs} ->
              F.FunctionCall (name, List.map exprs ~f:self#cg_expr, F.InferType)

        method private lang_type_to_type : T.type_ -> F.type_ =
          function
          | IntegerType ->
              F.IntType
          | BoolType ->
              F.IntType
          | StructType s ->
              self#struct_to_ty (T.Program.get_struct program s)
          | UnionType u ->
              self#create_ty_from_union
                (List.Assoc.find_exn program.unions u ~equal:equal_int)
          | BuiltinType "Builder" ->
              F.BuilderType
          | BuiltinType "Cell" ->
              F.CellType
          | BuiltinType "Slice" ->
              F.SliceType
          | HoleType | VoidType ->
              F.InferType
          | _ ->
              raise Invalid

        method private struct_to_ty : T.struct_ -> F.type_ =
          fun s ->
            match
              List.find struct_representations ~f:(fun (s', _) ->
                  T.equal_struct_ s s' )
            with
            | Some (_, ty) ->
                ty
            | None ->
                let ty = self#create_ty_from_struct s in
                struct_representations <- (s, ty) :: struct_representations ;
                ty

        method private create_ty_from_struct : T.struct_ -> F.type_ =
          function
          | {struct_fields = [(_, {field_type})]; _} ->
              self#lang_type_to_type field_type
          | {struct_fields; tensor; _} ->
              let types =
                List.map struct_fields ~f:(fun (_, {field_type}) ->
                    self#lang_type_to_type field_type )
              in
              if tensor then TensorType types else TupleType types

        method private create_ty_from_union : T.union -> F.type_ =
          function _ -> UnknownTuple

        method private add_function
            : ?name:string option -> T.function_ -> F.function_ =
          fun ?(name = None) fn ->
            let default () =
              let name =
                Option.value_or_thunk name ~default:(fun () ->
                    self#generate_func_name )
              in
              let fn' = self#cg_function_ name fn in
              functions <- (fn, fn') :: functions ;
              fn'
            in
            List.Assoc.find functions ~equal:T.equal_function_ fn
            |> Option.value_or_thunk ~default

        method private generate_func_name =
          let num = fn_name_counter in
          fn_name_counter <- fn_name_counter + 1 ;
          "f" ^ Printf.sprintf "%d" num
      end

    let codegen program =
      let constructor = new constructor program in
      constructor#cg_program program
  end
