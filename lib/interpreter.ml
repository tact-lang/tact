open Base
open Errors

module Make =
functor
  (Config : Config.T)
  ->
  struct
    open Lang_types.Make (Config)

    open Config
    module Discriminator = Discriminator.Make (Config)

    type error =
      [ `UnresolvedIdentifier of string located
      | `UninterpretableStatement of stmt
      | `UnexpectedType of type_
      | `FieldNotFound of expr * string located
      | `ArgumentNumberMismatch
      | `DuplicateVariant of type_ * (span[@equal.ignore] [@sexp.opaque]) ]
    [@@deriving equal, sexp_of]

    let get_memoized_or_execute p (f, args) ~execute =
      match
        List.Assoc.find p.memoized_fcalls (f, args)
          ~equal:(fun (f1, args1) (f2, args2) ->
            equal_value f1 f2 && equal_list equal_value args1 args2 )
      with
      | Some v ->
          v
      | None ->
          let res = execute f args in
          p.memoized_fcalls <- ((f, args), res) :: p.memoized_fcalls ;
          res

    type ctx =
      { program : program;
        mutable scope : tbinding list list ref;
        mutable updated_items : (int * int) list;
        mutable updated_unions : (int * int) list;
        mutable functions : int }

    let make_ctx program scope functions =
      {program; scope; updated_items = []; updated_unions = []; functions}

    (*TODO: type checks for arguments*)
    class interpreter (ctx : ctx) (errors : _ errors)
      (partial_evaluate : ctx -> function_ -> function_) =
      object (self)
        val mutable ctx = ctx

        val mutable return = Void

        val mutable adding_structs = []

        val mutable errors = errors

        method interpret_stmt_list : stmt list -> value =
          fun stmts ->
            match stmts with
            | [] ->
                return
            | stmt :: rest ->
                self#interpret_stmt stmt rest

        method interpret_stmt stmt rest =
          match stmt.value with
          | Let binds -> (
              let values =
                List.map binds ~f:(fun (_, arg) ->
                    {value = Value (self#interpret_expr arg); span = arg.span} )
              in
              match
                List.zip (List.map binds ~f:(fun (name, _) -> name)) values
              with
              | Ok args_scope ->
                  self#with_vars
                    (List.map args_scope ~f:(fun (name, v) ->
                         (name, Comptime v) ) )
                    (fun _ -> self#interpret_stmt_list rest)
              | _ ->
                  errors#report `Error `ArgumentNumberMismatch () ;
                  Void )
          | DestructuringLet let_ ->
              let struct_expr =
                self#interpret_expr let_.destructuring_let_expr
              in
              let args_scope =
                List.map let_.destructuring_let ~f:(fun (name, new_name) ->
                    let expr =
                      { value =
                          StructField
                            ( {value = Value struct_expr; span = new_name.span},
                              name,
                              HoleType );
                        span = new_name.span }
                    in
                    ( new_name,
                      Comptime
                        { value = Value (self#interpret_expr expr);
                          span = new_name.span } ) )
              in
              self#with_vars args_scope (fun _ -> self#interpret_stmt_list rest)
          | Assignment {assignment_ident; assignment_expr; _} ->
              let span = span assignment_expr |> span_to_concrete in
              (* Update individual bindings *)
              let rec update' = function
                | [] ->
                    None
                | (name, _) :: rest
                  when equal_located String.equal name assignment_ident ->
                    Some
                      ( make_comptime
                          ( name,
                            make_located ~span
                              ~value:
                                (Value (self#interpret_expr assignment_expr))
                              () )
                      :: rest )
                | binding :: rest -> (
                  match update' rest with
                  | Some updated ->
                      Some (binding :: updated)
                  | None ->
                      None )
              in
              (* Update binding sets *)
              let rec update = function
                | [] ->
                    errors#report `Error
                      (`UnresolvedIdentifier assignment_ident) () ;
                    []
                | binding_set :: bindings -> (
                  match update' binding_set with
                  | Some binding_set' ->
                      binding_set' :: bindings
                  | None ->
                      binding_set :: update bindings )
              in
              ctx.scope := update !(ctx.scope) ;
              self#interpret_stmt_list rest
          | Break stmt ->
              self#interpret_stmt stmt []
          | Return expr ->
              self#interpret_expr expr
          | Expr expr ->
              let expr' = self#interpret_expr expr in
              return <- expr' ;
              self#interpret_stmt_list rest
          | Block stmts ->
              self#interpret_stmt_list stmts
          | If {if_condition; if_then; if_else} -> (
              let result = self#interpret_expr if_condition in
              match result with
              | Bool true ->
                  self#interpret_stmt if_then rest
              | Bool false ->
                  Option.map if_else ~f:(fun stmt ->
                      self#interpret_stmt stmt rest )
                  |> Option.value_or_thunk ~default:(fun _ ->
                         self#interpret_stmt_list rest )
              | value ->
                  errors#report `Error
                    (`UnexpectedType
                      (type_of ctx.program
                         {value = Value value; span = if_condition.span} ) )
                    () ;
                  Void )
          | Switch {switch_condition; branches} -> (
              let cond = self#interpret_expr switch_condition in
              match cond with
              | UnionVariant (v, _) -> (
                  let v_ty =
                    type_of ctx.program
                      {value = Value v; span = switch_condition.span}
                  in
                  let correct_branch =
                    List.find branches ~f:(fun b ->
                        equal_type_ b.value.branch_ty v_ty )
                  in
                  match correct_branch with
                  | Some branch ->
                      let new_scope =
                        [ ( branch.value.branch_var,
                            Comptime
                              {value = Value v; span = switch_condition.span} )
                        ]
                      in
                      self#with_vars new_scope (fun _ ->
                          self#interpret_stmt branch.value.branch_stmt [] )
                  | None ->
                      Void )
              | _ ->
                  Void )
          | Invalid ->
              Void

        method interpret_expr : expr -> value =
          fun expr ->
            match expr.value with
            | FunctionCall fc ->
                self#interpret_fc fc
            | IntfMethodCall
                { intf_instance;
                  intf_def;
                  intf_method = method_name, _ty;
                  intf_args;
                  intf_loc } -> (
                let ty =
                  match self#interpret_expr intf_instance with
                  | Type t ->
                      t
                  | _ ->
                      raise InternalCompilerError
                in
                match Program.find_impl_intf ctx.program intf_def ty with
                | Some impl ->
                    let method_ =
                      List.find_map_exn impl.impl_methods
                        ~f:(fun (name, impl) ->
                          if equal_string name.value method_name then Some impl
                          else None )
                    in
                    self#interpret_fc
                      ( {value = Value (Function method_); span = intf_loc},
                        intf_args )
                | None ->
                    raise InternalCompilerError )
            | StructSigMethodCall
                { st_sig_call_instance;
                  st_sig_call_def;
                  st_sig_call_method = method_name, _ty;
                  st_sig_call_args;
                  st_sig_call_kind = _;
                  st_sig_call_span } -> (
                let ty =
                  match self#interpret_expr st_sig_call_instance with
                  | Type t ->
                      t
                  | _ ->
                      raise InternalCompilerError
                in
                match Program.find_impl_intf ctx.program st_sig_call_def ty with
                | Some impl ->
                    let method_ =
                      List.find_map_exn impl.impl_methods
                        ~f:(fun (name, impl) ->
                          if equal_string name.value method_name then Some impl
                          else None )
                    in
                    self#interpret_fc
                      ( { value = Value (Function method_);
                          span = st_sig_call_span },
                        st_sig_call_args )
                | None ->
                    raise InternalCompilerError )
            | ResolvedReference (_, expr') ->
                self#interpret_expr expr'
            | Reference (name, _) -> (
              match self#find_ref name.value with
              | Some expr' ->
                  self#interpret_expr expr'
              | None ->
                  errors#report `Error (`UnresolvedIdentifier name) () ;
                  Void )
            | StructField (struct_, field, _) -> (
              match self#interpret_expr struct_ with
              | Struct (struct_, struct') -> (
                match
                  List.Assoc.find struct' ~equal:String.equal field.value
                with
                | Some field ->
                    self#interpret_expr field
                | None ->
                    errors#report `Error (`FieldNotFound (struct_, field)) () ;
                    Void )
              | other ->
                  errors#report `Error
                    (`UnexpectedType
                      (type_of ctx.program
                         {value = Value other; span = struct_.span} ) )
                    () ;
                  Void )
            | Value value ->
                self#interpret_value value
            | MakeUnionVariant (expr, union) ->
                (* We assume that input of interpreter is always type-checked,
                   so we do not need to check if union can be built from the expr. *)
                let data = self#interpret_expr expr in
                UnionVariant (data, union)
            | MkStructDef {mk_struct_fields; mk_struct_details} ->
                let struct_fields =
                  List.map mk_struct_fields ~f:(fun (name, field_type) ->
                      ( name,
                        { field_type =
                            expr_to_type ctx.program
                              { value = Value (self#interpret_expr field_type);
                                span = field_type.span } } ) )
                in
                let s =
                  Program.with_id ctx.program
                    (fun id ->
                      { struct_fields;
                        struct_details =
                          { uty_methods = [];
                            uty_impls = [];
                            uty_id = id;
                            uty_base_id = mk_struct_details.mk_id };
                        tensor = false } )
                    (fun s_base ->
                      let id = s_base.struct_details.uty_id in
                      let details =
                        self#interpret_uty_details mk_struct_details
                          (StructType id) id expr.span
                      in
                      {struct_fields; struct_details = details; tensor = false}
                      )
                in
                Type (StructType s.struct_details.uty_id)
            | MkUnionDef {mk_cases; mk_union_details} ->
                let cases =
                  List.map mk_cases ~f:(fun ex ->
                      let ty = self#interpret_expr ex in
                      expr_to_type ctx.program {value = Value ty; span = ex.span} )
                  |> self#check_unions_for_doubled_types expr.span
                in
                let u =
                  Program.with_union_id ctx.program
                    (fun id ->
                      { cases =
                          Discriminator.LocalDiscriminators
                          .choose_discriminators () id cases;
                        union_details =
                          { uty_methods = [];
                            uty_impls = [];
                            uty_id = id;
                            uty_base_id = mk_union_details.mk_id } } )
                    (fun u_base ->
                      let id = u_base.union_details.uty_id in
                      let details =
                        self#interpret_uty_details mk_union_details
                          (UnionType id) id expr.span
                      in
                      { cases =
                          Discriminator.LocalDiscriminators
                          .choose_discriminators () id cases;
                        union_details = details } )
                in
                Type (UnionType u.union_details.uty_id)
            | MkInterfaceDef {mk_interface_methods} ->
                let partial_evaluate_type ty =
                  match
                    is_immediate_expr !(ctx.scope) ctx.program
                      {value = Value (Type ty); span = expr.span}
                  with
                  | true ->
                      self#interpret_type ty
                  | false ->
                      ty
                in
                let intf =
                  { interface_methods =
                      List.map mk_interface_methods ~f:(fun (name, sign) ->
                          ( name,
                            { function_params =
                                List.map sign.value.function_params
                                  ~f:(fun (pname, ty) ->
                                    (pname, partial_evaluate_type ty) );
                              function_returns =
                                partial_evaluate_type
                                  sign.value.function_returns }
                            |> fun sign' -> {value = sign'; span = sign.span} ) )
                  }
                in
                let intf_ty = Program.insert_interface ctx.program intf in
                Type intf_ty
            | MkFunction f ->
                Function (self#interpret_function f)
            | Primitive _ | InvalidExpr | Hole ->
                errors#report `Error
                  (`UninterpretableStatement
                    {value = Expr expr; span = expr.span} )
                  () ;
                Void

        method interpret_uty_details (mk : mk_details) ty uty_id span =
          let uty_expr = {value = Value (Type ty); span} in
          let prev_updated_items = ctx.updated_items in
          ctx.updated_items <- (mk.mk_id, uty_id) :: ctx.updated_items ;
          let self_name = {value = "Self"; span = mk.mk_span} in
          let uty_methods =
            List.map mk.mk_methods ~f:(fun (name, fn) ->
                let output =
                  self#with_vars
                    [(self_name, Comptime uty_expr)]
                    (fun _ ->
                      match self#interpret_expr fn with
                      | Function f ->
                          f
                      | _ ->
                          raise InternalCompilerError )
                in
                (name, output) )
          in
          let uty_impls =
            List.map mk.mk_impls ~f:(fun impl ->
                self#with_vars
                  [(self_name, Comptime uty_expr)]
                  (fun _ ->
                    { impl_interface =
                        Value.unwrap_intf_id
                          (self#interpret_expr impl.mk_impl_interface);
                      impl_methods =
                        List.map impl.mk_impl_methods ~f:(fun (n, x) ->
                            (n, Value.unwrap_function (self#interpret_expr x)) )
                    } ) )
          in
          let out = {uty_methods; uty_impls; uty_id; uty_base_id = mk.mk_id} in
          ctx.updated_items <- prev_updated_items ;
          out

        method interpret_struct_sig sign =
          match List.Assoc.find ctx.updated_items sign ~equal:equal_int with
          | Some new_id ->
              StructType new_id
          | None ->
              StructSig sign

        method interpret_union_sig sign =
          match List.Assoc.find ctx.updated_unions sign ~equal:equal_int with
          | Some new_id ->
              UnionType new_id
          | None ->
              UnionSig sign

        method interpret_type : type_ -> type_ =
          function
          | ExprType ex -> (
            match self#interpret_expr ex with
            | Type t ->
                t
            | Void ->
                VoidType
            | ex2 ->
                print_sexp (sexp_of_value ex2) ;
                raise InternalCompilerError )
          | StructSig sign ->
              self#interpret_struct_sig sign
          | UnionSig sign ->
              self#interpret_union_sig sign
          | ty ->
              ty

        (* TBD: previously we defined value as "atom" which cannot be interpreted, but below
           we interpret values. Should we move `Type`, `Struct` and `Function` to the `expr` type?*)
        method interpret_value : value -> value =
          fun value ->
            match value with
            | Type ty ->
                Type (self#interpret_type ty)
            | Struct (s, fields) ->
                Struct
                  ( s,
                    List.map fields ~f:(fun (n, f) ->
                        ( n,
                          {value = Value (self#interpret_expr f); span = f.span}
                        ) ) )
            | Function f ->
                Function (self#interpret_function f)
            | value ->
                value

        method interpret_function = partial_evaluate ctx

        method interpret_fc : function_call -> value =
          fun (func, args) ->
            let f = self#interpret_expr func in
            let args' = List.map args ~f:(fun arg -> self#interpret_expr arg) in
            let mk_err =
              Expr {value = FunctionCall (func, args); span = func.span}
            in
            let args_to_list params values =
              match
                List.zip (List.map params ~f:(fun (name, _) -> name)) values
              with
              | Ok scope ->
                  Ok scope
              | _ ->
                  Error mk_err
            in
            get_memoized_or_execute ctx.program (f, args')
              ~execute:(fun f args' ->
                match f with
                | Function f -> (
                  match f.value with
                  | { function_signature = {value = {function_params; _}; _};
                      function_impl = Fn function_impl;
                      _ } -> (
                      let args_scope = args_to_list function_params args' in
                      match args_scope with
                      | Ok args_scope ->
                          let new_scope =
                            List.map args_scope ~f:(fun (name, ex) ->
                                ( name,
                                  Comptime {value = Value ex; span = f.span} ) )
                          in
                          self#with_vars new_scope (fun _ ->
                              self#interpret_stmt function_impl [] )
                      | Error _ ->
                          Void )
                  | {function_impl = BuiltinFn (function_impl, _); _} ->
                      let value = function_impl ctx.program args' in
                      value )
                | _ ->
                    Void )

        method private find_ref : string -> expr option =
          fun ref ->
            match find_in_scope ref !(ctx.scope) with
            | Some (Comptime ex) ->
                Some ex
            | Some (Runtime ty) ->
                print_sexp (sexp_of_string ref) ;
                print_sexp (sexp_of_type_ ty) ;
                raise Errors.InternalCompilerError
            | None ->
                raise Errors.InternalCompilerError

        method private check_unions_for_doubled_types
            : span -> type_ list -> type_ list =
          fun span xs ->
            List.fold xs ~init:[] ~f:(fun acc x ->
                match List.exists acc ~f:(equal_type_ x) with
                | true ->
                    errors#report `Error (`DuplicateVariant (x, span)) () ;
                    acc
                | false ->
                    x :: acc )

        method private with_vars : 'a. tbinding list -> (unit -> 'a) -> 'a =
          fun vars f ->
            let prev_scope = !(ctx.scope) in
            ctx.scope := vars :: prev_scope ;
            let output = f () in
            ctx.scope := prev_scope ;
            output
      end
  end
