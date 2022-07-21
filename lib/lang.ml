open Base

module Make =
functor
  (Config : Config.T)
  ->
  struct
    open Errors
    open Config
    module Builtin = Builtin.Make (Config)
    module Lang_types = Lang_types.Make (Config)
    include Lang_types

    open Interpreter.Make (Config)

    open Type_check.Make (Config)

    module Syntax = Syntax.Make (Config)

    open Partial_evaluator.Make (Config)

    type error =
      [ `DuplicateField of string located * mk_struct
      | `UnresolvedIdentifier of string located
      | `MethodNotFound of expr * string located
      | `UnexpectedType of type_
      | `TypeError of type_ * type_
      | `ExpectedFunction of type_
      | `UnallowedReturn of expr
      | `OnlyFunctionIsAllowed
      | `MissingField of type_ * string located
      | `FieldNotFoundF of string located ]
    [@@deriving equal, sexp_of]

    include Builtin

    class ['s] self_type_updater (new_ty : type_) =
      object (_ : 's)
        inherit ['s] map

        method! visit_SelfType _ = new_ty
      end

    class ['s] constructor ?(program = default_program ()) (errors : _ errors) =
      object (s : 's)
        inherit ['s] Syntax.visitor as super

        method get_errors = errors

        (* Bindings in scope *)
        val current_bindings = ref [List.map program.bindings ~f:make_comptime]

        val type_checker = new type_checker errors 0

        (* Are we inside of a function body? How deep? *)
        val mutable functions = 0

        (* TODO: can we remove duplicating bindings here and the above? *)
        (* Program handle we pass to builtin functions. *)
        val mutable program = program

        method build_CodeBlock _env code_block = Block code_block

        method! visit_CodeBlock env block =
          s#with_bindings [] (fun _ -> super#visit_CodeBlock env block)

        method build_Enum _env _enum = InvalidExpr

        method build_FieldAccess _env fieldaccess = StructField fieldaccess

        method build_Function _env fn = MkFunction fn

        method build_FunctionCall _env (f, args) =
          let span =
            merge_spans f.span (merge_spans_list @@ List.map args ~f:span)
          in
          match type_of program f with
          | FunctionType sign -> (
              let no_errors = ref true in
              let types_satisfying =
                List.map2 sign.value.function_params args
                  ~f:(fun (_, expected) expr ->
                    match s#check_type ~expected expr with
                    | Ok _ ->
                        expr
                    | Error (NeedFromCall func) ->
                        let s = FunctionCall (func, [expr]) in
                        {value = s; span = expr.span}
                    | _ ->
                        errors#report `Error
                          (`TypeError (expected, type_of program expr))
                          () ;
                        no_errors := false ;
                        {value = Value Void; span = expr.span} )
              in
              match types_satisfying with
              | Ok args' when !no_errors ->
                  let fc = (f, args') in
                  if
                    is_immediate_expr !current_bindings program
                      {value = FunctionCall (f, args'); span}
                  then
                    let fc =
                      let inter =
                        new interpreter
                          (make_ctx program current_bindings functions)
                          errors s#partial_evaluate_fn
                      in
                      let fc = inter#interpret_fc fc in
                      fc
                    in
                    Value fc
                  else FunctionCall fc
              | _ ->
                  Value Void )
          | ty ->
              errors#report `Error (`ExpectedFunction ty) () ;
              Value Void

        method build_MethodCall _env mc = mc

        method build_Ident _env string_ = string_

        method build_If _env if_ = If if_

        method build_Int _env i = Value (Integer i)

        method build_Bool _env b = Value (Bool b)

        method build_String _env s = Value (String s)

        method build_Interface _env intf = MkInterfaceDef intf

        method build_Let : _ -> (string located * expr) located -> _ =
          fun _env let_ ->
            let amend_bindings binding = function
              | [] ->
                  [[binding]]
              | bindings :: rest ->
                  (binding :: bindings) :: rest
            in
            let name, expr = Syntax.value let_ in
            match is_immediate_expr !current_bindings program expr with
            | true ->
                current_bindings :=
                  amend_bindings (make_comptime (name, expr)) !current_bindings ;
                Let [(name, expr)]
            | false ->
                let ty = type_of program expr in
                current_bindings :=
                  amend_bindings (make_runtime (name, ty)) !current_bindings ;
                Let [(name, expr)]

        method build_DestructuringLet _env let_ =
          let amend_bindings binding = function
            | [] ->
                [[binding]]
            | bindings :: rest ->
                (binding :: bindings) :: rest
          in
          let let_ = Syntax.value let_ in
          let st_ty = type_of program let_.destructuring_let_expr in
          let fields =
            match st_ty with
            | StructType id ->
                (Program.get_struct program id).struct_fields
                |> List.map ~f:(fun (n, ty) -> (n, ty.field_type))
            | ExprType ex -> (
              match type_of program ex with
              | StructSig id ->
                  (Arena.get program.struct_signs id).st_sig_fields
                  |> List.map ~f:(fun (n, exty) ->
                         (n, expr_to_type program exty) )
              | _ ->
                  raise InternalCompilerError )
            | _ ->
                raise InternalCompilerError
          in
          (* Check if field names are correct *)
          List.iter let_.destructuring_let ~f:(fun (name, name2) ->
              match
                List.find fields ~f:(fun (n, _) ->
                    String.equal n.value name.value )
              with
              | Some (_, ty) ->
                  current_bindings :=
                    amend_bindings (make_runtime (name2, ty)) !current_bindings
              | _ ->
                  errors#report `Error
                    (`FieldNotFound
                      ({value = Value (Type st_ty); span = name2.span}, name) )
                    () ) ;
          (* If rest of fields are not ignored, check for completeness *)
          if let_.destructuring_let_rest then ()
          else
            List.iter fields ~f:(fun (name, _) ->
                if
                  List.Assoc.find let_.destructuring_let
                    ~equal:(equal_located String.equal)
                    name
                  |> Option.is_some
                then ()
                else errors#report `Error (`MissingField (st_ty, name)) () ) ;
          DestructuringLet let_

        method build_Assignment _env assignment =
          let {assignment_ident; assignment_expr; _} = assignment in
          let ty = type_of program assignment_expr in
          (* Update individual bindings *)
          let rec update' = function
            | [] ->
                None
            | (name, Comptime _) :: rest
              when equal_located String.equal name assignment_ident ->
                Some (make_comptime (name, assignment_expr) :: rest)
            | (name, Runtime _ty) :: rest
              when equal_located String.equal name assignment_ident ->
                Some (make_runtime (name, ty) :: rest)
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
                errors#report `Error (`UnresolvedIdentifier assignment_ident) () ;
                []
            | binding_set :: bindings -> (
              match update' binding_set with
              | Some binding_set' ->
                  binding_set' :: bindings
              | None ->
                  binding_set :: update bindings )
          in
          match is_immediate_expr !current_bindings program assignment_expr with
          | true ->
              current_bindings := update !current_bindings ;
              Assignment assignment
          | false ->
              Assignment assignment

        method build_MutRef _env _mutref = InvalidExpr

        method build_Reference : _ -> string located -> _ =
          fun _ ref ->
            match find_in_scope ref.value !current_bindings with
            | Some (Runtime ty) ->
                Reference (ref, ty)
            | Some (Comptime ex) ->
                ResolvedReference (ref, ex)
            | None ->
                errors#report `Error (`UnresolvedIdentifier ref) () ;
                Value Void

        method build_Return _env return =
          let typecheck =
            if functions = 0 then Ok VoidType
            else
              type_checker#check_return_type return ~program ~current_bindings
          in
          match typecheck with
          | Ok _ ->
              Return return
          | Error (NeedFromCall func) ->
              Return {value = FunctionCall (func, [return]); span = return.span}
          | Error (TypeError fn_returns) ->
              errors#report `Error
                (`TypeError (fn_returns, type_of program return))
                () ;
              Return return

        method build_Break _env stmt =
          match stmt.value with
          | Expr ex -> (
            match functions with
            | 0 ->
                raise InternalCompilerError
            | _ -> (
              match
                type_checker#check_return_type ex ~program ~current_bindings
              with
              | Ok _ ->
                  Break stmt
              | Error (NeedFromCall func) ->
                  Break
                    { value =
                        Expr
                          {value = FunctionCall (func, [ex]); span = stmt.span};
                      span = stmt.span }
              | Error (TypeError fn_returns) ->
                  errors#report `Error
                    (`TypeError (fn_returns, type_of program ex))
                    () ;
                  Break stmt ) )
          | _ ->
              Break stmt

        method build_Switch _ s = Switch s

        method build_switch_branch _env _ _ _ = raise InternalCompilerError

        method! visit_switch_branch env b =
          let ty =
            expr_to_type program @@ s#visit_located s#visit_expr env b.ty
          in
          let ref = s#visit_located s#visit_ident env b.var in
          let stmt =
            s#with_bindings
              [make_runtime (ref, ty)]
              (fun _ ->
                let stmt = s#visit_located s#visit_stmt env b.stmt in
                stmt )
          in
          {branch_ty = ty; branch_var = ref; branch_stmt = stmt}

        method build_switch _env cond branches _default =
          {switch_condition = cond; branches}

        method build_Struct _env s = MkStructDef s

        method build_StructConstructor _env sc = Value (Struct sc)

        method build_Union _env union = MkUnionDef union

        method build_Expr _env expr = Expr expr

        method build_impl _env intf bindings =
          { mk_impl_interface = intf;
            mk_impl_methods = s#of_located_list bindings }

        method! visit_expr env syntax_expr =
          let expr' = super#visit_expr env syntax_expr in
          let expr_dummy = builtin_located expr' in
          match
            is_immediate_expr !current_bindings program expr_dummy
            && equal functions 0
          with
          | true ->
              let inter =
                new interpreter
                  (make_ctx program current_bindings functions)
                  errors s#partial_evaluate_fn
              in
              let value' = inter#interpret_expr expr_dummy in
              Value value'
          | false ->
              expr'

        method build_binding _env name expr = (name, expr)

        method build_destructuring_binding _env destructuring_binding
            destructuring_let_expr destructuring_let_rest =
          { destructuring_let = Syntax.value destructuring_binding;
            destructuring_let_expr;
            destructuring_let_rest }

        method build_assignment _env assignment_ident assignment_expr =
          {assignment_ident; assignment_expr}

        method build_enum_definition _env _members _bindings = ()

        method build_enum_member _env _name _value = ()

        method build_field_access _env expr field =
          let mk_err () =
            print_sexp (sexp_of_expr expr) ;
            errors#report `Error (`FieldNotFoundF field) () ;
            ({value = Value Void; span = expr.span}, field, VoidType)
          in
          match type_of program expr with
          | StructType s -> (
              let struct_ = Program.get_struct program s in
              match
                List.Assoc.find struct_.struct_fields field
                  ~equal:(equal_located equal_string)
              with
              | Some {field_type} ->
                  (expr, field, field_type)
              | None ->
                  mk_err () )
          | ExprType ex -> (
            match type_of program ex with
            | StructSig s -> (
                let s = Arena.get program.struct_signs s in
                match
                  List.Assoc.find s.st_sig_fields field
                    ~equal:(equal_located equal_string)
                with
                | Some ty ->
                    (expr, field, expr_to_type program ty)
                | None ->
                    mk_err () )
            | _ ->
                mk_err () )
          | _ ->
              mk_err ()

        method build_function_call _env fn args = (fn, args)

        method build_method_call _env in_receiver fn args =
          let dummy : expr_kind =
            FunctionCall
              ( { value =
                    Value
                      (Function
                         { value =
                             { function_signature =
                                 { value =
                                     { function_params = [];
                                       function_returns = VoidType };
                                   span = fn.span };
                               function_impl =
                                 BuiltinFn (builtin_fun (fun _ _ -> Void)) };
                           span = fn.span } );
                  span = fn.span },
                [] )
          in
          let make_call receiver ~mk_args =
            match
              Program.methods_of program receiver
              |> fun ms ->
              List.find_map ms ~f:(fun (name, f) ->
                  if equal_string name.value fn.value then Some (name.span, f)
                  else None )
            with
            | Some (span, fn') ->
                FunctionCall
                  ( { value =
                        ResolvedReference
                          (fn, {value = Value (Function fn'); span});
                      span = fn.span },
                    mk_args args )
            | None ->
                errors#report `Error (`MethodNotFound (in_receiver, fn)) () ;
                dummy
          in
          (* TODO: check method signatures *)
          match type_of program in_receiver with
          | TypeN 0 ->
              make_call (expr_to_type program in_receiver) ~mk_args:(fun x -> x)
          | StructSig sign_id -> (
              let sign = Arena.get program.struct_signs sign_id in
              match
                List.Assoc.find sign.st_sig_methods fn
                  ~equal:(equal_located String.equal)
              with
              | Some m ->
                  StructSigMethodCall
                    { st_sig_call_instance = in_receiver;
                      st_sig_call_def = sign_id;
                      st_sig_call_method = (fn.value, m);
                      st_sig_call_args = args;
                      st_sig_call_kind = StructSigKind;
                      st_sig_call_span = fn.span }
              | None ->
                  errors#report `Error (`MethodNotFound (in_receiver, fn)) () ;
                  dummy )
          | UnionSig sign_id -> (
              let sign = Arena.get program.union_signs sign_id in
              match
                List.Assoc.find sign.un_sig_methods fn
                  ~equal:(equal_located String.equal)
              with
              | Some m ->
                  StructSigMethodCall
                    { st_sig_call_instance = in_receiver;
                      st_sig_call_def = sign_id;
                      st_sig_call_method = (fn.value, m);
                      st_sig_call_args = args;
                      st_sig_call_kind = UnionSigKind;
                      st_sig_call_span = fn.span }
              | None ->
                  errors#report `Error (`MethodNotFound (in_receiver, fn)) () ;
                  dummy )
          | InterfaceType intf_id -> (
              let intf = Program.get_intf program intf_id in
              match
                List.Assoc.find intf.interface_methods fn.value
                  ~equal:String.equal
              with
              | Some m ->
                  (*
                     Interface function can have signature with `SelfType` type
                     which is unknown at the interface definition point, but it should be
                     updated to the actual type when interface method was called.

                     Example:
                     ```
                      interface Intf { fn make() -> Self }
                      fn test(I: Intf) -> I {
                        let obj = I.make(); // Interface method has output type `SelfType`
                                            // which should be update to the `I` type.
                      }
                     ```
                  *)
                  let sign =
                    (new self_type_updater (ExprType in_receiver))
                      #visit_function_signature () m
                  in
                  IntfMethodCall
                    { intf_instance = in_receiver;
                      intf_def = intf_id;
                      intf_method = (fn.value, sign);
                      intf_args = args;
                      intf_loc = fn.span }
              | None ->
                  errors#report `Error (`MethodNotFound (in_receiver, fn)) () ;
                  dummy )
          | StructType st ->
              make_call (StructType st) ~mk_args:(fun args ->
                  in_receiver :: args )
          | UnionType ut ->
              make_call (UnionType ut) ~mk_args:(fun args ->
                  in_receiver :: args )
          | ExprType ex -> (
            (* If receiver has expr type that have type Interface, that means that
               value should implement interface, so we accept this case to allow
               such constructions:
               ```
                 fn foo(X: Intf) {
                  fn(arg: X) -> { arg.intf_method() }
                 }
               ```
               where
               type_of(arg) = ExprType(Reference("X"))
               type_of(Reference("X")) = Intf
            *)
            match type_of program ex with
            | InterfaceType intf_id -> (
                let intf = Program.get_intf program intf_id in
                match
                  List.Assoc.find intf.interface_methods fn.value
                    ~equal:String.equal
                with
                | Some m ->
                    IntfMethodCall
                      { intf_instance = ex;
                        intf_def = intf_id;
                        intf_method = (fn.value, m);
                        intf_args = in_receiver :: args;
                        intf_loc = fn.span }
                | None ->
                    errors#report `Error (`MethodNotFound (in_receiver, fn)) () ;
                    dummy )
            | StructSig sign_id -> (
                let sign = Arena.get program.struct_signs sign_id in
                match
                  List.Assoc.find sign.st_sig_methods fn
                    ~equal:(equal_located String.equal)
                with
                | Some m ->
                    StructSigMethodCall
                      { st_sig_call_instance = ex;
                        st_sig_call_def = sign_id;
                        st_sig_call_method = (fn.value, m);
                        st_sig_call_args = in_receiver :: args;
                        st_sig_call_kind = StructSigKind;
                        st_sig_call_span = fn.span }
                | None ->
                    errors#report `Error (`MethodNotFound (in_receiver, fn)) () ;
                    dummy )
            | UnionSig sign_id -> (
                let sign = Arena.get program.union_signs sign_id in
                match
                  List.Assoc.find sign.un_sig_methods fn
                    ~equal:(equal_located String.equal)
                with
                | Some m ->
                    StructSigMethodCall
                      { st_sig_call_instance = ex;
                        st_sig_call_def = sign_id;
                        st_sig_call_method = (fn.value, m);
                        st_sig_call_args = in_receiver :: args;
                        st_sig_call_kind = UnionSigKind;
                        st_sig_call_span = fn.span }
                | None ->
                    errors#report `Error (`MethodNotFound (in_receiver, fn)) () ;
                    dummy )
            | _ ->
                errors#report `Error (`UnexpectedType (ExprType ex)) () ;
                dummy )
          | receiver_ty ->
              errors#report `Error (`UnexpectedType receiver_ty) () ;
              dummy

        method! visit_function_definition env f =
          (* prepare parameter bindings *)
          let param_bindings : (string located * type_) list =
            s#of_located_list f.params
            |> List.map ~f:(fun (ident, expr) ->
                   ( s#visit_located s#visit_ident env ident,
                     s#visit_located s#visit_expr env expr ) )
            |> List.map ~f:(fun (id, expr) -> (id, expr_to_type program expr))
          in
          let function_returns =
            s#with_bindings
              (List.map param_bindings ~f:(fun (name, ty) ->
                   ( name,
                     Runtime
                       (ExprType {value = Reference (name, ty); span = name.span}
                       ) ) ) )
              (fun _ ->
                f.returns
                |> Option.map ~f:(fun x ->
                       expr_to_type program (s#visit_located s#visit_expr env x) )
                |> Option.value ~default:HoleType )
          in
          let body, fn_returns =
            s#with_bindings (List.map param_bindings ~f:make_runtime) (fun _ ->
                type_checker#with_fn_returns env function_returns (fun env' ->
                    s#visit_option s#visit_function_body env' f.function_body ) )
          in
          let function_signature =
            let sign =
              { value =
                  { function_params = param_bindings;
                    function_returns = fn_returns };
                span = f.function_def_span }
            in
            sign
          in
          { value =
              { function_signature;
                function_impl =
                  Fn
                    { value = Option.value body ~default:(Block []);
                      span = f.function_def_span } };
            span = f.function_def_span }

        method! visit_function_body env body =
          (* save the function enclosure count *)
          let functions' = functions in
          (* increment function counter *)
          functions <- functions + 1 ;
          let body =
            match body.function_stmt.value with
            | Expr ex ->
                {value = Syntax.Return ex; span = body.function_stmt.span}
            | _ ->
                body.function_stmt
          in
          (* process the body *)
          let result = super#visit_function_body env {function_stmt = body} in
          (* Convert implicit returns accomplished with an implicit last break *)
          let rec handle_returning_break stmt =
            match stmt.value with
            | Block block -> (
              match List.rev block with
              | [] ->
                  {value = Block []; span = stmt.span}
              | hd :: tl -> (
                match List.rev @@ (handle_returning_break hd :: tl) with
                | [stmt] ->
                    stmt
                | stmts ->
                    {value = Block stmts; span = stmt.span} ) )
            | Break {value = Expr expr; span} ->
                {value = Return expr; span}
            | Expr ex ->
                {value = Return ex; span = ex.span}
            | _ ->
                stmt
          in
          let result =
            handle_returning_break {value = result; span = body.span}
          in
          (* restore function enclosure count *)
          functions <- functions' ;
          result.value

        method build_function_body _env stmt = stmt.value

        method build_function_definition _ _ _ _ _ = raise InternalCompilerError

        method build_if_ _env if_condition if_then if_else =
          {if_condition; if_then; if_else}

        method build_interface_definition _env members =
          let signatures =
            List.filter_map (s#of_located_list members) ~f:(fun (name, x) ->
                match x.value with
                | Value (Function f) | MkFunction f ->
                    Some (name.value, f.value.function_signature)
                | _ ->
                    errors#report `Error `OnlyFunctionIsAllowed () ;
                    None )
          in
          {mk_interface_methods = signatures}

        method! visit_interface_definition env def =
          let value =
            s#with_bindings
              [ make_comptime
                  ( builtin_located "Self",
                    builtin_located @@ Value (Type SelfType) ) ]
              (fun _ -> super#visit_interface_definition env def)
          in
          value

        method build_program _env _stmts = {program with bindings = s#bindings}

        method build_struct_constructor _env id fields =
          match id.value with
          | ResolvedReference
              (_, ({value = Value (Type (StructType _)); _} as ty)) ->
              (ty, List.map fields ~f:(fun (name, expr) -> (name.value, expr)))
          | Value (Type (StructType _)) ->
              ( id,
                List.map fields ~f:(fun (name, expr) ->
                    (Syntax.value name, expr) ) )
          | ResolvedReference
              (_, ({value = Value (Type (StructSig _)); _} as ty)) ->
              ( ty,
                List.map fields ~f:(fun (name, expr) ->
                    (Syntax.value name, expr) ) )
          | _ -> (
            match type_of program id with
            | StructSig _ ->
                ( id,
                  List.map fields ~f:(fun (name, expr) ->
                      (Syntax.value name, expr) ) )
            | _ ->
                raise InternalCompilerError )

        method build_struct_definition _ _ _ _ = raise InternalCompilerError

        method make_struct_definition
            : (string located * expr) list -> (string located * expr) list -> _
            =
          fun struct_fields bindings impls mk_struct_id sign_id span ->
            let mk_struct_fields = struct_fields in
            let mk_methods =
              List.filter_map bindings ~f:(fun binding ->
                  let name, expr = binding in
                  match expr.value with
                  | Value (Function _) | MkFunction _ ->
                      Some (name, expr)
                  | _ ->
                      None )
            in
            let impl_methods =
              List.concat
                (List.map impls ~f:(fun impl ->
                     List.filter_map impl.mk_impl_methods ~f:(fun (name, ex) ->
                         match ex.value with
                         | Value (Function _) | MkFunction _ ->
                             Some (name, ex)
                         | _ ->
                             None ) ) )
            in
            let _ =
              Arena.update program.struct_signs sign_id ~f:(fun sign ->
                  { st_sig_fields = mk_struct_fields;
                    st_sig_methods =
                      List.Assoc.map (mk_methods @ impl_methods) ~f:(fun f ->
                          match f.value with
                          | Value (Function f) | MkFunction f ->
                              f.value.function_signature
                          | _ ->
                              raise InternalCompilerError );
                    st_sig_base_id = mk_struct_id;
                    st_sig_id = sign.st_sig_id } )
            in
            let s' =
              { mk_struct_fields;
                mk_struct_details =
                  { mk_methods = mk_methods @ impl_methods;
                    mk_impls = impls;
                    mk_id = mk_struct_id;
                    mk_sig = sign_id;
                    mk_span = span } }
            in
            (* Check for duplicate fields *)
            ( match
                List.find_a_dup mk_struct_fields
                  ~compare:(fun (name1, _) (name2, _) ->
                    String.compare name1.value name2.value )
              with
            | Some (name, _) ->
                errors#report `Error (`DuplicateField (name, s')) ()
            | None ->
                () ) ;
            s'

        method! visit_struct_definition env syn_struct_def =
          let prev_functions = functions in
          functions <- functions + 1 ;
          let fields =
            s#visit_list
              (s#visit_located s#visit_struct_field)
              env syn_struct_def.fields
            |> s#of_located_list
          in
          let sign_id, _ =
            Arena.with_id program.struct_signs ~f:(fun id ->
                { st_sig_fields = fields;
                  st_sig_methods = [];
                  st_sig_base_id = program.type_counter;
                  st_sig_id = id } )
          in
          let mk_id = program.type_counter in
          program.type_counter <- program.type_counter + 1 ;
          let mk_struct =
            let self_name =
              {value = "Self"; span = syn_struct_def.struct_span}
            in
            let methods =
              s#with_bindings
                [make_runtime (self_name, StructSig sign_id)]
                (fun _ ->
                  s#visit_list
                    (s#visit_located s#visit_binding)
                    env syn_struct_def.struct_bindings )
            in
            let impls =
              s#with_bindings
                [make_runtime (self_name, StructSig sign_id)]
                (fun _ -> s#visit_list s#visit_impl env syn_struct_def.impls)
            in
            let mk_struct =
              s#make_struct_definition fields
                (s#of_located_list methods)
                impls mk_id sign_id syn_struct_def.struct_span
            in
            { mk_struct with
              mk_struct_details =
                { mk_struct.mk_struct_details with
                  mk_id = mk_struct.mk_struct_details.mk_id } }
          in
          functions <- prev_functions ;
          mk_struct

        method build_struct_field : _ -> _ -> _ -> string located * expr =
          fun _env field_name field_type -> (field_name, field_type)

        method build_union_definition _ _ _ = raise InternalCompilerError

        method! visit_union_definition env def =
          let prev_functions = functions in
          functions <- functions + 1 ;
          let cases =
            s#visit_list (s#visit_located s#visit_expr) env def.union_members
          in
          let union_base_id = program.type_counter in
          program.type_counter <- program.type_counter + 1 ;
          let sign_id, _ =
            Arena.with_id program.union_signs ~f:(fun _ ->
                { un_sig_cases = List.map cases ~f:(expr_to_type program);
                  un_sig_methods = [];
                  un_sig_base_id = union_base_id } )
          in
          let self_name = {value = "Self"; span = def.union_span} in
          let methods =
            s#with_bindings
              [make_runtime (self_name, UnionSig sign_id)]
              (fun _ ->
                s#visit_list
                  (s#visit_located s#visit_binding)
                  env def.union_bindings )
            |> s#of_located_list
            |> List.map ~f:(fun (name, e) ->
                   match e.value with
                   | Value (Function _) | MkFunction _ ->
                       (name, e)
                   | _ ->
                       raise InternalCompilerError )
          in
          let impls =
            s#with_bindings
              [make_runtime (self_name, UnionSig sign_id)]
              (fun _ -> s#visit_list s#visit_impl env def.union_impls)
          in
          let impl_methods =
            List.concat
              (List.map impls ~f:(fun impl ->
                   List.filter_map impl.mk_impl_methods ~f:(fun (name, ex) ->
                       match ex.value with
                       | Value (Function _) | MkFunction _ ->
                           Some (name, ex)
                       | _ ->
                           None ) ) )
          in
          let convert_impls = s#make_from_impls cases union_base_id in
          let mk_union =
            { mk_cases = cases;
              mk_union_details =
                { mk_id = union_base_id;
                  mk_impls = impls @ convert_impls;
                  mk_methods = methods @ impl_methods;
                  mk_sig = sign_id;
                  mk_span = def.union_span } }
          in
          functions <- prev_functions ;
          mk_union

        method bindings =
          extract_comptime_bindings (List.concat !current_bindings)

        method make_interpreter =
          new interpreter
            (make_ctx program current_bindings functions)
            errors s#partial_evaluate_fn

        method private of_located_list : 'a. 'a Syntax.located list -> 'a list =
          List.map ~f:Syntax.value

        method private check_type ~expected actual =
          type_checker#check_type ~program ~current_bindings ~expected actual

        method private with_bindings : 'a. tbinding list -> (unit -> 'a) -> 'a =
          fun added_bindings f ->
            let current_bindings' = !current_bindings in
            current_bindings := added_bindings :: current_bindings' ;
            let result = f () in
            current_bindings := current_bindings' ;
            result

        method private make_from_impls : expr list -> int -> mk_impl list =
          fun cases union ->
            List.map cases ~f:(fun case ->
                let from_intf_ =
                  { value =
                      FunctionCall
                        ( from_intf,
                          [ { value = Value (Type (ExprType case));
                              span = case.span } ] );
                    span = case.span }
                in
                { mk_impl_interface = from_intf_;
                  mk_impl_methods =
                    [ ( {value = "from"; span = case.span},
                        s#make_from_impl_fn case union ) ] } )

        method private make_from_impl_fn case union =
          { value =
              Value
                (Function
                   { value =
                       { function_signature =
                           { value =
                               { function_params =
                                   [ ( builtin_located "v",
                                       expr_to_type program case ) ];
                                 function_returns = UnionType union };
                             span = case.span };
                         function_impl =
                           Fn
                             (builtin_located
                                (Return
                                   ( builtin_located
                                   @@ MakeUnionVariant
                                        ( builtin_located
                                          @@ Reference
                                               ( builtin_located "v",
                                                 expr_to_type program case ),
                                          union ) ) ) ) };
                     span = case.span } );
            span = case.span }

        method private partial_evaluate_fn ctx f =
          let partial_evaluator = new partial_evaluator ctx errors in
          partial_evaluator#visit_function_ () f
      end
  end
