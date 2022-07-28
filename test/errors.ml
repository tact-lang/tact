module Config = Shared.EnabledConfig
module Show = Tact.Show.Make (Shared.EnabledConfig)
open Config

let fmt = Caml.Format.std_formatter

let%expect_test "error showing one line" =
  let source = {|
fn test() {

}
|} in
  let open Show.DiagnosticMsg in
  let pos1 : Tact.Located.pos =
    {pos_fname = "f"; pos_cnum = 3 + 1; pos_lnum = 1; pos_bol = 1}
  in
  let pos2 : Tact.Located.pos =
    {pos_fname = "f"; pos_cnum = 7 + 1; pos_lnum = 1; pos_bol = 1}
  in
  let msg =
    { severity = `Error;
      diagnostic_id = 0;
      diagnostic_msg = "msg";
      spans = [(span_of_concrete (pos1, pos2), "message")];
      additional_msg = [] }
  in
  Show.DiagnosticMsg.show fmt msg source ;
  [%expect
    {|
    Error[0]: msg
    File: "f":1:3
      |
    1 | fn test() {
      |    ^^^^ message |}]

let%expect_test "error showing two lines" =
  let source = {|
let a = test(
  arg1, arg2);
|} in
  let open Show.DiagnosticMsg in
  let pos1 : Tact.Located.pos =
    {pos_fname = "f"; pos_cnum = 8 + 1; pos_lnum = 1; pos_bol = 1}
  in
  let pos2 : Tact.Located.pos =
    {pos_fname = "f"; pos_cnum = 13 + 13 + 1; pos_lnum = 2; pos_bol = 13 + 1}
  in
  let msg =
    { severity = `Error;
      diagnostic_id = 0;
      diagnostic_msg = "msg";
      spans = [(span_of_concrete (pos1, pos2), "message")];
      additional_msg = [] }
  in
  Show.DiagnosticMsg.show fmt msg source ;
  [%expect
    {|
    Error[0]: msg
    File: "f":1:8
      |
    1 | let a = test(...
      |         ^^^^^^^^ message |}]

let pp =
  let open Base in
  Shared.Enabled.pp_compile ~show_errors:(fun (elist, _) source ->
      List.iter elist ~f:(fun x ->
          let s = Show.show_error source x in
          Caml.Format.print_string s ) )

let%expect_test "failed scope resolution" =
  let source = {|
    let T = Int256;
  |} in
  pp source ;
  [%expect
    {|
    Error[1]: Unresolved identifier Int256
    File: "":2:12
      |
    2 |     let T = Int256;
      |             ^^^^^^ Cannot resolve this identifier |}]

let%expect_test "method not found" =
  let source = {|
      struct St { }
  
      let _ = St{}.method();
    |} in
  pp source ;
  [%expect
    {|
    Error[1]: Method method not found in <anonymous>
    File: "":4:19
      |
    4 |       let _ = St{}.method();
      |                    ^^^^^^ Method not found |}]

let%expect_test "duplicate field" =
  let source =
    {|
      struct Foo {
        field: Integer
        field: Integer
      }
    |}
  in
  pp source ;
  [%expect
    {|
    Error[1]: Duplicate struct field field
    File: "":3:8
      |
    3 |         field: Integer
      |         ^^^^^ Duplicated |}]

let%expect_test "duplicate variant" =
  let source =
    {|
      union Test1 {
        case Integer
        case Integer
      }

      union Test2[T: Type] {
        case Integer
        case T
      }
      let _ = Test2(Integer);
    |}
  in
  pp source ;
  (* FIXME: wrong positioning of the highlight *)
  [%expect
    {|
    Error[1]: Duplicate variant with type Integer
    File: <unknown>

    Error[1]: Duplicate variant with type Integer
    File: "":5:7
      |
    5 |       }...
      |        ^^^ Duplicated variant in this union |}]
