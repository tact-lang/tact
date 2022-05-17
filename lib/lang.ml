open Base

module Make =
functor
  (Syntax : Syntax.T)
  ->
  struct
    open Errors
    include Lang_types
    open Interpreter

    type error =
      [ `DuplicateField of string * struct_
      | `UnresolvedIdentifier of string
      | `MethodNotFound of expr * string
      | `UnexpectedType of expr ]
    [@@deriving equal, sexp_of]

    include Builtin

    class ['s] constructor ((bindings, errors) : (string * expr) list * _ errors)
      =
      object (self : 's)
        inherit ['s] Syntax.visitor as super

        (* Bindings in scope *)
        val mutable current_bindings = [bindings]

        (* Bindings that will available only in runtime *)
        val mutable runtime_bindings = []

        (* Are we inside of a function body? How deep? *)
        val mutable functions = 0

        (* Program handle we pass to builtin functions *)
        val program = {bindings}

        method build_CodeBlock _env _code_block = Invalid

        method build_Enum _env _enum = InvalidExpr

        method build_FieldAccess _env _fieldaccess = InvalidExpr

        method build_Function _env fn = Value (Function fn)

        method build_FunctionCall _env (f, args) =
          let fc = (f, args) in
          if are_immediate_arguments args then
            let inter = new interpreter (current_bindings, errors, functions) in
            inter#interpret_fc fc
          else FunctionCall fc

        method build_MethodCall env mc = self#build_FunctionCall env mc

        method build_Ident _env string_ = string_

        method build_If _env _if = Invalid

        method build_Int _env i = Value (Integer i)

        method build_String _env s = Value (String s)

        method build_Interface _env _iface = InvalidExpr

        method build_Let _env let_ =
          let amend_bindings binding = function
            | [] ->
                [[binding]]
            | bindings :: rest ->
                (binding :: bindings) :: rest
          in
          let name, expr = Syntax.value let_ in
          match is_immediate_expr expr with
          | true ->
              current_bindings <- amend_bindings (name, expr) current_bindings ;
              Let [(name, expr)]
          | false ->
              let ty = expr_to_type expr in
              runtime_bindings <- amend_bindings (name, ty) runtime_bindings ;
              Let [(name, expr)]

        method build_MutRef _env _mutref = InvalidExpr

        method build_Reference env ref =
          match find_in_scope ref current_bindings with
          | Some (Reference (ref', _)) ->
              self#build_Reference env ref'
          | Some (Value value) ->
              Value value
          | Some expr ->
              Reference (ref, expr_to_type expr)
          | None -> (
            match find_in_scope ref runtime_bindings with
            | Some ty ->
                Reference (ref, ty)
            | None ->
                errors#report `Error (`UnresolvedIdentifier ref) () ;
                Reference (ref, VoidType) )

        method build_Return _env return = Return return

        method build_Break _env stmt = Break stmt

        method build_Struct _env s = Value (Struct s)

        method build_StructConstructor _env sc = Value (StructInstance sc)

        method build_Union _env _union = InvalidExpr

        method build_Expr _env expr = Expr expr

        method! visit_expr env syntax_expr =
          let expr' = super#visit_expr env syntax_expr in
          match is_immediate_expr expr' && equal functions 0 with
          | true ->
              let inter =
                new interpreter (current_bindings, errors, functions)
              in
              let value' = inter#interpret_expr expr' in
              Value value'
          | false ->
              expr'

        method build_binding _env name expr =
          (Syntax.value name, Syntax.value expr)

        method build_enum_definition _env _members _bindings = ()

        method build_enum_member _env _name _value = ()

        method build_field_access _env _expr _field = ()

        method build_function_call _env fn args =
          (Syntax.value fn, self#of_located_list args)

        method build_method_call _env receiver fn args =
          let receiver = Syntax.value receiver in
          let fn = Syntax.value fn
          and dummy : expr * expr list =
            ( Value
                (Function
                   { function_params = [];
                     function_returns = VoidType;
                     function_impl =
                       BuiltinFn (builtin_fun (fun _ _ -> Value Void)) } ),
              [] )
          in
          (* TODO: check method signatures *)
          match receiver with
          | Value (Struct struct') -> (
            match
              List.Assoc.find struct'.struct_methods ~equal:String.equal fn
            with
            | Some fn' ->
                (Value (Function fn'), self#of_located_list args)
            | None ->
                errors#report `Error (`MethodNotFound (receiver, fn)) () ;
                dummy )
          | Value (StructInstance (struct', _)) -> (
            match
              List.Assoc.find struct'.struct_methods ~equal:String.equal fn
            with
            | Some fn' ->
                (Value (Function fn'), receiver :: self#of_located_list args)
            | None ->
                errors#report `Error (`MethodNotFound (receiver, fn)) () ;
                dummy )
          | receiver ->
              errors#report `Error (`UnexpectedType receiver) () ;
              dummy

        method! visit_function_definition env f =
          (* prepare parameter bindings *)
          let param_bindings =
            self#of_located_list f.params
            |> List.map ~f:(fun (ident, expr) ->
                   ( self#visit_ident env @@ Syntax.value ident,
                     self#visit_expr env @@ Syntax.value expr ) )
            |> List.map ~f:(fun (id, expr) -> (id, expr_to_type expr))
          in
          let bindings' = runtime_bindings in
          (* inject them into current bindings *)
          runtime_bindings <- param_bindings :: runtime_bindings ;
          (* process the function definition *)
          let result = super#visit_function_definition env f in
          (* restore bindings as before entering the function *)
          runtime_bindings <- bindings' ;
          result

        method! visit_function_body env body =
          (* save the function enclosure count *)
          let functions' = functions in
          (* increment function counter *)
          functions <- functions + 1 ;
          (* new binding scope *)
          let current_bindings' = current_bindings
          and runtime_bindings' = runtime_bindings in
          current_bindings <- [] :: current_bindings ;
          runtime_bindings <- [] :: runtime_bindings ;
          (* process the body *)
          let result = super#visit_function_body env body in
          (* drop binding scope *)
          current_bindings <- current_bindings' ;
          runtime_bindings <- runtime_bindings' ;
          (* restore function enclosure count *)
          functions <- functions' ;
          result

        method build_function_body _env stmts = self#of_located_list stmts

        method build_function_definition _env _name params returns body =
          let function_params : (string * type_) list =
            self#of_located_list params
            |> List.map ~f:(fun (name, type_) ->
                   ( Syntax.value name,
                     Syntax.value type_ |> self#interpret_expr_to_type ) )
          and function_returns =
            returns
            |> Option.map ~f:(fun x -> Syntax.value x)
            |> Option.map ~f:self#interpret_expr_to_type
            |> Option.value ~default:(self#infer_return_type body)
          and function_impl = body in
          {function_params; function_returns; function_impl = Fn function_impl}

        method build_if_ _env _condition _then _else = ()

        method build_interface_definition _env _members = ()

        method build_program _env _stmts =
          {bindings = List.concat current_bindings}

        method build_struct_constructor _env id _fields =
          match Syntax.value id with
          | Value (Struct struct') ->
              (struct', []) (* TODO: handle fields *)
          | e ->
              errors#report `Error (`UnexpectedType e) () ;
              ({struct_fields = []; struct_methods = []; struct_id = (0, 0)}, [])

        method build_struct_definition _env struct_fields bindings =
          let struct_fields = self#of_located_list struct_fields
          and struct_methods =
            List.filter_map bindings ~f:(fun binding ->
                let name, expr = Syntax.value binding in
                match expr with
                | Value (Function f) ->
                    Some (name, f)
                | _ ->
                    None )
          in
          let s' =
            {struct_fields; struct_methods; struct_id = (0, !struct_counter)}
          in
          (* Check for duplicate fields *)
          ( match
              List.find_a_dup struct_fields
                ~compare:(fun (name1, _) (name2, _) ->
                  String.compare name1 name2 )
            with
          | Some (name, _) ->
              errors#report `Error (`DuplicateField (name, s')) ()
          | None ->
              () ) ;
          (* Increment next struct's ID *)
          struct_counter := !struct_counter + 1 ;
          s'

        method build_struct_field _env field_name field_type =
          ( Syntax.value field_name,
            {field_type = Syntax.value field_type |> self#expr_to_type} )

        method build_union_definition _env _members _bindings = ()

        method private of_located_list : 'a. 'a Syntax.located list -> 'a list =
          List.map ~f:Syntax.value

        method private resolve ref =
          List.find_map current_bindings ~f:(fun bindings ->
              List.Assoc.find bindings ~equal:String.equal ref )

        method private interpret_expr_to_type expr =
          let inter = new interpreter (current_bindings, errors, functions) in
          self#expr_to_type @@ Value (inter#interpret_expr expr)

        method private expr_to_type expr =
          match expr with
          | Value (Type t) ->
              t
          | Value (Struct s) ->
              StructType s
          | Reference (ref, _) -> (
            match self#resolve ref with
            | Some e ->
                self#expr_to_type e
            | None -> (
              match find_in_scope ref runtime_bindings with
              | Some ty ->
                  ty
              | None ->
                  errors#report `Error (`UnresolvedIdentifier ref) () ;
                  VoidType ) )
          | _ ->
              errors#report `Error (`UnexpectedType expr) () ;
              VoidType

        method private infer_return_type body =
          let rec stmt_type = function
            | Break (Expr expr) ->
                expr_to_type expr
            | Break stmt ->
                stmt_type stmt
            | Return expr ->
                expr_to_type expr
            | _ ->
                VoidType
          in
          List.fold (Option.value body ~default:[]) ~init:VoidType
            ~f:(fun _type -> stmt_type)
      end
  end
