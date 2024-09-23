//
// Color.fif
//

/// Tests parsing of Color.fif by embedding its contents
asm fun embedColorFif() {
    library Color
    { 27 emit } : esc
    { char " word 27 chr swap $+ 1 ' type does create } :_ make-esc"
    make-esc"[0m" ^reset
    make-esc"[30m" ^black
    make-esc"[31m" ^red
    make-esc"[32m" ^green
    make-esc"[33m" ^yellow
    make-esc"[34m" ^blue
    make-esc"[35m" ^magenta
    make-esc"[36m" ^cyan
    make-esc"[37m" ^white
    // bold
    make-esc"[30;1m" ^Black
    make-esc"[31;1m" ^Red
    make-esc"[32;1m" ^Green
    make-esc"[33;1m" ^Yellow
    make-esc"[34;1m" ^Blue
    make-esc"[35;1m" ^Magenta
    make-esc"[36;1m" ^Cyan
    make-esc"[37;1m" ^White
}

//
// Disasm.fif
//

/// Tests parsing of Disasm.fif by embedding its contents
asm fun embedDisasmFif() {
    library TVM_Disasm
    // simple TVM Disassembler
    "Lists.fif" include

    variable 'disasm
    { 'disasm @ execute } : disasm  // disassemble a slice
    // usage: x{74B0} disasm

    variable @dismode  @dismode 0!
    { rot over @ and rot xor swap ! } : andxor!
    { -2 0 @dismode andxor! } : stack-disasm  // output 's1 s4 XCHG'
    { -2 1 @dismode andxor! } : std-disasm    // output 'XCHG s1, s4'
    { -3 2 @dismode andxor! } : show-vm-code
    { -3 0 @dismode andxor! } : hide-vm-code
    { @dismode @ 1 and 0= } : stack-disasm?

    variable @indent  @indent 0!
    { ' space @indent @ 2* times } : .indent
    { @indent 1+! } : +indent
    { @indent 1-! } : -indent

    { " " $pos } : spc-pos
    { dup " " $pos swap "," $pos dup 0< { drop } {
      over 0< { nip } { min } cond } cond
    } : spc-comma-pos
    { { dup spc-pos 0= } { 1 $| nip } while } : -leading
    { -leading -trailing dup spc-pos dup 0< {
      drop dup $len { atom single } { drop nil } cond } {
        $| swap atom swap -leading 2 { over spc-comma-pos dup 0>= } {
          swap 1+ -rot $| 1 $| nip -leading rot
        } while drop tuple
      } cond
    } : parse-op
    { dup "s-1" $= { drop "s(-1)" true } {
      dup "s-2" $= { drop "s(-2)" true } {
      dup 1 $| swap "x" $= { nip "x{" swap $+ +"}" true } {
      2drop false } cond } cond } cond
    } : adj-op-arg
    { over count over <= { drop } { 2dup [] adj-op-arg { swap []= } { drop } cond } cond } : adj-arg[]
    { 1 adj-arg[] 2 adj-arg[] 3 adj-arg[]
      dup first
      dup `XCHG eq? {
        drop dup count 2 = { tpop swap "s0" , swap , } if } {
      dup `LSHIFT eq? {
        drop dup count 2 = stack-disasm? and { second `LSHIFT# swap pair } if } {
      dup `RSHIFT eq? {
        drop dup count 2 = stack-disasm? and { second `RSHIFT# swap pair } if } {
      drop
      } cond } cond } cond
    } : adjust-op

    variable @cp  @cp 0!
    variable @curop
    variable @contX  variable @contY  variable @cdict

    { atom>$ type } : .atom
    { dup first .atom dup count 1 > { space 0 over count 2- { 1+ 2dup [] type .", " } swap times 1+ [] type } { drop } cond } : std-show-op
    { 0 over count 1- { 1+ 2dup [] type space } swap times drop first .atom } : stk-show-op
    { @dismode @ 2 and { .indent ."// " @curop @ csr. } if } : .curop?
    { .curop? .indent @dismode @ 1 and ' std-show-op ' stk-show-op cond cr
    } : show-simple-op
    { dup 4 u@ 9 = { 8 u@+ swap 15 and 3 << s@ } {
      dup 7 u@ 0x47 = { 7 u@+ nip 2 u@+ 7 u@+ -rot 3 << swap sr@ } {
      dup 8 u@ 0x8A = { ref@ <s } {
      abort"invalid PUSHCONT"
      } cond } cond } cond
    } : get-cont-body
    { 14 u@+ nip 10 u@+ ref@ dup rot pair swap <s empty? { drop null } if } : get-const-dict
    { @contX @ @contY @ @contX ! @contY ! } : scont-swap
    { .indent swap type type cr @contY @ @contY null! @contX @ @contX null!
      +indent disasm -indent @contY !
    } : show-cont-bodyx
    { ":<{" show-cont-bodyx .indent ."}>" cr } : show-cont-op
    { swap scont-swap ":<{" show-cont-bodyx scont-swap
      "" show-cont-bodyx .indent ."}>" cr } : show-cont2-op

    { @contX @ null? { "CONT" show-cont-op } ifnot
    } : flush-contX
    { @contY @ null? { scont-swap "CONT" show-cont-op scont-swap } ifnot
    } : flush-contY
    { flush-contY flush-contX } : flush-cont
    { @contX @ null? not } : have-cont?
    { @contY @ null? not } : have-cont2?
    { flush-contY @contY ! scont-swap } : save-cont-body

    { @cdict ! } : save-const-dict
    { @cdict null! } : flush-dict
    { @cdict @ null? not } : have-dict?

    { flush-cont .indent type .":<{" cr
      @curop @ ref@ <s +indent disasm -indent .indent ."}>" cr
    } : show-ref-op
    { flush-contY .indent rot type .":<{" cr
      @curop @ ref@ <s @contX @ @contX null! rot ' swap if
      +indent disasm -indent .indent swap type cr
      +indent disasm -indent .indent ."}>" cr
    } : show-cont-ref-op
    { flush-cont .indent swap type .":<{" cr
      @curop @ ref@+ <s +indent disasm -indent .indent swap type cr
      ref@ <s +indent disasm -indent .indent ."}>" cr
    } : show-ref2-op

    { flush-cont first atom>$ dup 5 $| drop "DICTI" $= swap
      .indent type ." {" cr +indent @cdict @ @cdict null! unpair
      rot {
        swap .indent . ."=> <{" cr +indent disasm -indent .indent ."}>" cr true
      } swap ' idictforeach ' dictforeach cond drop
      -indent .indent ."}" cr
    } : show-const-dict-op

    ( `PUSHCONT `PUSHREFCONT ) constant @PushContL
    ( `REPEAT `UNTIL `IF `IFNOT `IFJMP `IFNOTJMP ) constant @CmdC1
    ( `IFREF `IFNOTREF `IFJMPREF `IFNOTJMPREF `CALLREF `JMPREF ) constant @CmdR1
    ( `DICTIGETJMP `DICTIGETJMPZ `DICTUGETJMP `DICTUGETJMPZ `DICTIGETEXEC `DICTUGETEXEC ) constant @JmpDictL
    { dup first `DICTPUSHCONST eq? {
        flush-cont @curop @ get-const-dict save-const-dict show-simple-op } {
      dup first @JmpDictL list-member? have-dict? and {
        flush-cont show-const-dict-op } {
      flush-dict
      dup first @PushContL list-member? {
        drop @curop @ get-cont-body save-cont-body } {
      dup first @CmdC1 list-member? have-cont? and {
        flush-contY first atom>$ .curop? show-cont-op } {
      dup first @CmdR1 list-member? {
        flush-cont first atom>$ dup $len 3 - $| drop .curop? show-ref-op } {
      dup first `WHILE eq? have-cont2? and {
        drop "WHILE" "}>DO<{" .curop? show-cont2-op } {
      dup first `IFELSE eq? have-cont2? and {
        drop "IF" "}>ELSE<{" .curop? show-cont2-op } {
      dup first dup `IFREFELSE eq? swap `IFELSEREF eq? or have-cont? and {
        first `IFREFELSE eq? "IF" "}>ELSE<{" rot .curop? show-cont-ref-op } {
      dup first `IFREFELSEREF eq? {
        drop "IF" "}>ELSE<{" .curop? show-ref2-op } {
        flush-cont show-simple-op
      } cond } cond } cond } cond } cond } cond } cond } cond } cond
    } : show-op
    { dup @cp @ (vmoplen) dup 0> { 65536 /mod swap sr@+ swap dup @cp @ (vmopdump) parse-op swap s> true } { drop false } cond } : fetch-one-op
    { { fetch-one-op } { swap @curop ! adjust-op show-op } while } : disasm-slice
    { { disasm-slice dup sbitrefs 1- or 0= } { ref@ <s } while flush-dict flush-cont } : disasm-chain
    { @curop @ swap disasm-chain dup sbitrefs or { .indent ."Cannot disassemble: " csr. } { drop } cond @curop ! }
    'disasm !
}

//
// Lists.fif
//

/// Tests parsing of Lists.fif by embedding its contents
asm fun embedListsFif() {
    library Lists  // List utilities
    //
    { hole dup 1 { @ execute } does create } : recursive
    // x x' -- ?  recursively compares two S-expressions
    recursive equal? {
      dup tuple? {
        over tuple? {
          over count over count over = { // t t' l ?
            0 { dup 0>= { 2dup [] 3 pick 2 pick [] equal? { 1+ } { drop -1 } cond
                } if } rot times
            nip nip 0>=
          } { drop 2drop false } cond
        } { 2drop false } cond
      } { eqv? } cond
    } swap !
    // (a1 .. an) -- (an .. a1)
    { null swap { dup null? not } { uncons swap rot cons swap } while drop } : list-reverse
    // (a1 .. an) -- an   Computes last element of non-empty list l
    { { uncons dup null? { drop true } { nip false } cond } until } : list-last
    // l l' -- l++l'  Concatenates two lists
    recursive list+ {
      over null? { nip } { swap uncons rot list+ cons } cond
    } swap !
    // l l' -- l'' -1 or 0, where l = l' ++ l''
    // Removes prefix from list
    { { dup null? { drop true true } {
      swap dup null? { 2drop false true } { // l' l
      uncons swap rot uncons -rot equal? { false } {
      2drop false true
      } cond } cond } cond } until
    } : list-
    // (a1 .. an) -- a1 .. an n   Explodes a list
    { 0 { over null? not } { swap uncons rot 1+ } while nip } : explode-list
    // (a1 .. an) x -- a1 .. an n x   Explodes a list under the topmost element
    { swap explode-list dup 1+ roll } : explode-list-1
    // l -- t   Transforms a list into a tuple with the same elements
    { explode-list tuple } : list>tuple
    // a1 ... an n x -- (a1 .. an) x
    { null swap rot { -rot cons swap } swap times } : mklist-1
    // (s1 ... sn) -- s1+...+sn   Concatenates a list of strings
    { "" { over null? not } { swap uncons -rot $+ } while nip
    } : concat-string-list
    // (x1 ... xn) -- x1+...+xn   Sums a list of integers
    { 0 { over null? not } { swap uncons -rot + } while nip
    } : sum-list
    // (a1 ... an) a e -- e(...e(e(a,a1),a2),...),an)
    { -rot { over null? not } { swap uncons -rot 3 pick execute } while nip nip
    } : foldl
    // (a1 ... an) e -- e(...e(e(a1,a2),a3),...),an)
    { swap uncons swap rot foldl } : foldl-ne
    // (a1 ... an) a e -- e(a1,e(a2,...,e(an,a)...))
    recursive foldr {
      rot dup null? { 2drop } {
        uncons -rot 2swap swap 3 pick foldr rot execute
      } cond
    } swap !
    // (a1 ... an) e -- e(a1,e(a2,...,e(a[n-1],an)...))
    recursive foldr-ne {
      over cdr null? { drop car } {
        swap uncons 2 pick foldr-ne rot execute
      } cond
    } swap !
    // (l1 ... ln) -- l1++...++ln   Concatenates a list of lists
    { dup null? { ' list+ foldr-ne } ifnot } : concat-list-lists
    // (a1 .. an . t) n -- t   Computes the n-th tail of a list
    { ' cdr swap times } : list-tail
    // (a0 .. an ..) n -- an   Computes the n-th element of a list
    { list-tail car } : list-ref
    // l -- ?
    { { dup null? { drop true true } {
        dup pair? { cdr false } {
        drop false true
      } cond } cond } until
    } : list?
    // l -- n
    { 0 { over null? not } { 1+ swap uncons nip swap } while nip
    } : list-length
    // l e -- t  // returns tail of l after first member that satisfies e
    { swap {
      dup null? { nip true } {
      tuck car over execute { drop true } {
      swap cdr false
      } cond } cond } until
    } : list-tail-from
    // a l -- t  // tail of l after first occurence of a using eq?
    { swap 1 ' eq? does list-tail-from } : list-member-eq
    { swap 1 ' eqv? does list-tail-from } : list-member-eqv
    { swap 1 ' equal? does list-tail-from } : list-member-equal
    // a l -- ?
    { list-member-eq null? not } : list-member?
    { list-member-eqv null? not } : list-member-eqv?
    // l -- a -1 or 0 // returns car l if l is non-empty
    { dup null? { drop false } { car true } cond
    } : safe-car
    { dup null? { drop false } { car second true } cond
    } : get-first-value
    // l e -- v -1 or 0
    { list-tail-from safe-car } : assoc-gen
    { list-tail-from get-first-value } : assoc-gen-x
    // a l -- (a.v) -1 or 0 -- returns first entry (a . v) in l
    { swap 1 { swap first eq? } does assoc-gen } : assq
    { swap 1 { swap first eqv? } does assoc-gen } : assv
    { swap 1 { swap first equal? } does assoc-gen } : assoc
    // a l -- v -1 or 0 -- returns v from first entry (a . v) in l
    { swap 1 { swap first eq? } does assoc-gen-x } : assq-val
    { swap 1 { swap first eqv? } does assoc-gen-x } : assv-val
    { swap 1 { swap first equal? } does assoc-gen-x } : assoc-val
    // (a1 .. an) e -- (e(a1) .. e(an))
    recursive list-map {
      over null? { drop } {
      swap uncons -rot over execute -rot list-map cons
      } cond
    } swap !

    variable ctxdump  variable curctx
    // (a1 .. an) e -- executes e for a1, ..., an
    { ctxdump @ curctx @ ctxdump 2! curctx 2!
      { curctx 2@ over null? not } { swap uncons rot tuck curctx 2! execute }
      while 2drop ctxdump 2@ curctx ! ctxdump !
    } : list-foreach
    forget ctxdump  forget curctx

    //
    // Experimental implementation of `for` loops with index
    //
    variable loopdump  variable curloop
    { curloop @ loopdump @ loopdump 2! } : push-loop-ctx
    { loopdump 2@ loopdump ! curloop ! } : pop-loop-ctx
    // ilast i0 e -- executes e for i=i0,i0+1,...,ilast-1
    { -rot 2dup > {
        push-loop-ctx {
          triple dup curloop ! first execute curloop @ untriple 1+ 2dup <=
        } until pop-loop-ctx
      } if 2drop drop
    } : for
    // ilast i0 e -- same as 'for', but pushes current index i before executing e
    { -rot 2dup > {
        push-loop-ctx {
          triple dup curloop ! untriple nip swap execute curloop @ untriple 1+ 2dup <=
        } until pop-loop-ctx
      } if 2drop drop
    } : for-i
    // ( -- i )  Returns innermost loop index
    { curloop @ third } : i
    // ( -- j )  Returns outer loop index
    { loopdump @ car third } : j
    { loopdump @ cadr third } : k
    forget curloop  forget loopdump

    //
    // create Lisp-style lists using words "(" and ")"
    //
    variable ')
    'nop box constant ',
    { ") without (" abort } ') !
    { ') @ execute } : )
    anon constant dot-marker
    // m x1 ... xn t m -- (x1 ... xn . t)
    { swap
      { -rot 2dup eq? not }
      { over dot-marker eq? abort"invalid dotted list"
        swap rot cons } while 2drop
    } : list-tail-until-marker
    // m x1 ... xn m -- (x1 ... xn)
    { null swap list-tail-until-marker } : list-until-marker
    { over dot-marker eq? { nip 2dup eq? abort"invalid dotted list" }
      { null swap } cond
      list-tail-until-marker
    } : list-until-marker-ext
    { ') @ ', @ } : ops-get
    { ', ! ') ! } : ops-set
    { anon dup ops-get 3 { ops-set list-until-marker-ext } does ') ! 'nop ', !
    } : (
    // test of Lisp-style lists
    // ( 42 ( `+ 9 ( `* 3 4 ) ) "test" ) .l cr
    // ( `eq? ( `* 3 4 ) 3 4 * ) .l cr
    // `alpha ( `beta `gamma `delta ) cons .l cr
    // { ( `eq? ( `* 3 5 pick ) 3 4 roll * ) } : 3*sample
    // 17 3*sample .l cr

    // similar syntax _( x1 .. xn ) for tuples
    { 2 { 1+ 2dup pick eq? } until 3 - nip } : count-to-marker
    { count-to-marker tuple nip } : tuple-until-marker
    { anon dup ops-get 3 { ops-set tuple-until-marker } does ') ! 'nop ', ! } : _(
    // test of tuples
    // _( _( 2 "two" ) _( 3 "three" ) _( 4 "four" ) ) .dump cr

    // pseudo-Lisp tokenizer
    "()[]'" 34 hold constant lisp-delims
    { lisp-delims 11 (word) } : lisp-token
    { null cons `quote swap cons } : do-quote
    { 1 { ', @ 2 { 2 { ', ! execute ', @ execute } does ', ! }
          does ', ! } does
    } : postpone-prefix
    { ', @ 1 { ', ! } does ', ! } : postpone-',
    ( `( ' ( pair
      `) ' ) pair
      `[ ' _( pair
      `] ' ) pair
      `' ' do-quote postpone-prefix pair
      `. ' dot-marker postpone-prefix pair
      `" { char " word } pair
      `;; { 0 word drop postpone-', } pair
    ) constant lisp-token-dict
    variable eol
    { eol @ eol 0! anon dup ') @ 'nop 3
      { ops-set list-until-marker-ext true eol ! } does ') ! rot ', !
      { lisp-token dup (number) dup { roll drop } {
          drop atom dup lisp-token-dict assq { nip second execute } if
        } cond
        ', @ execute
        eol @
      } until
      -rot eol ! execute
    } :_ List-generic(
    { 'nop 'nop List-generic( } :_ LIST(
    // LIST((lambda (x) (+ x 1)) (* 3 4))
    // LIST('(+ 3 4))
    // LIST(2 3 "test" . 9)
    // LIST((process '[plus 3 4]))
}

//
// TonUtil.fif
//

/// Tests parsing of TonUtil.fif by embedding its contents
asm fun embedTonUtilFif() {
    library TonUtil // TON Blockchain Fift Library
    "Lists.fif" include

    -1 constant Masterchain
    0 constant Basechain

    // parse workchain id
    // ( S -- workchain )
    { (number) 1- abort"workchain id must be an integer"
      dup 32 fits not abort"workchain id must fit in 32 bits"
    } : parse-workchain-id

    { (number) 1- abort"integer expected" } : parse-int

    { over null? ' swap if drop } : replace-if-null

    // Private key load/generate
    // ( fname -- pubkey privkey )
    { dup ."Loading private key from file " type cr
      file>B dup Blen 32 <> abort"Private key must be exactly 32 bytes long"
      dup priv>pub swap
    } : load-keypair
    // ( fname -- pubkey privkey )
    { dup file-exists?
      { load-keypair }
      { dup newkeypair swap rot over swap B>file
        rot ."Saved new private key to file " type cr
      } cond
    } : load-generate-keypair

    // Parse smart-contract address
    // ( S -- workchain addr bounce? )
    { $>smca not abort"invalid smart-contract address"
      1 and 0=
    } : parse-smc-addr

    // ( x -- ) Displays a 64-digit hex number
    { 64 0x. } : 64x.
    { 64 0X. } : 64X.
    // ( wc addr -- )  Show address in <workchain>:<account> form
    { swap ._ .":" 64x. } : .addr
    // ( wc addr flags -- )  Show address in base64url form
    { smca>$ type } : .Addr
    // ( wc addr fname -- )  Save address to file in 36-byte format
    { -rot 256 u>B swap 32 i>B B+ swap B>file } : save-address
    // ( wc addr fname -- )  Save address and print message
    { dup ."(Saving address to file " type .")" cr save-address
    } : save-address-verbose

    // ( fname -- wc addr )  Load address from file
    { file>B 32 B|
      dup Blen { 32 B>i@ } { drop Basechain } cond
      swap 256 B>u@
    } : load-address
    // ( fname -- wc addr )  Load address from file and print message
    { dup ."(Loading address from file " type .")" cr load-address
    } : load-address-verbose
    // Parse string as address or load address from file (if string is prefixed by @)
    // ( S default-bounce -- workchain addr bounce? )
    { over $len 0= abort"empty smart-contract address"
      swap dup 1 $| swap "@" $=
      { nip load-address rot } { drop nip parse-smc-addr } cond
    } : parse-load-address

    // ( hex-str -- addr )  Parses ADNL address
    { dup $len 64 <> abort"ADNL address must consist of exactly 64 hexadecimal characters"
      (hex-number) 1 <> abort"ADNL address must consist of 64 hexadecimal characters"
      dup 256 ufits not abort"invalid ADNL address"
    } : parse-adnl-address

    // ( b wc addr -- b' )  Serializes address into Builder b
    { -rot 8 i, swap 256 u, } : addr,
    { over 8 fits { rot b{100} s, -rot addr, } {
      rot b{110} s, 256 9 u, rot 32 i, swap 256 u, } cond
    } : Addr,

    // Gram utilities
    1000000000 constant Gram
    { Gram swap */r } : Gram*/
    { Gram * } : Gram*
    { (number) dup { 1- ' Gram*/ ' Gram* cond true } if
    } : $>GR?
    // ( S -- nanograms )
    { $>GR? not abort"not a valid Gram amount"
    } : $>GR
    { bl word $>GR 1 'nop } ::_ GR$
    // ( nanograms -- S )
    { dup abs <# ' # 9 times char . hold #s rot sign #>
    nip -trailing0 } : (.GR)
    { (.GR) ."GR$" type } : .GR_
    { .GR_ space } : .GR

    // b x -- b'  ( serializes a Gram amount )
    { -1 { 1+ 2dup 8 * ufits } until
      rot over 4 u, -rot 8 * u, } : Gram,
    // s -- x s'  ( deserializes a Gram amount )
    { 4 u@+ swap 8 * u@+ } : Gram@+
    // s -- x
    { 4 u@+ swap 8 * u@ } : Gram@

    // currency collections
    // b x --> b'  ( serializes a VarUInteger32 )
    { -1 { 1+ 2dup 8 * ufits } until
      rot over 5 u, -rot 8 * u, } : VarUInt32,
    // s --> x  ( deserializes a VarUInteger32 )
    { 5 u@+ swap 8 * u@ } : VarUInt32@
    32 constant cc-key-bits
    ' VarUInt32, : val,
    ' VarUInt32@ : val@
    // d k v -- d'
    { <b swap val, b> <s swap rot cc-key-bits idict!+ not abort"cannot add key-value to CurrencyCollection"
    } : +newccpair
    { dup { -rot tuck swap cc-key-bits idict@- { val@ 2swap -rot + } { swap rot } cond +newccpair
      } { 2drop } cond
    } : +ccpair
    dictnew constant cc0   // zero currency collection
    // ( v k -- d )  Creates currency collection representing v units of currency k
    { cc0 swap rot +ccpair } : of-cc
    { dictnew { over null? not } { swap uncons -rot unpair +ccpair } while nip } : list>cc
    { dup null? { ."(null)" drop } { val@ ._ } cond } dup : .maybeVarUInt32 : .val
    { swap cc-key-bits { rot { ."+" } if .val ."*$" ._ true true } idictforeach drop } : (.cc)
    { false (.cc) { ."0" } ifnot } : .cc_
    { .cc_ space } : .cc
    { true (.cc) drop } : .+cc_
    { .+cc_ space } : .+cc
    { cc-key-bits { rot . ."-> " swap .val .val ."; " true } dictdiff drop cr } : show-cc-diff
    { cc-key-bits { val@ swap val@ + val, true } dictmerge } : cc+
    { null swap cc-key-bits { val@ pair swap cons true } idictforeach drop } : cc>list-rev
    { cc>list-rev list-reverse } : cc>list
    forget val,  forget val@  forget .val

    // ( S -- x -1 or 0 )
    { (number) dup 2 = { -rot 2drop } if 1 = } : int?
    { int? dup { drop dup 0< { drop false } { true } cond } if } : pos-int?
    // ( S -- k v -1 or 0 )  Parses expression <value>*<currency> or <value>*$<currency>
    { dup "*" $pos dup 0< { 2drop false } {
      $| dup $len 2 < { 2drop false } {
      1 $| nip dup 1 $| swap "$" $= { swap } if drop
      int? dup { over 32 fits { 2drop false } ifnot } if
      not { drop false } {
      swap pos-int? not { drop false } {
      true
      } cond } cond } cond } cond
    } : cc-key-value?
    // ( S -- D -1 or 0 )  Parses an extra currency collection
    // e.g. "10000*$3+7777*$-11" means "10000 units of currency #3 and 7777 units of currency #-11"
    { dictnew {  // S D
        swap dup "+" $pos dup 0< { drop null -rot } { $| 1 $| nip -rot } cond
        cc-key-value? { +ccpair over null? dup { rot drop true } if } { 2drop false true } cond
      } until
    } : $>xcc?
    { $>xcc? not abort"invalid extra currency collection" } : $>xcc
    { char } word dup $len { $>xcc } { drop dictnew } cond 1 'nop } ::_ CX{

    // complete currency collections
    { $>xcc? { true } { drop false } cond } : end-parse-cc
    // ( S -- x D -1 or 0 )  Parses a currency collection
    // e.g. "1.2+300*$2" means "1200000000ng plus 300 units of currency #2"
    { 0 swap dup "+" $pos dup 0< { drop dup
          $>GR? { nip nip dictnew true } { end-parse-cc } cond
        } { over swap $| swap $>GR? { 2swap 2drop swap 1 $| nip } { drop
      } cond end-parse-cc } cond
    } : $>cc?
    { $>cc? not abort"invalid currency collection" } : $>cc
    { char } word dup $len { $>cc } { drop 0 dictnew } cond 2 'nop } ::_ CC{
    // ( x D -- )
    { swap ?dup { .GR_ .+cc_ } { .cc_ } cond } : .GR+cc_
    { .GR+cc_ space } : .GR+cc
    { -rot Gram, swap dict, } : Gram+cc,

    // Libraries
    // ( -- D )  New empty library collection
    ' dictnew : Libs{
    // ( D -- D )  Return library collection as dictionary
    'nop : }Libs
    // ( D c x -- D' )  Add a public/private library c to collection D
    { <b swap 1 u, over ref, b> <s swap hash rot 256 udict!+
      0= abort"duplicate library in collection" } : lib+
    // ( D c -- D' )  Add private library c to collection D
    { 0 lib+ } : private_lib
    // ( D c -- D' )  Add public library c to collection D
    { 1 lib+ } : public_lib

    // serialize simple transfers with long comments
    // b B n -- b'
    recursive append-long-bytes {
      over Blen over <= { drop B, } {
        B| <b swap 127 append-long-bytes b> -rot B, swap ref,
      } cond
    } swap !
    // b S n -- b'
    { swap $>B swap append-long-bytes } : append-long-string
    // S -- c
    { <b over $len { 0 32 u, swap 36 append-long-string } { nip } cond b>
    } : simple-transfer-body

    // ( S -- x )  parse public key
    { dup $len 48 <> abort"public key must be 48 characters long"
      base64url>B dup Blen 36 <> abort"public key must be 48 characters long"
      34 B| 16 B>u@ over crc16 <> abort"crc16 mismatch in public key"
      16 B>u@+ 0x3ee6 <> abort"invalid tag in public key"
      256 B>u@
    } : parse-pubkey
    { bl word parse-pubkey 1 'nop } ::_ PK'
    // ( x -- S )  serialize public key
    { 256 u>B B{3ee6} swap B+ dup crc16 16 u>B B+ B>base64 } : pubkey>$
    { pubkey>$ type } : .pubkey

    // ( S -- x )  parse validator-encoded public key
    { base64>B dup Blen 36 <> abort"public key with magic must be 36 bytes long"
      4 B| swap 32 B>u@ 0xC6B41348 <> abort"unknown magic for public key (not Ed25519)"
    } : parse-val-pubkey
    { bl word parse-val-pubkey 1 'nop } ::_ VPK'
    { char } word base64>B 1 'nop } ::_ B64{

    // adnl address parser
    { 256 u>B B{2D} swap B+ dup crc16 16 u>B B+ } : adnl-preconv
    { swap 32 /mod dup 26 < { 65 } { 24 } cond + rot swap hold } : Base32#
    { <# ' Base32# 8 times #> } : Base32#*8
    { "" over Blen 5 / { swap 40 B>u@+ Base32#*8 nip rot swap $+ } swap times nip } : B>Base32

    // ( x -- S )  Converts an adnl-address from a 256-bit integer to a string
    { adnl-preconv B>Base32 1 $| nip } : adnl>$

    { 65 - dup 0>= { -33 and dup 26 < } { 41 + dup 25 > over 32 < and } cond ?dup nip } : Base32-digit?
    { Base32-digit? not abort"not a Base32 digit" } : Base32-digit
    { 0 { over $len } { swap 1 $| -rot (char) Base32-digit swap 5 << + } while nip } : Base32-number
    { B{} { over $len } { swap 8 $| -rot Base32-number 40 u>B B+ } while nip } : Base32>B

    // ( S -- x )  Converts an adnl address from a string to 256-bit integer
    { dup $len 55 <> abort"not 55 alphanumeric characters" "F" swap $+ Base32>B
      33 B| 16 B>u@ over crc16 <> abort"crc16 checksum mismatch"
      8 B>u@+ 0x2D <> abort"not a valid adnl address" 256 B>u@ } : $>adnl

    { 65 - dup 0>= { -33 and 10 + dup 16 < } { 17 + dup 0>= over 10 < and } cond ?dup nip } : hex-digit?
    // ( S -- x -1 or 0 )  Parses a hexadecimal integer
    { dup $len {
        0 {
          4 << swap 1 $| -rot (char) hex-digit?  // S a d -1 or S a 0
          { + over $len 0= } { drop -1 true } cond
        } until
        dup 0< { 2drop false } { nip true } cond
      } { drop false } cond
    } : hex$>u?
    // ( S -- x )
    { hex$>u? not abort"not a hexadecimal number" } : hex$>u

    { dup $len 64 = { hex$>u } {
      dup $len 55 = { $>adnl } {
        true abort"invalid adnl address"
      } cond } cond
    } : parse-adnl-addr
    { adnl>$ type } : .adnl
    { bl word parse-adnl-addr 1 'nop } ::_ adnl:

    // ( x a b -- a<=x<=b )
    { 2 pick >= -rot >= and } : in-range?

    // ( c i -- ? )  Checks whether c is a valid value for config param #i
    def? config-valid? {
      { nip 0>= { ."warning: cannot check validity of configuration parameter value, use create-state instead of fift to check validity" cr } if
        true } : config-valid?
    } ifnot

    { dup -1000 = { drop <s ref@ <s 12 u@ 0xFF0 = } {
      dup -1001 = { drop <s ref@ <s 12 u@ 0xFF0 = } {
      over null? { 2drop true } {
      config-valid?
      } cond } cond } cond
    } : is-valid-config?


    // Get anycast depth / rewrite_pfx or return 0
    // ( S -- x y S )
    {
        // maybe
        1 u@+ swap 0 >
        {
            // anycast_info$_ depth:(#<= 30) { depth >= 1 }
            //    rewrite_pfx:(bits depth) = Anycast;
            30 u@+ swap // get depth

            dup 1 > {
                dup 2 roll swap u@+ // get rewrite_pfx
                // return depth, rewrite_pfx, slice
            }
            {
                drop // drop depth (<=1)
                0 0 2 roll // set anycast to none
            } cond
        }
        {
            0 0 2 roll // set anycast to none
        } cond
    } : maybe-anycast

    // Rewrite first bits of addr with anycast info
    { // input: anycast depth, rewrite_pfx, workchain, slice, address length
        4 -roll
        3 roll dup dup 0 = { 2drop 2 roll drop }
        {
            rot swap u@+ swap drop
            3 roll
            <b swap 3 roll u, b> <s swap |+
        } cond // rewrite first bits of address with rewrite_pfx
        2 roll
        u@+ // get address
    } : parse-address-with-anycast

    // Parse Slice S and return:
    // 0 `addr_none S - if addr_none$00 is parsed
    // addr `addr_extern S - if addr_extern$01 is parsed
    // wc addr `addr_std S - if addr_std$10 is parsed
    // wc addr `addr_var S - if addr_var$11 is parsed
    // ( S -- 0 A S or addr A S or wc addr A S )
    { 2 u@+ swap dup 0>  // Get addr: addr_none$00 / addr_extern$01 / addr_std$10 / addr_var$11
        { // if greater that zero
           dup 1 >
           {
                2 =
                {
                    // if addr_std$10
                    // anycast:(Maybe Anycast)
                    // workchain_id:int8
                    // address:bits256  = MsgAddressInt;
                    maybe-anycast // get anycast depth, bits, slice
                    8 i@+ // get workchain
                    256 parse-address-with-anycast
                    `addr-std swap
                }

                {
                    // if addr_var$11
                    // anycast:(Maybe Anycast)
                    // addr_len:(## 9)
                    // workchain_id:int32
                    // address:(bits addr_len) = MsgAddressInt;
                    maybe-anycast // get anycast depth, bits, slice
                    9 u@+  // get addr_len
                    32 i@+ // get workchain
                    swap 2 -roll // move workchain to neede position
                    swap parse-address-with-anycast
                    `addr-var swap
                } cond

           }
           {
                drop // drop header (dup for statment upper)
                // if addr_extern$01
                // addr_extern$01 len:(## 9)
                // external_address:(bits len)
                9 u@+ swap  // bit len
                u@+ // external_address
                `addr-extern swap
           } cond
        }
        {
            swap
            // if addr_none$00
            `addr-none swap
        } cond
    } : addr@+

    { addr@+ drop } : addr@

    // User-friendly prints output of addr@
    // (0 A or addr A or wc addr A -- )
    {
        dup `addr-none eq?
        { 2drop ."addr_none" }
        {
            `addr-extern eq?
            { (dump) type }
            { (x.) swap (dump) ":" $+ swap $+ type }
            cond
        }
        cond
    } : print-addr // print addr with workchain

    forget maybe-anycast
    forget parse-address-with-anycast
}

//
// Stack.fif
//

/// Tests parsing of Stack.fif by embedding its contents
asm fun embedStackFif() {
    library Stack  // advanced stack manupulation library
    "Lists.fif" include
    // S(a b c - a c 2 a b) would compile to code performing the requested stack manipulation

    // interface to low-level stack manipulation primitives
    { (number) 1- abort"index expected" dup 0 < over 255 > or
      abort"index 0..255 expected"
    } : (idx)
    // push(n) : a0 .. an - a0 .. an a0  equivalent to "n pick"
    // push(0) = dup, push(1) = over
    { 0 char ) word (idx) <push> } ::_ push(
    // pop(n) : a0 a1 .. a(n-1) an - an a1 .. a(n-1)
    // pop(0) = drop, pop(1) = nip
    { 0 char ) word (idx) <pop> } ::_ pop(
    // xchg(i,j) : equivalent to "i j exch2"
    { 0 char , word (idx) char ) word (idx) <xchg> } ::_ xchg(
    // xchg0(i) : equivalent to "i exch" or "xchg(0,i)"
    // xchg0(1) = swap
    { 0 char ) word (idx) 0 <xchg> } ::_ xchg0(
    forget (idx)

    // parser for stack notation expressions
    ")" 34 hold +"  -" constant stk-delims
    anon constant stk-start
    anon constant stk-to
    variable stk-mode
    { stk-delims 11 (word) } : stk-token
    'nop : mk-lit
    // stk-start vn ... v0 -- stk-start ... v0 i  where v[i]=v0
    { 0 {
      1+ 2dup 2+ pick dup stk-start eq? { 2drop drop 0 true } { eqv? } cond
      } until
    } : stk-lookup
    // stk-start a1 .. an stk-to b1 .. bm -- [a1 .. an] [b1 .. bm]
    { stk-mode @ 0= abort"identifier expected" } : chk-lit
    { stk-to list-until-marker stk-mode !
      stk-start list-until-marker stk-mode @
      stk-mode 0!
    } : build-stk-effect
    { stk-start stk-mode 0! {
      stk-token dup ")" $= { drop true } {
      dup "-" $= {
        drop stk-mode @ abort"duplicate -" true stk-mode ! stk-to false } {
      dup 34 chr $= { chk-lit drop char " word mk-lit false } {
      dup (number) ?dup { chk-lit 1- { swap mk-lit -rot } if mk-lit nip false } {
      atom dup `_ eq? { stk-mode @ abort"identifier expected" false } {
      stk-lookup 0= stk-mode @ = {
        stk-mode @ { atom>$ +" -?" } { atom>$ +" redefined" } cond abort } {
      false
      } cond } cond } cond } cond } cond } cond } until
      stk-mode @ 0= abort"'-' expected"
      build-stk-effect
    } :_ parse-stk-list(

    // stack operation list construction
    variable op-rlist
    { op-rlist null! } : clear-op-list
    { op-rlist @ list-reverse } : get-op-list
    { op-rlist @ cons op-rlist ! } : issue-op
    { minmax `xchg -rot triple } : op-xchg
    { `push swap pair } : op-push
    { `lit swap pair } : op-lit
    { `pop swap pair } : op-pop
    0 op-pop constant op-drop
    { 2dup <> { op-xchg issue-op } if } : issue-xchg
    { op-push issue-op } : issue-push
    { op-lit issue-op } : issue-lit
    { op-pop issue-op } : issue-pop
    { op-drop issue-op } : issue-drop
    { ' issue-drop swap times } : issue-drop-#

    // emulated stack contents
    variable emul-stk
    { emul-stk @ count } : emul-depth
    { emul-depth 1- swap - } : adj-i
    { emul-depth 1- tuck swap - swap rot - swap } : adj-ij
    // i j --
    { adj-ij 2dup emul-stk @ tuck swap [] swap rot [] rot // i sj si j
      emul-stk @ -rot []= swap rot []= emul-stk !
    } : emul-xchg
    { emul-stk @ tpop drop emul-stk ! } : emul-drop
    // i --
    { 0 emul-xchg emul-drop } : emul-pop
    // i -- s[i]
    { emul-stk @ swap [] } : emul-stk[]
    // i -- si
    { adj-i emul-stk[] } : emul-get
    { 0 emul-get } : emul-tos
    // v i -- ?   Check whether s[i]=v
    { dup emul-depth < { emul-stk[] eqv? } { 2drop false } cond } : emul[]-eq?
    // v -- i or -1   Returns maximum i with s[i]=v
    { emul-stk @ dup count { // v s i
      ?dup 0= { -1 true } { 1- 2dup [] 3 pick eqv? } cond  // v s i' ?
      } until nip nip
    } : emul-stk-lookup-rev
    // i --
    { emul-get emul-stk @ swap , emul-stk ! } : emul-push
    { emul-stk @ swap , emul-stk ! } : emul-lit
    // show emulated stack contents similarly to .s
    { emul-stk @ explode dup 1 reverse ' .l swap times cr } : .e

    // both issue an operation and emulate it
    { 2dup issue-xchg emul-xchg } : issue-emul-xchg
    { dup issue-push emul-push } : issue-emul-push
    { dup issue-lit emul-lit } : issue-emul-lit
    { dup issue-pop emul-pop } : issue-emul-pop
    { issue-drop emul-drop } : issue-emul-drop
    { ' issue-emul-drop swap times } : issue-emul-drop-#

    // b.. s -- b.. s   moves tos value to stk[s]
    { dup emul-stk[] 2 pick cdr list-member-eqv? {
      dup adj-i 0 issue-emul-xchg } { dup adj-i issue-emul-pop } cond
    } : move-tos-to

    // new s -- ops registered
    { { over null? not } {
      // .sl .e get-op-list .l cr
      // get-op-list list-length 100 > abort"too long"
      emul-depth over >
        { over emul-tos swap list-member-eqv? not } { false } cond {
      // b.. s  tos unneeded
      issue-emul-drop } {
      over car // b.. s b1
      2dup swap emul[]-eq? { drop swap cdr swap 1+ } {
      dup emul-stk-lookup-rev // b.. s b1 i
      dup 0< { // b.. s b1 i  not found, must be a literal
        drop dup atom? abort"unavailable value"
        issue-emul-lit } {
      dup 3 pick < { // b.. s b1 i  found in bottom s stack values
        nip adj-i issue-emul-push  // b.. s
        dup emul-depth 1- < { move-tos-to } if
      } {
      emul-depth 1- over = { // b.. s b1 i  found in tos
        2drop move-tos-to
      } { // b.. s b1 i
        nip over adj-ij issue-emul-xchg
      } cond } cond } cond } cond } cond } while
      nip emul-depth swap - issue-emul-drop-#
    } : generate-reorder-ops

    // old new -- op-list
    { emul-stk @ op-rlist @ 2swap
      swap list>tuple emul-stk ! clear-op-list
      0 generate-reorder-ops get-op-list
      -rot op-rlist ! emul-stk !
    } : generate-reorder
    { parse-stk-list( generate-reorder } :_ SG(

    // op-list rewriting according to a ruleset
    // l f l1 l2 -- l' -1 or l f  with l' = l2 + (l - l1)
    { push(3) rot list- { list+ nip nip true } { drop } cond
    } : try-rule
    // l f ll -- l' -1 or l f
    { { dup null? not } { uncons 3 -roll unpair try-rule rot } while drop
    } : try-ruleset
    // l ll -- l'
    { swap { over false swap try-ruleset 0= } until nip
    } : try-ruleset*
    // l ruleset -- l'
    recursive try-ruleset*-everywhere {
      tuck try-ruleset* dup null? { nip } {
        uncons rot try-ruleset*-everywhere cons } cond
    } swap !
    LIST(
     [([xchg 0 1] [xchg 0 2]) ([rot])]
     [([xchg 0 1] [xchg 1 2]) ([-rot])]
     [([xchg 0 2] [xchg 1 2]) ([rot])]
     [([xchg 0 2] [xchg 0 1]) ([-rot])]
     [([xchg 1 2] [xchg 0 1]) ([rot])]
     [([xchg 1 2] [xchg 0 2]) ([-rot])]
     [([xchg 0 1] [rot]) ([xchg 0 2])]
     [([-rot] [xchg 0 1]) ([xchg 0 2])]
     [([xchg 0 2] [xchg 1 3]) ([2swap])]
     [([xchg 1 3] [xchg 0 2]) ([2swap])]
     [([push 1] [push 1]) ([2dup])]
     [([push 3] [push 3]) ([2over])]
     [([pop 0] [pop 0]) ([2drop])]
     [([pop 1] [pop 0]) ([2drop])]
     [([xchg 0 1] [push 1]) ([tuck])]
     [([rot] [-rot]) ()]
     [([-rot] [rot]) ()]
    ) constant fift-stack-ruleset
    { fift-stack-ruleset try-ruleset*-everywhere } : fift-ops-rewrite
    { SG( fift-ops-rewrite } :_ SGF(

    // helpers for creating Fift source strings for one fift-op
    // i j -- s
    { minmax over { "xchg(" rot (.) $+ +"," swap (.) $+ +")" }
      { nip dup 1 = { drop "swap" } {
        ?dup { "xchg0(" swap (.) $+ +")" } { "" } cond
      } cond } cond
    } : source-<xchg>
    // i -- s
    { dup 1 = { drop "over" } {
      ?dup { "push(" swap (.) $+ +")" } { "dup" } cond
      } cond
    } : source-<push>
    // i -- s
    { dup 1 = { drop "nip" } {
      ?dup { "pop(" swap (.) $+ +")" } { "drop" } cond
      } cond
    } : source-<pop>
    // lit -- s
    { dup string? { char " chr swap $+ char " hold } { (.) } cond
    } : source-<lit>

    // dictionary with all fift op compilation/source creation
    { 0 swap (compile) } : fop-compile
    ( _( `xchg 2 { <xchg> fop-compile } { source-<xchg> swap cons } )
      _( `push 1 { <push> fop-compile } { source-<push> swap cons } )
      _( `pop 1 { <pop> fop-compile } { source-<pop> swap cons } )
      _( `lit 1 { 1 'nop (compile) } { source-<lit> swap cons } )
      _( `rot 0 { ' rot fop-compile } { "rot" swap cons } )
      _( `-rot 0 { ' -rot fop-compile } { "-rot" swap cons } )
      _( `tuck 0 { ' tuck fop-compile } { "tuck" swap cons } )
      _( `2swap 0 { ' 2swap fop-compile } { "2swap" swap cons } )
      _( `2drop 0 { ' 2drop fop-compile } { "2drop" swap cons } )
      _( `2dup 0 { ' 2dup fop-compile } { "2dup" swap cons } )
      _( `2over 0 { ' 2over fop-compile } { "2over" swap cons } )
    ) box constant fift-op-dict

    { dup atom? { atom>$ } { drop "" } cond
      "unknown operation " swap $+ abort
    } : report-unknown-op
    variable 'fop-entry-exec
    // process fift-op according to 'fop-entry-exec
    // ... op - ...
    { dup first dup fift-op-dict @ assq { report-unknown-op } ifnot
      dup second 1+ push(3) count <> abort"incorrect param count"
      nip swap explode dup roll drop 1- roll // o2 .. on entry
      'fop-entry-exec @ execute
    } : process-fift-op

    // compile op-list into Fift wordlist
    // wl op-list -- wl'
    { { third execute } 'fop-entry-exec !
      swap ' process-fift-op foldl } : compile-fift-op*
    // op-list -- e
    { fift-ops-rewrite ({) swap compile-fift-op* (}) } : ops>wdef

    // S(<orig-stack> - <new-stack>) compiles a "word" performing required action
    { SG( ops>wdef 0 swap } ::_ S(
    // 1 2 3 S(a b c - c a b a) .s  would print 3 1 2 1

    // transform op-list into Fift source
    // ls op -- ls'
    { fift-ops-rewrite
      { 3 [] execute } 'fop-entry-exec !
      null ' process-fift-op foldl
      dup null? { drop "" } { { +" " swap $+ } foldr-ne } cond
    } : ops>$
    { SG( ops>$ 1 'nop } ::_ $S(
    { SG( ops>$ type } :_ .$S(
    // $S(a b c - b c a c a c) => string "rot 2dup over"
    // S(a b c - b c a c a c) => compile/execute block { rot 2dup over }
    // $S(_ x y _ - y x) => string "drop pop(2)"
    // .$S(x1 x2 - 17 x1) => print string "drop 17 swap"

    // simplify/transform sequences of stack manipulation operations
    LIST(. [a b c d e f g h i j]) constant std-stack
    { stk-start std-stack explode drop stk-to std-stack explode drop
    } : simplify<{
    { build-stk-effect generate-reorder ops>$ } : }>stack
    // simplify<{ drop drop over over -13 }>stack => string "2drop 2dup -13"
    // simplify<{ 17 rot }>stack => string "swap 17 swap"
    // simplify<{ 5 1 reverse }>stack => string "xchg(1,5) xchg(2,4)"
}

//
// GetOpt.fif
//

/// Tests parsing of GetOpt.fif by embedding its contents
asm fun embedGetOptFif() {
    library GetOpt  // Simple command-line options parser
    "Lists.fif" include

    // May be used as follows:
    // begin-options
    //   "h" { ."Help Message" 0 halt } short-option
    //   "v" { parse-int =: verbosity } short-option-arg
    //   "i" "--interactive" { true =: interactive } short-long-option
    // parse-options

    // ( l -- l')  computes tail of list l if non-empty; else ()
    { dup null? ' cdr ifnot } : safe-cdr
    // ( l c -- l')  deletes first c elements from list l
    { ' safe-cdr swap times } : list-delete-first
    // ( l n c -- l' )  deletes c elements starting from n-th in list l
    recursive list-delete-range {
      dup 0<= { 2drop } {
      over 0<= { nip list-delete-first } {
      swap 1- swap rot uncons 2swap list-delete-range cons
      } cond } cond
    } swap !
    // ( n c -- )  deletes $n .. $(n+c-1) from the argument list $*
    { swap 1- $* @ swap rot list-delete-range $* ! } : $*del..
    // ( s s' -- ? )  checks whether s' is a prefix of s
    { tuck $len over $len over >= { $| drop $= } { 2drop drop false } cond
    } : $pfx?
    // ( s -- ? )  checks whether s is an option (a string beginning with '-')
    { dup $len 1 > { "-" $pfx? } { drop false } cond } : is-opt?
    // ( s -- ? )  checks whether s is a digit option
    { 2 $| drop 1 $| nip $>B 8 B>u@ dup 57 <= swap 48 >= and } : is-digit-opt?
    0 box constant disable-digit-opts
    // ( l -- s i or 0 )  finds first string in l beginning with '-'
    { 0 { 1+ over null? { 2drop 0 true } {
      swap uncons over is-opt?
      { disable-digit-opts @ { over is-digit-opt? not } { true } cond } { false } cond
      { drop swap true } { nip swap false } cond
      } cond } until
    } : list-find-opt
    // ( -- s i or 0 )  finds first option in cmdline args
    { $* @ list-find-opt } : first-opt
    ' second : get-opt-flags
    ' first : get-opt-exec
    // ( s t -- ? )  checks whether short/long option s matches description t
    { third $= } : short-option-matches
    { dup get-opt-flags 4 and 0= 3 + [] $=
    } : long-option-matches
    // ( t -- s -1 or 0 )  extracts help message from description
    { dup get-opt-flags 4 and 0= 4 + over count over >
      { [] true } { 2drop false } cond
    } : get-opt-help
    // ( s l -- t -1 or 0 )  finds short/long option s in list l
    { swap 1 { swap short-option-matches } does assoc-gen
    } : lookup-short-option
    { swap 1 { swap long-option-matches } does assoc-gen
    } : lookup-long-option
    // ( s -- s' null or s' s'' )  Splits long option --opt=arg at '='
    { dup "=" $pos 1+ ?dup { tuck $| swap rot 1- $| drop swap } { null } cond
    } : split-longopt
    // ( l -- f or 0 )  Extracts global option flags from first entry of l
    { dup null? { drop 0 } { car get-opt-flags -256 and } cond
    } : get-global-option-flags
    variable options-list
    // ( l -- i or 0 )
    // parses command line arguments according to option description list l
    // and returns index i of first incorrect option
    { dup options-list ! get-global-option-flags
      256 and disable-digit-opts !
      { first-opt dup 0= { true } {
        swap dup "--" $pfx? {  // i s
          dup $len 2 = { drop dup 1 $*del.. 0 true } {
          split-longopt swap options-list @
          lookup-long-option not { drop true } { // i s' t f
          dup get-opt-exec swap get-opt-flags 3 and // i s' e f'
          2 pick null? { dup 1 = } { dup 0= negate } cond  // i s' e f' f''
          dup 1 = { 2drop 2drop true } {
          { drop nip over 1+ $() swap execute 2 $*del.. false } {
          ' nip ifnot execute 1 $*del.. false
        } cond } cond } cond } cond } { // i s
          1 $| nip {
            dup $len 0= { drop 1 $*del.. false true } {
            1 $| swap options-list @  // i s' s l
            lookup-short-option not { drop true true } { // i s' t
            dup get-opt-exec swap get-opt-flags 3 and  // i s' e f'
            ?dup 0= { execute false } {
            2 pick $len { drop execute "" false } {
            2 = { nip null swap execute "" false } {  // i e
            nip over 1+ $() swap execute 2 $*del.. false true
          } cond } cond } cond } cond } cond } until
        } cond
      } cond } until
    } : getopt
    // ( t -- )  Displays help message for one option
    { dup get-opt-flags dup 4 and 2 pick third swap {
        ."-" type ."/" over 3 [] type } {
        dup $len { dup "--" $pfx? { ."-" } ifnot type } {
        drop ."usage: " $0 type
      } cond } cond
      dup 3 and ?dup {
        2 = { ."[=<optarg>]" } { ."=<optarg>" } cond
      } if
      8 and { 9 emit } ifnot
      get-opt-help { type } { ."No help available" } cond cr
    } : show-opt-help
    // ( -- )  Displays options help message according to options-list
    { options-list @ { dup null? not } {
        uncons swap show-opt-help
      } while drop
    } : show-options-help
    // ( l -- )  Parses options and throws an error on failure
    { getopt ?dup {
      $() "cannot parse command line options near `" swap $+ +"`"
      show-options-help abort } if
    } : run-getopt
    anon constant opt-list-marker
    ' opt-list-marker : begin-options
    { opt-list-marker list-until-marker } : end-options
    { end-options run-getopt } : parse-options
    // ( s e -- o )  Creates short/long option s with execution token e
    { 0 rot triple } dup : short-option : long-option
    // ( s s' e -- o ) Creates a combined short option s and long option s' with execution token e
    { 4 2swap 4 tuple } : short-long-option
    { 1 rot triple } dup : short-option-arg : long-option-arg
    { 2 rot triple } dup : short-option-?arg : long-option-?arg
    { 5 2swap 4 tuple } : short-long-option-arg
    { 6 2swap 4 tuple } : short-long-option-?arg
    // ( o s -- s' )  Adds help message to option
    ' , : option-help
    // ( s f -- o )  Creates a generic help message
    { swap 'nop rot "" 3 roll 4 tuple } : generic-help-setopt
    { 0 generic-help-setopt } : generic-help
    256 constant disable-digit-options
}
