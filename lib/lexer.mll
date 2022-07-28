{
  open Tokens
  open Lexing
  exception Error of string

  let next_line lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <-
      { pos with pos_bol = pos.pos_cnum;
                 pos_lnum = pos.pos_lnum + 1;
      }

(* Lexing string literals, approach lifted from OCaml's lexer *)

let empty_str_buffer () = Buffer.create 256
let str_buffer = ref (empty_str_buffer ())

let rec reset_str_buffer () =
  str_buffer := empty_str_buffer () ;
and get_str_buffer () =
  let s = Buffer.contents !str_buffer in
    reset_str_buffer () ;
    s

let store_str_char c =
  Buffer.add_char !str_buffer c

let comment_ctr = ref 0
let single_line_comment_flag = ref false

}

(* Define helper regexes *)
let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']

let integer = digit+
let integer_with_underscores = integer ('_' integer)*

let ident = (alpha|'_') (alpha|digit|'_')* (* regex for identifier *)
let newline = '\r' | '\n' | "\r\n"
let whitespace = [' ' '\t']+

rule token = parse
 | whitespace { token lexbuf }
 | newline  { next_line lexbuf; token lexbuf }
 | "@" { AT }
 | ".." { DOUBLEDOT }
 | ',' { COMMA }
 | ':' { COLON }
 | ';' { SEMICOLON }
 | "->" { RARROW }
 | "=>" { REARROW }
 | '{' { LBRACE }
 | '}' { RBRACE }
 | '(' { LPAREN }
 | ')' { RPAREN }
 | '[' { LBRACKET }
 | ']' { RBRACKET }
 | '=' { EQUALS }
 | '~' { TILDE }
 | '.' { DOT }
 | '"' { 
     reset_str_buffer ();
     string lexbuf ;
     STRING (get_str_buffer ())
   }
 | "as" { AS }
 | "true" { BOOL true }
 | "false" { BOOL false }
 | "let" { LET }
 | "struct" { STRUCT }
 | "enum" { ENUM }
 | "interface" { INTERFACE }
 | "union" { UNION }
 | "fn" { FN }
 | "if" { IF }
 | "else" { ELSE }
 | "return" { RETURN }
 | "case" { CASE }
 | "impl" { IMPL }
 | "switch" { SWITCH }
 | '-'? integer_with_underscores as i { INT (Z.of_string i) }
 | ident { IDENT (Lexing.lexeme lexbuf) }
 | "/*" { comment_ctr := !comment_ctr + 1 ; comment lexbuf }
 | "//" { single_line_comment_flag := true ; single_line_comment lexbuf }
 | eof { EOF }
 | _
    { raise (Error (Printf.sprintf "At offset %d: unexpected character.\n" (Lexing.lexeme_start lexbuf))) }

and string = parse
 | '"' { () }
(* string lexer does not currently support any escaping for simplicity's sake,
 * but is expected to have it *)
 | eof { raise (Error "Unterminated string literal") }
 | _ { store_str_char @@ Lexing.lexeme_char lexbuf 0 ;
       string lexbuf }

and comment = parse
 | "/*" { comment_ctr := !comment_ctr + 1 ; comment lexbuf }
 | "*/" { 
     comment_ctr := !comment_ctr - 1 ;
     if !comment_ctr == 0 then
      if !single_line_comment_flag then single_line_comment lexbuf
      else token lexbuf
     else
       comment lexbuf
   }
 | _ { comment lexbuf }

and single_line_comment = parse
 | newline { single_line_comment_flag := false; token lexbuf }
 | _ { single_line_comment lexbuf }
