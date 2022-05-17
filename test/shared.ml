module Syntax = Tact.Syntax.Make (Tact.Located.Disabled)
module Parser = Tact.Parser.Make (Syntax)
module Lang = Tact.Lang.Make (Syntax)
module Interpreter = Tact.Interpreter
module Errors = Tact.Errors
module Zint = Tact.Zint
include Core

type error = [Lang.error | Interpreter.error] [@@deriving sexp_of]

let make_errors () = new Errors.errors

let parse_program s = Parser.program Tact.Lexer.token (Lexing.from_string s)

let build_program ?(errors = make_errors ()) ?(bindings = Lang.default_bindings)
    ?(strip_default_bindings = true) p =
  let c = new Lang.constructor (bindings, errors) in
  let p' = c#visit_program () p in
  errors#to_result p'
  (* remove default bindings *)
  |> Result.map ~f:(fun (program : Lang.program) ->
         if strip_default_bindings then
           let program : Lang.program =
             { bindings =
                 List.filter program.bindings ~f:(fun binding ->
                     not @@ List.exists bindings ~f:(Lang.equal_binding binding) )
             }
           in
           program
         else program )
  |> Result.map_error ~f:(fun errors ->
         List.map errors ~f:(fun (_, err, _) -> err) )

let rec pp_sexp = Sexplib.Sexp.pp_hum Caml.Format.std_formatter

and print_sexp e =
  pp_sexp
    (Result.sexp_of_t Lang.sexp_of_program (List.sexp_of_t sexp_of_error) e)

let pp ?(bindings = Lang.default_bindings) s =
  parse_program s |> build_program ~bindings |> print_sexp

exception Exn of error list

let compile s =
  parse_program s |> build_program
  |> Result.map_error ~f:(fun err -> Exn err)
  |> Result.ok_exn
