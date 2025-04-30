/* Generated. Do not edit. */
/* eslint-disable @typescript-eslint/no-namespace */
/* eslint-disable @typescript-eslint/ban-types */
/* eslint-disable @typescript-eslint/no-redundant-type-constituents */
/* eslint-disable @typescript-eslint/no-duplicate-type-constituents */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as $ from "@tonstudio/parser-runtime"
export namespace $ast {
    export type VmLoc = $.Located<{
        readonly $: "VmLoc"
        readonly hash: hex
        readonly offset: $number
    }>
    export type VmStack = $.Located<{
        readonly $: "VmStack"
        readonly stack: string
    }>
    export type VmExecute = $.Located<{
        readonly $: "VmExecute"
        readonly instr: string
    }>
    export type VmLimitChanged = $.Located<{
        readonly $: "VmLimitChanged"
        readonly limit: $number
    }>
    export type VmGasRemaining = $.Located<{
        readonly $: "VmGasRemaining"
        readonly gas: $number
    }>
    export type VmException = $.Located<{
        readonly $: "VmException"
        readonly errno: $number
        readonly message: string
    }>
    export type VmExceptionHandler = $.Located<{
        readonly $: "VmExceptionHandler"
        readonly errno: $number
    }>
    export type VmFinalC5 = $.Located<{
        readonly $: "VmFinalC5"
        readonly value: Cell
    }>
    export type VmUnknown = $.Located<{
        readonly $: "VmUnknown"
        readonly text: string
    }>
    export type vmLine =
        | VmLoc
        | VmStack
        | VmExecute
        | VmLimitChanged
        | VmGasRemaining
        | VmException
        | VmExceptionHandler
        | VmFinalC5
        | VmUnknown
    export type VmParsedStack = $.Located<{
        readonly $: "VmParsedStack"
        readonly values: readonly VmStackValue[]
    }>
    export type VmStackValue = $.Located<{
        readonly $: "VmStackValue"
        readonly value:
            | Null
            | NaN
            | Integer
            | Tuple
            | TupleParen
            | Cell
            | Continuation
            | Builder
            | CellSlice
            | Unknown
    }>
    export type Null = $.Located<{
        readonly $: "Null"
    }>
    export type NaN = $.Located<{
        readonly $: "NaN"
    }>
    export type Integer = $.Located<{
        readonly $: "Integer"
        readonly value: $number
    }>
    export type Tuple = $.Located<{
        readonly $: "Tuple"
        readonly elements: readonly VmStackValue[]
    }>
    export type TupleParen = $.Located<{
        readonly $: "TupleParen"
        readonly elements: readonly VmStackValue[]
    }>
    export type Cell = $.Located<{
        readonly $: "Cell"
        readonly value: hex
    }>
    export type Continuation = $.Located<{
        readonly $: "Continuation"
        readonly value: string
    }>
    export type Builder = $.Located<{
        readonly $: "Builder"
        readonly value: hex
    }>
    export type Unknown = $.Located<{
        readonly $: "Unknown"
    }>
    export type CellSlice = $.Located<{
        readonly $: "CellSlice"
        readonly body: CellSliceBody | CellSliceShortBody
    }>
    export type CellSliceBody = $.Located<{
        readonly $: "CellSliceBody"
        readonly value: hex
        readonly bits: CellSliceBits
        readonly refs: CellSliceRefs
    }>
    export type CellSliceBits = $.Located<{
        readonly $: "CellSliceBits"
        readonly start: $number
        readonly end: $number
    }>
    export type CellSliceRefs = $.Located<{
        readonly $: "CellSliceRefs"
        readonly start: $number
        readonly end: $number
    }>
    export type CellSliceShortBody = $.Located<{
        readonly $: "CellSliceShortBody"
        readonly value: hex
    }>
    export type $number = {
        readonly op: "-" | undefined
        readonly value: string
    }
    export type digit = string
    export type hexDigit = string | string | string
    export type hex = string
    export type space = " " | "\t" | "\r" | "\n"
}
export const VmLoc: $.Parser<$ast.VmLoc> = $.loc(
    $.field(
        $.pure("VmLoc"),
        "$",
        $.right(
            $.str("code cell hash:"),
            $.field(
                $.lazy(() => hex),
                "hash",
                $.right(
                    $.str("offset:"),
                    $.field(
                        $.lazy(() => $number),
                        "offset",
                        $.eps,
                    ),
                ),
            ),
        ),
    ),
)
export const VmStack: $.Parser<$ast.VmStack> = $.loc(
    $.field(
        $.pure("VmStack"),
        "$",
        $.right(
            $.str("stack: "),
            $.field(
                $.stry($.plus($.regex<"\n">("^\\n", $.negateExps([$.ExpString("\n")])))),
                "stack",
                $.eps,
            ),
        ),
    ),
)
export const VmExecute: $.Parser<$ast.VmExecute> = $.loc(
    $.field(
        $.pure("VmExecute"),
        "$",
        $.right(
            $.str("execute "),
            $.field(
                $.stry($.plus($.regex<"\n">("^\\n", $.negateExps([$.ExpString("\n")])))),
                "instr",
                $.eps,
            ),
        ),
    ),
)
export const VmLimitChanged: $.Parser<$ast.VmLimitChanged> = $.loc(
    $.field(
        $.pure("VmLimitChanged"),
        "$",
        $.right(
            $.str("changing gas limit to "),
            $.field(
                $.lazy(() => $number),
                "limit",
                $.eps,
            ),
        ),
    ),
)
export const VmGasRemaining: $.Parser<$ast.VmGasRemaining> = $.loc(
    $.field(
        $.pure("VmGasRemaining"),
        "$",
        $.right(
            $.str("gas remaining: "),
            $.field(
                $.lazy(() => $number),
                "gas",
                $.eps,
            ),
        ),
    ),
)
export const VmException: $.Parser<$ast.VmException> = $.loc(
    $.field(
        $.pure("VmException"),
        "$",
        $.right(
            $.str("handling exception code "),
            $.field(
                $.lazy(() => $number),
                "errno",
                $.right(
                    $.str(": "),
                    $.field(
                        $.stry($.star($.regex<"\n">("^\\n", $.negateExps([$.ExpString("\n")])))),
                        "message",
                        $.eps,
                    ),
                ),
            ),
        ),
    ),
)
export const VmExceptionHandler: $.Parser<$ast.VmExceptionHandler> = $.loc(
    $.field(
        $.pure("VmExceptionHandler"),
        "$",
        $.right(
            $.str("default exception handler, terminating vm with exit code"),
            $.field(
                $.lazy(() => $number),
                "errno",
                $.eps,
            ),
        ),
    ),
)
export const VmFinalC5: $.Parser<$ast.VmFinalC5> = $.loc(
    $.field(
        $.pure("VmFinalC5"),
        "$",
        $.right(
            $.str("final c5:"),
            $.field(
                $.lazy(() => Cell),
                "value",
                $.eps,
            ),
        ),
    ),
)
export const VmUnknown: $.Parser<$ast.VmUnknown> = $.loc(
    $.field(
        $.pure("VmUnknown"),
        "$",
        $.right(
            $.lookNeg($.str("stack")),
            $.field(
                $.stry($.plus($.regex<"\n">("^\\n", $.negateExps([$.ExpString("\n")])))),
                "text",
                $.right($.str("\n"), $.eps),
            ),
        ),
    ),
)
export const vmLine: $.Parser<$ast.vmLine> = $.alt(
    VmLoc,
    $.alt(
        VmStack,
        $.alt(
            VmExecute,
            $.alt(
                VmLimitChanged,
                $.alt(
                    VmGasRemaining,
                    $.alt(VmException, $.alt(VmExceptionHandler, $.alt(VmFinalC5, VmUnknown))),
                ),
            ),
        ),
    ),
)
export const VmParsedStack: $.Parser<$ast.VmParsedStack> = $.loc(
    $.field(
        $.pure("VmParsedStack"),
        "$",
        $.right(
            $.str("["),
            $.field($.star($.lazy(() => VmStackValue)), "values", $.right($.str("]"), $.eps)),
        ),
    ),
)
export const VmStackValue: $.Parser<$ast.VmStackValue> = $.loc(
    $.field(
        $.pure("VmStackValue"),
        "$",
        $.field(
            $.alt(
                $.lazy(() => Null),
                $.alt(
                    $.lazy(() => NaN),
                    $.alt(
                        $.lazy(() => Integer),
                        $.alt(
                            $.lazy(() => Tuple),
                            $.alt(
                                $.lazy(() => TupleParen),
                                $.alt(
                                    $.lazy(() => Cell),
                                    $.alt(
                                        $.lazy(() => Continuation),
                                        $.alt(
                                            $.lazy(() => Builder),
                                            $.alt(
                                                $.lazy(() => CellSlice),
                                                $.lazy(() => Unknown),
                                            ),
                                        ),
                                    ),
                                ),
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
export const Null: $.Parser<$ast.Null> = $.loc(
    $.field($.pure("Null"), "$", $.right($.alt($.str("()"), $.str("(null)")), $.eps)),
)
export const NaN: $.Parser<$ast.NaN> = $.loc(
    $.field($.pure("NaN"), "$", $.right($.str("NaN"), $.eps)),
)
export const Integer: $.Parser<$ast.Integer> = $.loc(
    $.field(
        $.pure("Integer"),
        "$",
        $.field(
            $.lazy(() => $number),
            "value",
            $.eps,
        ),
    ),
)
export const Tuple: $.Parser<$ast.Tuple> = $.loc(
    $.field(
        $.pure("Tuple"),
        "$",
        $.right($.str("["), $.field($.star(VmStackValue), "elements", $.right($.str("]"), $.eps))),
    ),
)
export const TupleParen: $.Parser<$ast.TupleParen> = $.loc(
    $.field(
        $.pure("TupleParen"),
        "$",
        $.right($.str("("), $.field($.star(VmStackValue), "elements", $.right($.str(")"), $.eps))),
    ),
)
export const Cell: $.Parser<$ast.Cell> = $.loc(
    $.field(
        $.pure("Cell"),
        "$",
        $.right(
            $.str("C{"),
            $.field(
                $.lazy(() => hex),
                "value",
                $.right($.str("}"), $.eps),
            ),
        ),
    ),
)
export const Continuation: $.Parser<$ast.Continuation> = $.loc(
    $.field(
        $.pure("Continuation"),
        "$",
        $.right(
            $.str("Cont{"),
            $.field(
                $.stry(
                    $.lex(
                        $.star(
                            $.regex<string | string | "_" | string>("A-Za-z_0-9", [
                                $.ExpRange("A", "Z"),
                                $.ExpRange("a", "z"),
                                $.ExpString("_"),
                                $.ExpRange("0", "9"),
                            ]),
                        ),
                    ),
                ),
                "value",
                $.right($.str("}"), $.eps),
            ),
        ),
    ),
)
export const Builder: $.Parser<$ast.Builder> = $.loc(
    $.field(
        $.pure("Builder"),
        "$",
        $.right(
            $.str("BC{"),
            $.field(
                $.lazy(() => hex),
                "value",
                $.right($.str("}"), $.eps),
            ),
        ),
    ),
)
export const Unknown: $.Parser<$ast.Unknown> = $.loc(
    $.field($.pure("Unknown"), "$", $.right($.str("???"), $.eps)),
)
export const CellSlice: $.Parser<$ast.CellSlice> = $.loc(
    $.field(
        $.pure("CellSlice"),
        "$",
        $.right(
            $.str("CS{"),
            $.field(
                $.alt(
                    $.lazy(() => CellSliceBody),
                    $.lazy(() => CellSliceShortBody),
                ),
                "body",
                $.right($.str("}"), $.eps),
            ),
        ),
    ),
)
export const CellSliceBody: $.Parser<$ast.CellSliceBody> = $.loc(
    $.field(
        $.pure("CellSliceBody"),
        "$",
        $.right(
            $.str("Cell{"),
            $.field(
                $.lazy(() => hex),
                "value",
                $.right(
                    $.str("}"),
                    $.field(
                        $.lazy(() => CellSliceBits),
                        "bits",
                        $.right(
                            $.str(";"),
                            $.field(
                                $.lazy(() => CellSliceRefs),
                                "refs",
                                $.eps,
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
)
export const CellSliceBits: $.Parser<$ast.CellSliceBits> = $.loc(
    $.field(
        $.pure("CellSliceBits"),
        "$",
        $.right(
            $.str("bits:"),
            $.field(
                $.lazy(() => $number),
                "start",
                $.right(
                    $.str(".."),
                    $.field(
                        $.lazy(() => $number),
                        "end",
                        $.eps,
                    ),
                ),
            ),
        ),
    ),
)
export const CellSliceRefs: $.Parser<$ast.CellSliceRefs> = $.loc(
    $.field(
        $.pure("CellSliceRefs"),
        "$",
        $.right(
            $.str("refs:"),
            $.field(
                $.lazy(() => $number),
                "start",
                $.right(
                    $.str(".."),
                    $.field(
                        $.lazy(() => $number),
                        "end",
                        $.eps,
                    ),
                ),
            ),
        ),
    ),
)
export const CellSliceShortBody: $.Parser<$ast.CellSliceShortBody> = $.loc(
    $.field(
        $.pure("CellSliceShortBody"),
        "$",
        $.field(
            $.lazy(() => hex),
            "value",
            $.eps,
        ),
    ),
)
export const $number: $.Parser<$ast.$number> = $.field(
    $.opt($.str("-")),
    "op",
    $.field($.lex($.stry($.plus($.lazy(() => digit)))), "value", $.eps),
)
export const digit: $.Parser<$ast.digit> = $.regex<string>("0-9", [$.ExpRange("0", "9")])
export const hexDigit: $.Parser<$ast.hexDigit> = $.named(
    "hexadecimal digit",
    $.regex<string | string | string>("0-9a-fA-F", [
        $.ExpRange("0", "9"),
        $.ExpRange("a", "f"),
        $.ExpRange("A", "F"),
    ]),
)
export const hex: $.Parser<$ast.hex> = $.stry($.lex($.field($.star(hexDigit), "value", $.eps)))
export const space: $.Parser<$ast.space> = $.named(
    "space",
    $.regex<" " | "\t" | "\r" | "\n">(" \\t\\r\\n", [
        $.ExpString(" "),
        $.ExpString("\t"),
        $.ExpString("\r"),
        $.ExpString("\n"),
    ]),
)
