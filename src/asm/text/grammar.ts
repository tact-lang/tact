/* Generated. Do not edit. */
/* eslint-disable @typescript-eslint/no-namespace */
/* eslint-disable @typescript-eslint/ban-types */
/* eslint-disable @typescript-eslint/no-redundant-type-constituents */
/* eslint-disable @typescript-eslint/no-duplicate-type-constituents */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as $ from "@tonstudio/parser-runtime"
export namespace $ast {
    export type File = $.Located<{
        readonly $: "File"
        readonly instructions: instructions
    }>
    export type Instruction = $.Located<{
        readonly $: "Instruction"
        readonly name: Id
        readonly args: readonly Argument[]
    }>
    export type ExplicitRef = $.Located<{
        readonly $: "ExplicitRef"
        readonly code: Code
    }>
    export type EmbedSlice = $.Located<{
        readonly $: "EmbedSlice"
        readonly data: DataLiteral
    }>
    export type Exotic = $.Located<{
        readonly $: "Exotic"
        readonly lib: ExoticLibrary | DefaultExotic
    }>
    export type instructions = readonly (Instruction | ExplicitRef | EmbedSlice | Exotic)[]
    export type Argument = $.Located<{
        readonly $: "Argument"
        readonly expression:
            | IntegerLiteral
            | DataLiteral
            | Code
            | Dictionary
            | StackElement
            | ControlRegister
    }>
    export type StackElement = $.Located<{
        readonly $: "StackElement"
        readonly value: string
    }>
    export type ControlRegister = $.Located<{
        readonly $: "ControlRegister"
        readonly value: string
    }>
    export type Code = $.Located<{
        readonly $: "Code"
        readonly instructions: instructions
    }>
    export type Dictionary = $.Located<{
        readonly $: "Dictionary"
        readonly entries: readonly DictionaryEntry[]
    }>
    export type DictionaryEntry = $.Located<{
        readonly $: "DictionaryEntry"
        readonly id: IntegerLiteral
        readonly code: Code
    }>
    export type ExoticLibrary = $.Located<{
        readonly $: "ExoticLibrary"
        readonly data: DataLiteral
    }>
    export type DefaultExotic = $.Located<{
        readonly $: "DefaultExotic"
        readonly data: DataLiteral
    }>
    export type idPart = string | string | string | "_"
    export type Id = $.Located<{
        readonly $: "Id"
        readonly name: string
    }>
    export type DataLiteral = $.Located<{
        readonly $: "DataLiteral"
        readonly value: HexLiteral | BinLiteral | BocLiteral | StringLiteral
    }>
    export type HexLiteral = $.Located<{
        readonly $: "HexLiteral"
        readonly content: string
    }>
    export type BinLiteral = $.Located<{
        readonly $: "BinLiteral"
        readonly content: string
    }>
    export type BocLiteral = $.Located<{
        readonly $: "BocLiteral"
        readonly content: string
    }>
    export type IntegerLiteral = $.Located<{
        readonly $: "IntegerLiteral"
        readonly op: "-" | undefined
        readonly value:
            | IntegerLiteralHex
            | IntegerLiteralBin
            | IntegerLiteralOct
            | IntegerLiteralDec
    }>
    export type IntegerLiteralDec = $.Located<{
        readonly $: "IntegerLiteralDec"
        readonly digits: underscored<digit>
    }>
    export type IntegerLiteralHex = $.Located<{
        readonly $: "IntegerLiteralHex"
        readonly digits: underscored<hexDigit>
    }>
    export type IntegerLiteralBin = $.Located<{
        readonly $: "IntegerLiteralBin"
        readonly digits: underscored<binDigit>
    }>
    export type IntegerLiteralOct = $.Located<{
        readonly $: "IntegerLiteralOct"
        readonly digits: underscored<string>
    }>
    export type underscored<T> = string
    export type hexDigit = string | string | string
    export type binDigit = "0" | "1"
    export type digit = string
    export type StringLiteral = $.Located<{
        readonly $: "StringLiteral"
        readonly value: string
    }>
    export type keyword<T> = T
    export type reservedWord = keyword<"ref" | "embed" | "exotic" | "library">
    export type singleLineComment = string
    export type comment = singleLineComment
    export type space = " " | "\t" | "\r" | "\n" | comment
}
export const File: $.Parser<$ast.File> = $.loc(
    $.field(
        $.pure("File"),
        "$",
        $.field(
            $.lazy(() => instructions),
            "instructions",
            $.eps,
        ),
    ),
)
export const Instruction: $.Parser<$ast.Instruction> = $.loc(
    $.field(
        $.pure("Instruction"),
        "$",
        $.field(
            $.lazy(() => Id),
            "name",
            $.field($.star($.lazy(() => Argument)), "args", $.eps),
        ),
    ),
)
export const ExplicitRef: $.Parser<$ast.ExplicitRef> = $.loc(
    $.field(
        $.pure("ExplicitRef"),
        "$",
        $.right(
            $.lazy(() => keyword($.str("ref"))),
            $.field(
                $.lazy(() => Code),
                "code",
                $.eps,
            ),
        ),
    ),
)
export const EmbedSlice: $.Parser<$ast.EmbedSlice> = $.loc(
    $.field(
        $.pure("EmbedSlice"),
        "$",
        $.right(
            $.lazy(() => keyword($.str("embed"))),
            $.field(
                $.lazy(() => DataLiteral),
                "data",
                $.eps,
            ),
        ),
    ),
)
export const Exotic: $.Parser<$ast.Exotic> = $.loc(
    $.field(
        $.pure("Exotic"),
        "$",
        $.right(
            $.lazy(() => keyword($.str("exotic"))),
            $.field(
                $.alt(
                    $.lazy(() => ExoticLibrary),
                    $.lazy(() => DefaultExotic),
                ),
                "lib",
                $.eps,
            ),
        ),
    ),
)
export const instructions: $.Parser<$ast.instructions> = $.star(
    $.alt(Instruction, $.alt(ExplicitRef, $.alt(EmbedSlice, Exotic))),
)
export const Argument: $.Parser<$ast.Argument> = $.loc(
    $.field(
        $.pure("Argument"),
        "$",
        $.field(
            $.alt(
                $.lazy(() => IntegerLiteral),
                $.alt(
                    $.lazy(() => DataLiteral),
                    $.alt(
                        $.lazy(() => Code),
                        $.alt(
                            $.lazy(() => Dictionary),
                            $.alt(
                                $.lazy(() => StackElement),
                                $.lazy(() => ControlRegister),
                            ),
                        ),
                    ),
                ),
            ),
            "expression",
            $.eps,
        ),
    ),
)
export const StackElement: $.Parser<$ast.StackElement> = $.loc(
    $.field(
        $.pure("StackElement"),
        "$",
        $.field(
            $.stry(
                $.lex(
                    $.right(
                        $.str("s"),
                        $.right(
                            $.opt($.str("-")),
                            $.right(
                                $.lazy(() => IntegerLiteralDec),
                                $.eps,
                            ),
                        ),
                    ),
                ),
            ),
            "value",
            $.eps,
        ),
    ),
)
export const ControlRegister: $.Parser<$ast.ControlRegister> = $.loc(
    $.field(
        $.pure("ControlRegister"),
        "$",
        $.field(
            $.stry(
                $.lex(
                    $.right(
                        $.str("c"),
                        $.right(
                            $.lazy(() => IntegerLiteralDec),
                            $.eps,
                        ),
                    ),
                ),
            ),
            "value",
            $.eps,
        ),
    ),
)
export const Code: $.Parser<$ast.Code> = $.loc(
    $.field(
        $.pure("Code"),
        "$",
        $.right($.str("{"), $.field(instructions, "instructions", $.right($.str("}"), $.eps))),
    ),
)
export const Dictionary: $.Parser<$ast.Dictionary> = $.loc(
    $.field(
        $.pure("Dictionary"),
        "$",
        $.right(
            $.str("["),
            $.field($.star($.lazy(() => DictionaryEntry)), "entries", $.right($.str("]"), $.eps)),
        ),
    ),
)
export const DictionaryEntry: $.Parser<$ast.DictionaryEntry> = $.loc(
    $.field(
        $.pure("DictionaryEntry"),
        "$",
        $.field(
            $.lazy(() => IntegerLiteral),
            "id",
            $.right($.str("=>"), $.field(Code, "code", $.eps)),
        ),
    ),
)
export const ExoticLibrary: $.Parser<$ast.ExoticLibrary> = $.loc(
    $.field(
        $.pure("ExoticLibrary"),
        "$",
        $.right(
            $.lazy(() => keyword($.str("library"))),
            $.field(
                $.lazy(() => DataLiteral),
                "data",
                $.eps,
            ),
        ),
    ),
)
export const DefaultExotic: $.Parser<$ast.DefaultExotic> = $.loc(
    $.field(
        $.pure("DefaultExotic"),
        "$",
        $.field(
            $.lazy(() => DataLiteral),
            "data",
            $.eps,
        ),
    ),
)
export const idPart: $.Parser<$ast.idPart> = $.named(
    "identifier character",
    $.regex<string | string | string | "_">("a-zA-Z0-9_", [
        $.ExpRange("a", "z"),
        $.ExpRange("A", "Z"),
        $.ExpRange("0", "9"),
        $.ExpString("_"),
    ]),
)
export const Id: $.Parser<$ast.Id> = $.named(
    "identifier",
    $.loc(
        $.field(
            $.pure("Id"),
            "$",
            $.field(
                $.lex(
                    $.stry(
                        $.right(
                            $.lookNeg($.lazy(() => reservedWord)),
                            $.right(
                                $.regex<string | string | "_">("a-zA-Z_", [
                                    $.ExpRange("a", "z"),
                                    $.ExpRange("A", "Z"),
                                    $.ExpString("_"),
                                ]),
                                $.right($.star(idPart), $.eps),
                            ),
                        ),
                    ),
                ),
                "name",
                $.eps,
            ),
        ),
    ),
)
export const DataLiteral: $.Parser<$ast.DataLiteral> = $.loc(
    $.field(
        $.pure("DataLiteral"),
        "$",
        $.field(
            $.alt(
                $.lazy(() => HexLiteral),
                $.alt(
                    $.lazy(() => BinLiteral),
                    $.alt(
                        $.lazy(() => BocLiteral),
                        $.lazy(() => StringLiteral),
                    ),
                ),
            ),
            "value",
            $.eps,
        ),
    ),
)
export const HexLiteral: $.Parser<$ast.HexLiteral> = $.loc(
    $.field(
        $.pure("HexLiteral"),
        "$",
        $.right(
            $.str("x{"),
            $.field(
                $.stry($.right($.star($.lazy(() => hexDigit)), $.right($.opt($.str("_")), $.eps))),
                "content",
                $.right($.str("}"), $.eps),
            ),
        ),
    ),
)
export const BinLiteral: $.Parser<$ast.BinLiteral> = $.loc(
    $.field(
        $.pure("BinLiteral"),
        "$",
        $.right(
            $.str("b{"),
            $.field($.stry($.star($.lazy(() => binDigit))), "content", $.right($.str("}"), $.eps)),
        ),
    ),
)
export const BocLiteral: $.Parser<$ast.BocLiteral> = $.loc(
    $.field(
        $.pure("BocLiteral"),
        "$",
        $.right(
            $.str("boc{"),
            $.field($.stry($.star($.lazy(() => hexDigit))), "content", $.right($.str("}"), $.eps)),
        ),
    ),
)
export const IntegerLiteral: $.Parser<$ast.IntegerLiteral> = $.loc(
    $.field(
        $.pure("IntegerLiteral"),
        "$",
        $.field(
            $.opt($.str("-")),
            "op",
            $.field(
                $.alt(
                    $.lazy(() => IntegerLiteralHex),
                    $.alt(
                        $.lazy(() => IntegerLiteralBin),
                        $.alt(
                            $.lazy(() => IntegerLiteralOct),
                            $.lazy(() => IntegerLiteralDec),
                        ),
                    ),
                ),
                "value",
                $.eps,
            ),
        ),
    ),
)
export const IntegerLiteralDec: $.Parser<$ast.IntegerLiteralDec> = $.loc(
    $.field(
        $.pure("IntegerLiteralDec"),
        "$",
        $.field($.lex($.lazy(() => underscored($.lazy(() => digit)))), "digits", $.eps),
    ),
)
export const IntegerLiteralHex: $.Parser<$ast.IntegerLiteralHex> = $.loc(
    $.field(
        $.pure("IntegerLiteralHex"),
        "$",
        $.field(
            $.lex(
                $.right(
                    $.str("0"),
                    $.right(
                        $.regex<"x" | "X">("xX", [$.ExpString("x"), $.ExpString("X")]),
                        $.lazy(() => underscored($.lazy(() => hexDigit))),
                    ),
                ),
            ),
            "digits",
            $.eps,
        ),
    ),
)
export const IntegerLiteralBin: $.Parser<$ast.IntegerLiteralBin> = $.loc(
    $.field(
        $.pure("IntegerLiteralBin"),
        "$",
        $.field(
            $.lex(
                $.right(
                    $.str("0"),
                    $.right(
                        $.regex<"b" | "B">("bB", [$.ExpString("b"), $.ExpString("B")]),
                        $.lazy(() => underscored($.lazy(() => binDigit))),
                    ),
                ),
            ),
            "digits",
            $.eps,
        ),
    ),
)
export const IntegerLiteralOct: $.Parser<$ast.IntegerLiteralOct> = $.loc(
    $.field(
        $.pure("IntegerLiteralOct"),
        "$",
        $.field(
            $.lex(
                $.right(
                    $.str("0"),
                    $.right(
                        $.regex<"o" | "O">("oO", [$.ExpString("o"), $.ExpString("O")]),
                        $.lazy(() => underscored($.regex<string>("0-7", [$.ExpRange("0", "7")]))),
                    ),
                ),
            ),
            "digits",
            $.eps,
        ),
    ),
)
export const underscored = <T>(T: $.Parser<T>): $.Parser<$ast.underscored<T>> =>
    $.stry(
        $.right(
            $.lazy(() => T),
            $.right(
                $.star(
                    $.right(
                        $.opt($.str("_")),
                        $.right(
                            $.lazy(() => T),
                            $.eps,
                        ),
                    ),
                ),
                $.eps,
            ),
        ),
    )
