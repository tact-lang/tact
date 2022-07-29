open Base

module Make =
functor
  (Config : Config.T)
  ->
  struct
    open Syntax.Make (Config)

    let print_sexp = Sexplib.Sexp.pp_hum Caml.Format.std_formatter

    module Arena = struct
      module Vec = Containers.Vector

      type 'a t = {mutable items : 'a Vec.vector [@hash.ignore]}
      [@@deriving hash]

      let equal _ _ _ = raise Errors.InternalCompilerError

      let compare _ _ _ = raise Errors.InternalCompilerError

      let sexp_of_t : ('a -> Sexplib.Type.t) -> 'a t -> _ =
       fun f a ->
        Sexplib.Type.List
          ( sexp_of_int (Vec.length a.items)
          :: [Sexplib.Type.List (Vec.fold (fun l i -> f i :: l) [] a.items)] )

      class ['s] visitor =
        object (_self : 's)
          method visit_arena
              : 'env 'a. ('env -> 'a -> 'a) -> 'env -> 'a t -> 'a t =
            fun _ _ a -> a
        end

      let default () = {items = Vec.create ()}

      let length a = Vec.length a.items

      let get a id = Vec.get a.items id

      let with_id a ~f =
        let id = Vec.length a.items in
        let item = f id in
        Vec.push a.items item ; (id, item)

      let update a id ~f =
        let item = get a id in
        let new_item = f item in
        Vec.set a.items id new_item ;
        new_item

      (* For tests purposes only *)
      let strip_if_exists left right =
        let rl = Vec.length right.items in
        let ll = Vec.length left.items in
        if rl > ll then left
        else
          { items =
              ( Vec.rev left.items
              |> fun items ->
              Vec.truncate items (ll - rl) ;
              Vec.rev items ) }

      let deep_copy a = {items = Vec.copy a.items}

      let unsafe_drop_last a =
        let _ = Vec.pop_exn a.items in
        ()
    end

    class ['s] base_map =
      object (_ : 's)
        inherit ['s] Zint.map

        inherit ['s] Asm.map

        inherit ['s] Arena.visitor

        method visit_located
            : 'env 'a 'b. ('env -> 'a -> 'b) -> 'env -> 'a located -> 'b located
            =
          fun f env l -> {value = f env l.value; span = l.span}

        method visit_span : 'env. 'env -> _ -> _ = fun _ span -> span
      end

    class virtual ['s] base_reduce =
      object (self : 's)
        method virtual visit_instr : _

        method virtual visit_z : _

        method virtual zero : _

        method visit_located
            : 'env 'a 'b. ('env -> 'a -> 'b) -> 'env -> 'a located -> 'b =
          fun f env l -> f env (value l)

        method virtual visit_arena
            : 'env 'a. ('env -> 'a -> _) -> 'env -> 'a Arena.t -> _

        method visit_span : 'env. 'env -> _ -> _ = fun _ _ -> self#zero
      end

    class virtual ['s] base_visitor =
      object (_ : 's)
        inherit ['s] VisitorsRuntime.map

        inherit ['s] Zint.map

        inherit ['s] Asm.map

        inherit ['s] Arena.visitor

        method visit_located
            : 'env 'a 'b. ('env -> 'a -> 'b) -> 'env -> 'a located -> 'b located
            =
          fun f env l -> {value = f env l.value; span = l.span}

        method visit_span : 'env. 'env -> _ -> _ = fun _ span -> span
      end

    type comptime_counter = (int[@sexp.opaque])

    and metadata = (string * string) list

    and binding = string * expr

    and tbinding = string located * binding_scope

    and binding_scope = Comptime of expr | Runtime of type_

    and program =
      { bindings : (string located * expr) list;
        mutable structs : (int * struct_) list; [@hash.ignore]
        mutable unions : (int * union) list; [@sexp.list] [@hash.ignore]
        mutable interfaces : (int * interface) list; [@sexp.list] [@hash.ignore]
        mutable type_counter : (int[@sexp.opaque]); [@hash.ignore]
        mutable memoized_fcalls :
          (((value * value list) * value) list[@sexp.opaque]);
            [@hash.ignore]
        mutable struct_signs : struct_sig Arena.t;
            [@hash.ignore] [@visitors.name "arena"]
        mutable union_signs : union_sig Arena.t;
            [@hash.ignore] [@visitors.name "arena"]
        attr_executors : ((string * attr_executor) list[@sexp.opaque])
            [@visitors.opaque] [@equal.ignore] [@compare.ignore] }

    and expr = expr_kind located

    and expr_kind =
      | FunctionCall of function_call
      | IntfMethodCall of intf_method_call
      | StructSigMethodCall of st_sig_method_call
      | MkStructDef of mk_struct
      | MkUnionDef of mk_union
      | MkInterfaceDef of mk_interface
      | MkFunction of function_
      | MakeUnionVariant of (expr * int)
      | Reference of (string located * type_)
      | ResolvedReference of (string located * (expr[@sexp.opaque]))
      | Value of value
      | StructField of (expr * string located * type_)
      | Hole
      | Primitive of primitive
      | InvalidExpr

    and mk_interface =
      { mk_interface_attributes : attribute list; [@sexp.list]
        mk_interface_methods : (string * function_signature) list }

    and interface =
      { interface_attributes : attribute list; [@sexp.list]
        interface_methods : (string * function_signature) list }

    and if_ = {if_condition : expr; if_then : stmt; if_else : stmt option}

    and value =
      | Void
      | Struct of (expr * (string * expr) list)
      | UnionVariant of (value * int)
      | Function of function_
      | Integer of (Zint.t[@visitors.name "z"])
      | Bool of bool
      | String of string
      | Builtin of string
      | Type of type_

    and stmt = stmt_kind located

    and stmt_kind =
      | If of if_
      | Let of (string located * expr) list
      | DestructuringLet of destructuring_let
      | Return of expr
      | Break of stmt
      | Expr of expr
      | Block of stmt list
      | Switch of switch
      | Invalid

    and destructuring_let =
      { destructuring_let : (string located * string located) list;
        destructuring_let_expr : expr;
        destructuring_let_rest : bool }

    and attribute =
      {attribute_ident : string located; attribute_exprs : expr list}

    and type_ =
      | TypeN of int
      | IntegerType
      | BoolType
      | StringType
      | VoidType
      | BuiltinType of string
      | StructType of int
      | UnionType of int
      | InterfaceType of int
      | StructSig of int
      | UnionSig of int
      | FunctionType of function_signature
      | HoleType
      | SelfType
      | InvalidType of expr
      | ExprType of expr
      | ValueOf of type_

    and mk_union =
      { mk_union_attributes : attribute list; [@sexp.list]
        mk_cases : expr list;
        mk_union_details : mk_details }

    and mk_struct =
      { mk_struct_attributes : attribute list; [@sexp.list]
        mk_struct_fields : (string located * expr) list;
        mk_struct_details : mk_details }

    and mk_details =
      { mk_methods : (string located * expr) list;
        mk_impls : mk_impl list;
        mk_id : int;
        mk_sig : int;
        mk_span : (span[@sexp.opaque]) [@equal.ignore] [@compare.ignore] }

    (* uty - User Defined Type *)
    and uty_details =
      { uty_methods : (string located * function_) list;
        uty_impls : impl list;
        uty_id : int;
        uty_base_id : int }

    and union =
      { union_attributes : attribute list; [@sexp.ident]
        cases : (type_ * discriminator) list;
        union_details : uty_details }

    and struct_ =
      { struct_attributes : attribute list; [@sexp.list]
        struct_fields : (string located * struct_field) list;
        struct_details : uty_details;
        (* Used by codegen to determine if this is a tensor *)
        tensor : bool [@sexp.bool] }

    and struct_sig =
      { st_sig_attributes : attribute list; [@sexp.list]
        st_sig_fields : (string located * expr) list;
        st_sig_methods : (string located * function_signature) list;
        (* ID of the base of the struct. *)
        st_sig_base_id : int;
        st_sig_id : int [@compare.ignore] [@equal.ignore] }

    and union_sig =
      { un_sig_attributes : attribute list; [@sexp.list]
        un_sig_cases : type_ list;
        un_sig_methods : (string located * function_signature) list;
        (* ID of the base of the struct. *)
        un_sig_base_id : int }

    and discriminator = Discriminator of int

    and struct_field = {field_type : type_}

    and mk_impl =
      { mk_impl_attributes : attribute list; [@sexp.list]
        mk_impl_interface : expr;
        mk_impl_methods : (string located * expr) list }

    and impl =
      { impl_attributes : attribute list; [@sexp.list]
        impl_interface : int;
        impl_methods : (string located * function_) list }

    and native_function =
      (program -> value list -> value
      [@visitors.opaque] [@equal.ignore] [@compare.ignore] )

    and builtin_fn = native_function * (int[@sexp.opaque])

    and function_ = function_kind located

    and function_kind =
      {function_signature : function_signature; function_impl : function_impl}

    and function_signature = function_signature_kind located

    and function_signature_kind =
      { function_attributes : attribute list; [@sexp.list]
        function_params : (string located * type_) list;
        function_returns : type_ }

    and function_impl = Fn of stmt | BuiltinFn of builtin_fn

    and function_call = expr * expr list

    and intf_method_call =
      { intf_instance : expr;
        intf_def : int;
        intf_method : string * function_signature;
        intf_args : expr list;
        intf_loc : (span[@sexp.opaque]) [@equal.ignore] [@compare.ignore] }

    and st_sig_method_call =
      { st_sig_call_instance : expr;
        st_sig_call_def : int;
        st_sig_call_method : string * function_signature;
        st_sig_call_args : expr list;
        st_sig_call_span : (span[@sexp.opaque]);
            [@equal.ignore] [@compare.ignore]
        st_sig_call_kind : sig_kind }

    and sig_kind = UnionSigKind | StructSigKind

    and switch = {switch_condition : expr; branches : branch located list}

    and branch =
      {branch_ty : type_; branch_var : string located; branch_stmt : stmt}

    and primitive = Prim of {name : string; exprs : expr list}

    (* This type will be extended in the future *)
    and attr_target = ImplAttrTarget of {impl : mk_impl; self_ty : type_}

    and attr_executor =
      (program -> tbinding list list -> expr list -> attr_target -> attr_target
      [@visitors.opaque] [@equal.ignore] [@compare.ignore] )
    [@@deriving
      equal,
        compare,
        hash,
        sexp_of,
        visitors {variety = "map"; polymorphic = true; ancestors = ["base_map"]},
        visitors {variety = "reduce"; ancestors = ["base_reduce"]},
        visitors
          {variety = "fold"; name = "visitor"; ancestors = ["base_visitor"]}]

    let type0 = TypeN 0

    let make_runtime (x, type_) = (x, Runtime type_)

    let make_comptime (x, value) = (x, Comptime value)

    let find_comptime name bindings =
      List.find_map bindings ~f:(fun bindings ->
          List.find_map bindings ~f:(function
            | b_name, Comptime value ->
                if equal_string b_name.value name then Some (Ok value) else None
            | b_name, Runtime _ ->
                if equal_string b_name.value name then Some (Error ()) else None ) )

    let extract_comptime_bindings bindings =
      List.filter_map bindings ~f:(fun (name, scope) ->
          match scope with Comptime value -> Some (name, value) | _ -> None )

    let sig_of_struct {struct_attributes; struct_fields; struct_details; _} sid
        =
      { st_sig_attributes = struct_attributes;
        st_sig_fields =
          List.Assoc.map struct_fields ~f:(fun {field_type} ->
              match field_type with
              | ExprType ex ->
                  ex
              | _ ->
                  builtin_located (Value (Type field_type)) );
        st_sig_methods =
          List.Assoc.map struct_details.uty_methods ~f:(fun x ->
              x.value.function_signature );
        st_sig_base_id = struct_details.uty_base_id;
        st_sig_id = sid }

    let sig_of_union {union_attributes; cases; union_details; _} =
      { un_sig_attributes = union_attributes;
        un_sig_cases = List.map cases ~f:fst;
        un_sig_methods =
          List.Assoc.map union_details.uty_methods ~f:(fun x ->
              x.value.function_signature );
        un_sig_base_id = union_details.uty_base_id }

    let rec expr_to_type program expr =
      match expr.value with
      | Value (Type type_) ->
          type_
      | ResolvedReference (_, e) ->
          expr_to_type program e
      | _ ->
          ExprType expr

    and type_of program expr =
      match expr.value with
      | Value (Struct (s, _)) ->
          expr_to_type program s
      | Value (UnionVariant (_, uid)) ->
          UnionType uid
      | Value (Function {value = {function_signature; _}; _}) ->
          FunctionType function_signature
      | Value (Builtin builtin) ->
          BuiltinType builtin
      | Value (Integer _) ->
          IntegerType
      | Value (Bool _) ->
          BoolType
      | Value Void ->
          VoidType
      | Value (Type t) ->
          type_of_type program t
      | Hole ->
          HoleType
      | FunctionCall (f, args) -> (
          let f' = type_of program f in
          match f' with
          | FunctionType sign ->
              type_of_call
                ~self_ty:
                  (Some
                     (ExprType {value = FunctionCall (f, args); span = expr.span}
                     ) )
                program args sign.value.function_params
                sign.value.function_returns
          | _ ->
              raise Errors.InternalCompilerError )
      | Reference (_, t) ->
          t
      | ResolvedReference (_, e) ->
          type_of program e
      | MakeUnionVariant (_, u) ->
          UnionType u
      | MkStructDef mk ->
          StructSig mk.mk_struct_details.mk_sig
      | StructField (_, _, ty) ->
          ty
      | IntfMethodCall {intf_method = _, sign; intf_args; _} ->
          type_of_call program intf_args sign.value.function_params
            sign.value.function_returns
      | StructSigMethodCall {st_sig_call_method = _, sign; st_sig_call_args; _}
        ->
          type_of_call program st_sig_call_args sign.value.function_params
            sign.value.function_returns
      | MkFunction mk_function ->
          FunctionType mk_function.value.function_signature
      | MkUnionDef uni ->
          UnionSig uni.mk_union_details.mk_sig
      | _ ->
          InvalidType expr

    and type_of_type program = function
      | TypeN x ->
          TypeN (x + 1)
      | StructSig _ | UnionSig _ ->
          TypeN 1
      | ValueOf ty ->
          ty
      | ExprType ex ->
          type_of program ex
      | _otherwise ->
          TypeN 0

    and type_of_call ?(self_ty = None) program args arg_types returns =
      let associated =
        match
          List.map2 args arg_types ~f:(fun expr (name, _) -> (name.value, expr))
        with
        | Ok t ->
            t
        | _ ->
            print_sexp
            @@ sexp_of_list
                 (Sexplib.Conv.sexp_of_pair
                    (sexp_of_located sexp_of_string)
                    sexp_of_type_ )
                 arg_types ;
            raise Errors.InternalCompilerError
      in
      let dependent_types_monomophizer (program : program)
          ?(self_sig : int option = None) (associated : (string * expr) list) =
        object (self : _)
          inherit [_] map as super

          val mutable inside_self_sig = false

          val mutable visited_signs : (int * int) list = []

          val mutable visited_union_signs : (int * int) list = []

          method! visit_StructSig env sign_id =
            match List.Assoc.find visited_signs sign_id ~equal:equal_int with
            | Some new_id ->
                if inside_self_sig then
                  Option.value self_ty ~default:(StructSig new_id)
                else StructSig new_id
            | None ->
                if
                  equal_option equal_int self_sig (Some sign_id)
                  && not inside_self_sig
                then inside_self_sig <- true ;
                let sign = Arena.get program.struct_signs sign_id in
                let id, new_sign =
                  Arena.with_id program.struct_signs ~f:(fun new_id ->
                      let prev_vis_signs = visited_signs in
                      visited_signs <- (sign_id, new_id) :: visited_signs ;
                      let new_sign = self#visit_struct_sig env sign in
                      visited_signs <- prev_vis_signs ;
                      {new_sign with st_sig_id = new_id} )
                in
                if equal_struct_sig sign new_sign then (
                  Arena.unsafe_drop_last program.struct_signs ;
                  StructSig sign_id )
                else StructSig id

          method! visit_UnionSig env sign_id =
            match
              List.Assoc.find visited_union_signs sign_id ~equal:equal_int
            with
            | Some new_id ->
                UnionSig new_id
            | None ->
                let sign = Arena.get program.union_signs sign_id in
                let id, new_sign =
                  Arena.with_id program.union_signs ~f:(fun new_id ->
                      let prev_vis_signs = visited_union_signs in
                      visited_union_signs <-
                        (sign_id, new_id) :: visited_union_signs ;
                      let new_sign = self#visit_union_sig env sign in
                      visited_union_signs <- prev_vis_signs ;
                      new_sign )
                in
                if equal_union_sig sign new_sign then (
                  Arena.unsafe_drop_last program.union_signs ;
                  UnionSig sign_id )
                else UnionSig id

          method! visit_Reference _ (ref, ty) =
            List.find_map associated ~f:(fun (name, x) ->
                if equal_string name ref.value then Some x.value else None )
            |> Option.value_or_thunk ~default:(fun _ -> Reference (ref, ty))

          method! visit_type_ env =
            function
            | ExprType {value = Value (Type ty); _} ->
                self#visit_type_ env ty
            | ty ->
                super#visit_type_ env ty
        end
      in
      let monomorphizer =
        match returns with
        | StructSig sid ->
            dependent_types_monomophizer ~self_sig:(Some sid) program associated
        | _ ->
            dependent_types_monomophizer program associated
      in
      monomorphizer#visit_type_ () returns

    class ['s] boolean_reduce (zero : bool) =
      object (_self : 's)
        inherit [_] reduce

        method private zero = zero

        method private plus = if zero then ( && ) else ( || )

        method visit_instr _env _instr = zero

        method visit_z _env _z = zero

        method visit_arena _ _ _ = zero
      end

    type reason_non_immediate =
      | NonImmediateRef
      | NonImmediatePrimitive
      | NonImmediatetSig
      | NonImmediateSelfType
    [@@deriving sexp_of]

    type is_immediate =
      | Immediate
      | ImmediateIfNotCalled
      | NonImmediate of reason_non_immediate
    [@@deriving sexp_of]

    class ['s] expr_immediacy_check (scope : tbinding list list) =
      object (self : 's)
        inherit [_] reduce as super

        method zero = Immediate

        method plus x1 x2 =
          match (x1, x2) with
          | NonImmediate NonImmediateRef, _ | _, NonImmediate NonImmediateRef ->
              NonImmediate NonImmediateRef
          | NonImmediate NonImmediatePrimitive, _
          | _, NonImmediate NonImmediatePrimitive ->
              NonImmediate NonImmediatePrimitive
          | NonImmediate NonImmediateSelfType, _
          | _, NonImmediate NonImmediateSelfType ->
              NonImmediate NonImmediateSelfType
          | NonImmediate NonImmediatetSig, _ | _, NonImmediate NonImmediatetSig
            ->
              Immediate
          | ImmediateIfNotCalled, _ | _, ImmediateIfNotCalled ->
              ImmediateIfNotCalled
          | _ ->
              Immediate

        method visit_z _ _ = Immediate

        method visit_instr _ _ = raise Errors.InternalCompilerError

        method visit_arena _ _ = raise Errors.InternalCompilerError

        val mutable arguments : string list list = []

        method! visit_Reference _ (ref, _) =
          match
            List.find arguments ~f:(List.exists ~f:(equal_string ref.value))
          with
          | Some _ ->
              Immediate
          | _ -> (
            match find_comptime ref.value scope with
            | Some (Ok _) ->
                Immediate
            | Some (Error _) ->
                NonImmediate NonImmediateRef
            | None ->
                print_sexp @@ sexp_of_string ref.value ;
                print_sexp @@ sexp_of_list (sexp_of_list sexp_of_tbinding) scope ;
                raise Errors.InternalCompilerError )

        method! visit_Primitive _ _ = NonImmediate NonImmediatePrimitive

        method! visit_Let env vars =
          self#visit_list
            (fun env (name, expr) ->
              let is_expr_immediate = self#visit_expr env expr in
              arguments <- [name.value] :: arguments ;
              is_expr_immediate )
            env vars

        method! visit_DestructuringLet env let_ =
          let is_expr = self#visit_expr env let_.destructuring_let_expr in
          let args =
            List.map let_.destructuring_let ~f:(fun (_, n) -> n.value)
          in
          arguments <- args :: arguments ;
          is_expr

        method! visit_Block env block =
          self#with_arguments [] (fun _ -> super#visit_Block env block)

        method! visit_function_ env f =
          let is_sig =
            self#visit_function_signature env f.value.function_signature
          in
          let args =
            List.map f.value.function_signature.value.function_params
              ~f:(fun (n, _) -> n.value)
          in
          let is_body =
            self#with_arguments args (fun _ ->
                self#visit_function_impl env f.value.function_impl )
          in
          self#plus is_sig is_body

        method! visit_Fn env body =
          match self#visit_stmt env body with
          | NonImmediate NonImmediatePrimitive ->
              ImmediateIfNotCalled
          | ImmediateIfNotCalled ->
              (* Expression that throws ImmediateIfNotCalled is not called so function
                 itself is immediate *)
              Immediate
          | x ->
              x

        method! visit_branch env {branch_var; branch_stmt; _} =
          self#with_arguments [branch_var.value] (fun _ ->
              self#visit_stmt env branch_stmt )

        method! visit_function_call ctx (f, args) =
          let is_args_immediate = self#visit_list self#visit_expr ctx args in
          let is_f_immediate =
            match self#visit_expr ctx f with
            | ImmediateIfNotCalled ->
                NonImmediate NonImmediatePrimitive
            | x ->
                x
          in
          self#plus is_args_immediate is_f_immediate

        method! visit_function_signature ctx sign =
          let is_args_immediate =
            List.fold ~init:Immediate
              ~f:(fun prev (_, ty2) -> self#plus prev (self#visit_type_ ctx ty2))
              sign.value.function_params
          in
          let args =
            List.map ~f:(fun (name, _) -> name.value) sign.value.function_params
          in
          let is_ret_immediate =
            self#with_arguments args (fun _ ->
                self#visit_type_ ctx sign.value.function_returns )
          in
          self#plus is_args_immediate is_ret_immediate

        method! visit_StructSig _ _ = NonImmediate NonImmediatetSig

        method! visit_UnionSig _ _ = NonImmediate NonImmediatetSig

        method! visit_mk_struct env mk =
          self#with_arguments ["Self"] (fun _ -> super#visit_mk_struct env mk)

        method! visit_mk_union env mk =
          self#with_arguments ["Self"] (fun _ -> super#visit_mk_union env mk)

        method private with_arguments args f =
          let prev_args = arguments in
          arguments <- args :: arguments ;
          let out = f arguments in
          arguments <- prev_args ;
          out

        method! visit_mk_interface env intf =
          match super#visit_mk_interface env intf with
          | NonImmediate NonImmediateSelfType ->
              Immediate
          | x ->
              x

        method! visit_IntfMethodCall env fc =
          let is_intf_instance = self#visit_expr env fc.intf_instance in
          let is_args = self#visit_list self#visit_expr env fc.intf_args in
          self#plus is_intf_instance is_args

        method! visit_SelfType _ = NonImmediate NonImmediateSelfType
      end

    let rec is_immediate_expr scope _p expr =
      let checker = new expr_immediacy_check scope in
      match checker#visit_expr () expr with
      | Immediate | ImmediateIfNotCalled ->
          true
      | _ ->
          false

    and are_immediate_arguments scope program args =
      Option.is_none
        (List.find args ~f:(fun a -> not (is_immediate_expr scope program a)))

    let rec builtin_fun_counter = ref 0

    and builtin_fun f =
      let res = (f, !builtin_fun_counter) in
      builtin_fun_counter := !builtin_fun_counter + 1 ;
      res

    let find_in_scope : string -> tbinding list list -> binding_scope option =
     fun ref scope ->
      List.find_map scope ~f:(fun bindings ->
          List.find_map bindings ~f:(fun (s, x) ->
              if String.equal ref s.value then Some x else None ) )

    let find_in_runtime_scope :
          'a. string -> (string * 'a) list list -> 'a option =
     fun ref scope ->
      List.find_map scope ~f:(fun bindings ->
          List.find_map bindings ~f:(fun (name, value) ->
              if String.equal ref name then Some value else None ) )

    module Value = struct
      let unwrap_function = function
        | Function f ->
            f
        | _ ->
            raise Errors.InternalCompilerError

      let unwrap_intf_id = function
        | Type (InterfaceType intf_id) ->
            intf_id
        | _ ->
            raise Errors.InternalCompilerError
    end

    module Program = struct
      let methods_of p = function
        | StructType s ->
            List.find_map_exn p.structs ~f:(fun (id, s') ->
                if equal_int id s then Some s'.struct_details.uty_methods
                else None )
        | UnionType u ->
            List.find_map_exn p.unions ~f:(fun (id, u') ->
                if equal_int id u then Some u'.union_details.uty_methods
                else None )
        | _ ->
            []

      let impls_of p = function
        | StructType s ->
            List.find_map_exn p.structs ~f:(fun (id, s') ->
                if equal_int id s then Some s'.struct_details.uty_impls
                else None )
        | UnionType u ->
            List.find_map_exn p.unions ~f:(fun (id, u') ->
                if equal_int id u then Some u'.union_details.uty_impls else None )
        | _ ->
            []

      let insert_interface p i =
        let c = p.type_counter in
        p.type_counter <- p.type_counter + 1 ;
        p.interfaces <- (c, i) :: p.interfaces ;
        InterfaceType c

      (* Caller must guarantee that index is not used and will not be used by other types. *)
      let insert_interface_with_id p idx intf =
        p.interfaces <- (idx, intf) :: p.interfaces ;
        InterfaceType idx

      let get_intf p id = List.Assoc.find_exn p.interfaces id ~equal:equal_int

      let get_struct p s = List.Assoc.find_exn p.structs s ~equal:equal_int

      let get_union p u = List.Assoc.find_exn p.unions u ~equal:equal_int

      let rec update_list id new_s = function
        | [] ->
            raise Errors.InternalCompilerError
        | (xid, old_s) :: xs ->
            if equal_int xid id then
              match new_s with Ok new_s -> (id, new_s) :: xs | Error _ -> xs
            else (xid, old_s) :: update_list id new_s xs

      let with_struct p s f =
        p.structs <- (s.struct_details.uty_id, s) :: p.structs ;
        let new_s = f () in
        p.structs <- update_list s.struct_details.uty_id new_s p.structs ;
        new_s

      (* Creates new struct id, calls function with this new id and then
         places returning struct to the program.structs *)
      let with_id p mk_struct f =
        let id = p.type_counter in
        p.type_counter <- p.type_counter + 1 ;
        let s = mk_struct id in
        p.structs <- (id, s) :: p.structs ;
        let new_s = f s in
        p.structs <- update_list id (Ok new_s) p.structs ;
        new_s

      let with_union p u f =
        p.unions <- (u.union_details.uty_id, u) :: p.unions ;
        let new_u = f () in
        p.unions <- update_list u.union_details.uty_id new_u p.unions ;
        new_u

      (* Creates new struct id, calls function with this new id and then
         places returning union to the program.unions *)
      let with_union_id p mk_union f =
        let id = p.type_counter in
        p.type_counter <- p.type_counter + 1 ;
        let u = mk_union id in
        p.unions <- (id, u) :: p.unions ;
        let new_union = f u in
        p.unions <- update_list id (Ok new_union) p.unions ;
        new_union

      let get_uty_details p = function
        | StructType s ->
            Some (get_struct p s).struct_details
        | UnionType u ->
            Some (get_union p u).union_details
        | _ ->
            None

      let find_impl_intf p impl ty =
        get_uty_details p ty
        |> Option.bind ~f:(fun dets ->
               List.find dets.uty_impls ~f:(fun {impl_interface; _} ->
                   equal_int impl_interface impl ) )

      let find_method p ty m =
        List.Assoc.find (methods_of p ty)
          ~equal:(fun v1 v2 -> equal_string v1.value v2.value)
          (builtin_located m)

      let find_binding p name =
        List.Assoc.find p.bindings (builtin_located name)
          ~equal:(equal_located equal_string)
    end
  end