export const hexDigit: $.Parser<$ast.hexDigit> = $.named(
    "hexadecimal digit",
    $.regex<string | string | string>("0-9a-fA-F", [
        $.ExpRange("0", "9"),
        $.ExpRange("a", "f"),
        $.ExpRange("A", "F"),
    ]),
)
export const binDigit: $.Parser<$ast.binDigit> = $.named(
    "binary digit",
    $.regex<"0" | "1">("01", [$.ExpString("0"), $.ExpString("1")]),
)
export const digit: $.Parser<$ast.digit> = $.named(
    "digit",
    $.regex<string>("0-9", [$.ExpRange("0", "9")]),
)
export const StringLiteral: $.Parser<$ast.StringLiteral> = $.loc(
    $.field(
        $.pure("StringLiteral"),
        "$",
        $.field(
            $.lex(
                $.right(
                    $.str('"'),
                    $.left(
                        $.stry(
                            $.star(
                                $.regex<'"' | "\\">(
                                    '^"\\\\',
                                    $.negateExps([$.ExpString('"'), $.ExpString("\\")]),
                                ),
                            ),
                        ),
                        $.str('"'),
                    ),
                ),
            ),
            "value",
            $.eps,
        ),
    ),
)
export const keyword = <T>(T: $.Parser<T>): $.Parser<$ast.keyword<T>> =>
    $.lex(
        $.left(
            $.lazy(() => T),
            $.lookNeg(idPart),
        ),
    )
export const reservedWord: $.Parser<$ast.reservedWord> = $.named(
    "reserved word",
    keyword($.alt($.str("ref"), $.alt($.str("embed"), $.alt($.str("exotic"), $.str("library"))))),
)
export const singleLineComment: $.Parser<$ast.singleLineComment> = $.right(
    $.str("//"),
    $.stry(
        $.star(
            $.regex<"\r" | "\n">("^\\r\\n", $.negateExps([$.ExpString("\r"), $.ExpString("\n")])),
        ),
    ),
)
export const comment: $.Parser<$ast.comment> = singleLineComment
export const space: $.Parser<$ast.space> = $.named(
    "space",
    $.alt(
        $.regex<" " | "\t" | "\r" | "\n">(" \\t\\r\\n", [
            $.ExpString(" "),
            $.ExpString("\t"),
            $.ExpString("\r"),
            $.ExpString("\n"),
        ]),
        comment,
    ),
)
