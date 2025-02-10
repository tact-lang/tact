/* Generated. Do not edit. */
/* eslint-disable @typescript-eslint/no-namespace */
/* eslint-disable @typescript-eslint/no-redundant-type-constituents */
/* eslint-disable @typescript-eslint/no-duplicate-type-constituents */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as $ from "@tonstudio/parser-runtime";
export namespace $ast {
    export type NamedRun = $.Located<{
        readonly $: "NamedRun";
        readonly name: enter;
        readonly log: log;
    }>;
    export type UnnamedRun = $.Located<{
        readonly $: "UnnamedRun";
        readonly bc: BlockchainMessage;
        readonly vm: VmMessage | undefined;
    }>;
    export type run = NamedRun | UnnamedRun;
    export type log = readonly run[];
    export type BlockchainMessage = $.Located<{
        readonly $: "BlockchainMessage";
        readonly entries: readonly (BcEntry | BcUnknown)[];
    }>;
    export type BcEntry = $.Located<{
        readonly $: "BcEntry";
        readonly date: string;
        readonly source: string;
        readonly line: string;
        readonly info: bcLine;
    }>;
    export type BcLimits = $.Located<{
        readonly $: "BcLimits";
        readonly max: $number;
        readonly limit: $number;
        readonly credit: $number;
    }>;
    export type BcSteps = $.Located<{
        readonly $: "BcSteps";
        readonly steps: $number;
        readonly used: $number;
        readonly max: $number;
        readonly limit: $number;
        readonly credit: $number;
    }>;
    export type BcVmLog = $.Located<{
        readonly $: "BcVmLog";
        readonly entries: readonly VmEntry[];
    }>;
    export type bcLine = BcLimits | BcSteps | BcVmLog;
    export type BcUnknown = $.Located<{
        readonly $: "BcUnknown";
        readonly text: string;
    }>;
    export type VmMessage = $.Located<{
        readonly $: "VmMessage";
        readonly entries: readonly VmEntry[];
    }>;
    export type VmEntry = $.Located<{
        readonly $: "VmEntry";
        readonly stack: Stack;
        readonly other: readonly vmLine[];
    }>;
    export type VmLoc = $.Located<{
        readonly $: "VmLoc";
        readonly hash: string;
        readonly offset: string;
    }>;
    export type VmExecute = $.Located<{
        readonly $: "VmExecute";
        readonly instr: string;
    }>;
    export type VmLimitChanged = $.Located<{
        readonly $: "VmLimitChanged";
        readonly limit: string;
    }>;
    export type VmGasRemaining = $.Located<{
        readonly $: "VmGasRemaining";
        readonly gas: string;
    }>;
    export type VmUnknown = $.Located<{
        readonly $: "VmUnknown";
        readonly text: string;
    }>;
    export type vmLine =
        | VmLoc
        | VmExecute
        | VmLimitChanged
        | VmGasRemaining
        | VmUnknown;
    export type Stack = $.Located<{
        readonly $: "Stack";
        readonly stack: string;
    }>;
    export type enter = string;
    export type exit = string;
    export type $number = string;
}
export const NamedRun: $.Parser<$ast.NamedRun> = $.loc(
    $.field(
        $.pure("NamedRun"),
        "$",
        $.field(
            $.lazy(() => enter),
            "name",
            $.field(
                $.lazy(() => log),
                "log",
                $.right(
                    $.lazy(() => exit),
                    $.eps,
                ),
            ),
        ),
    ),
);
export const UnnamedRun: $.Parser<$ast.UnnamedRun> = $.loc(
    $.field(
        $.pure("UnnamedRun"),
        "$",
        $.field(
            $.lazy(() => BlockchainMessage),
            "bc",
            $.field($.opt($.lazy(() => VmMessage)), "vm", $.eps),
        ),
    ),
);
export const run: $.Parser<$ast.run> = $.alt(NamedRun, UnnamedRun);
export const log: $.Parser<$ast.log> = $.star(run);
export const BlockchainMessage: $.Parser<$ast.BlockchainMessage> = $.loc(
    $.field(
        $.pure("BlockchainMessage"),
        "$",
        $.right(
            $.str("%LOGENTRY%"),
            $.right(
                $.lookPos($.str("[")),
                $.field(
                    $.plus(
                        $.alt(
                            $.lazy(() => BcEntry),
                            $.lazy(() => BcUnknown),
                        ),
                    ),
                    "entries",
                    $.eps,
                ),
            ),
        ),
    ),
);
export const BcEntry: $.Parser<$ast.BcEntry> = $.loc(
    $.field(
        $.pure("BcEntry"),
        "$",
        $.right(
            $.str("[ "),
            $.right(
                $.regex<"1" | "2" | "3" | "4">("1234", [
                    $.ExpString("1"),
                    $.ExpString("2"),
                    $.ExpString("3"),
                    $.ExpString("4"),
                ]),
                $.right(
                    $.str("]"),
                    $.right(
                        $.str("[t 0]"),
                        $.right(
                            $.str("["),
                            $.field(
                                $.stry(
                                    $.plus(
                                        $.regex<string>(
                                            "^\\]",
                                            $.negateExps([
                                                $.ExpString('"\\]"'),
                                            ]),
                                        ),
                                    ),
                                ),
                                "date",
                                $.right(
                                    $.str("]"),
                                    $.right(
                                        $.str("["),
                                        $.field(
                                            $.stry(
                                                $.plus(
                                                    $.regex<":">(
                                                        "^:",
                                                        $.negateExps([
                                                            $.ExpString(":"),
                                                        ]),
                                                    ),
                                                ),
                                            ),
                                            "source",
                                            $.right(
                                                $.str(":"),
                                                $.field(
                                                    $.stry(
                                                        $.plus(
                                                            $.regex<string>(
                                                                "0-9",
                                                                [
                                                                    $.ExpRange(
                                                                        "0",
                                                                        "9",
                                                                    ),
                                                                ],
                                                            ),
                                                        ),
                                                    ),
                                                    "line",
                                                    $.right(
                                                        $.str("]"),
                                                        $.right(
                                                            $.str("\t"),
                                                            $.field(
                                                                $.lazy(
                                                                    () =>
                                                                        bcLine,
                                                                ),
                                                                "info",
                                                                $.right(
                                                                    $.str("\n"),
                                                                    $.eps,
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ),
                                ),
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
);
export const BcLimits: $.Parser<$ast.BcLimits> = $.loc(
    $.field(
        $.pure("BcLimits"),
        "$",
        $.right(
            $.str("gas limits: max="),
            $.field(
                $.lazy(() => $number),
                "max",
                $.right(
                    $.str(", limit="),
                    $.field(
                        $.lazy(() => $number),
                        "limit",
                        $.right(
                            $.str(", credit="),
                            $.field(
                                $.lazy(() => $number),
                                "credit",
                                $.eps,
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
);
export const BcSteps: $.Parser<$ast.BcSteps> = $.loc(
    $.field(
        $.pure("BcSteps"),
        "$",
        $.right(
            $.str("steps: "),
            $.field(
                $.lazy(() => $number),
                "steps",
                $.right(
                    $.str(" gas: used="),
                    $.field(
                        $.lazy(() => $number),
                        "used",
                        $.right(
                            $.str(", max="),
                            $.field(
                                $.lazy(() => $number),
                                "max",
                                $.right(
                                    $.str(", limit="),
                                    $.field(
                                        $.lazy(() => $number),
                                        "limit",
                                        $.right(
                                            $.str(", credit="),
                                            $.field(
                                                $.lazy(() => $number),
                                                "credit",
                                                $.eps,
                                            ),
                                        ),
                                    ),
                                ),
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
);
export const BcVmLog: $.Parser<$ast.BcVmLog> = $.loc(
    $.field(
        $.pure("BcVmLog"),
        "$",
        $.right(
            $.str("VM log\n"),
            $.field($.plus($.lazy(() => VmEntry)), "entries", $.eps),
        ),
    ),
);
export const bcLine: $.Parser<$ast.bcLine> = $.alt(
    BcLimits,
    $.alt(BcSteps, BcVmLog),
);
export const BcUnknown: $.Parser<$ast.BcUnknown> = $.loc(
    $.field(
        $.pure("BcUnknown"),
        "$",
        $.right(
            $.lookNeg($.str("%LOGENTRY%")),
            $.right(
                $.lookNeg($.str("%ENTER%")),
                $.right(
                    $.lookNeg($.str("%EXIT%")),
                    $.field(
                        $.stry(
                            $.plus(
                                $.regex<"\n">(
                                    "^\\n",
                                    $.negateExps([$.ExpString("\n")]),
                                ),
                            ),
                        ),
                        "text",
                        $.right($.str("\n"), $.eps),
                    ),
                ),
            ),
        ),
    ),
);
export const VmMessage: $.Parser<$ast.VmMessage> = $.loc(
    $.field(
        $.pure("VmMessage"),
        "$",
        $.right(
            $.str("%LOGENTRY%"),
            $.field($.plus($.lazy(() => VmEntry)), "entries", $.eps),
        ),
    ),
);
export const VmEntry: $.Parser<$ast.VmEntry> = $.loc(
    $.field(
        $.pure("VmEntry"),
        "$",
        $.field(
            $.lazy(() => Stack),
            "stack",
            $.field($.plus($.lazy(() => vmLine)), "other", $.eps),
        ),
    ),
);
export const VmLoc: $.Parser<$ast.VmLoc> = $.loc(
    $.field(
        $.pure("VmLoc"),
        "$",
        $.right(
            $.str("code cell hash: "),
            $.field(
                $.stry(
                    $.plus(
                        $.regex<string | string>("0-9A-F", [
                            $.ExpRange("0", "9"),
                            $.ExpRange("A", "F"),
                        ]),
                    ),
                ),
                "hash",
                $.right(
                    $.str(" offset: "),
                    $.field(
                        $.stry(
                            $.plus(
                                $.regex<string>("0-9", [$.ExpRange("0", "9")]),
                            ),
                        ),
                        "offset",
                        $.right($.str("\n"), $.eps),
                    ),
                ),
            ),
        ),
    ),
);
export const VmExecute: $.Parser<$ast.VmExecute> = $.loc(
    $.field(
        $.pure("VmExecute"),
        "$",
        $.right(
            $.str("execute "),
            $.field(
                $.stry(
                    $.plus(
                        $.regex<"\n">(
                            "^\\n",
                            $.negateExps([$.ExpString("\n")]),
                        ),
                    ),
                ),
                "instr",
                $.right($.str("\n"), $.eps),
            ),
        ),
    ),
);
export const VmLimitChanged: $.Parser<$ast.VmLimitChanged> = $.loc(
    $.field(
        $.pure("VmLimitChanged"),
        "$",
        $.right(
            $.str("changing gas limit to "),
            $.field(
                $.stry($.plus($.regex<string>("0-9", [$.ExpRange("0", "9")]))),
                "limit",
                $.right($.str("\n"), $.eps),
            ),
        ),
    ),
);
export const VmGasRemaining: $.Parser<$ast.VmGasRemaining> = $.loc(
    $.field(
        $.pure("VmGasRemaining"),
        "$",
        $.right(
            $.str("gas remaining: "),
            $.field(
                $.stry($.plus($.regex<string>("0-9", [$.ExpRange("0", "9")]))),
                "gas",
                $.right($.str("\n"), $.eps),
            ),
        ),
    ),
);
export const VmUnknown: $.Parser<$ast.VmUnknown> = $.loc(
    $.field(
        $.pure("VmUnknown"),
        "$",
        $.right(
            $.lookNeg($.str("%LOGENTRY%")),
            $.right(
                $.lookNeg($.str("%ENTER%")),
                $.right(
                    $.lookNeg($.str("%EXIT%")),
                    $.right(
                        $.lookNeg($.str("stack")),
                        $.field(
                            $.stry(
                                $.plus(
                                    $.regex<"\n">(
                                        "^\\n",
                                        $.negateExps([$.ExpString("\n")]),
                                    ),
                                ),
                            ),
                            "text",
                            $.right($.str("\n"), $.eps),
                        ),
                    ),
                ),
            ),
        ),
    ),
);
export const vmLine: $.Parser<$ast.vmLine> = $.alt(
    VmLoc,
    $.alt(VmExecute, $.alt(VmLimitChanged, $.alt(VmGasRemaining, VmUnknown))),
);
export const Stack: $.Parser<$ast.Stack> = $.loc(
    $.field(
        $.pure("Stack"),
        "$",
        $.right(
            $.str("stack"),
            $.field(
                $.stry(
                    $.plus(
                        $.regex<"\n">(
                            "^\\n",
                            $.negateExps([$.ExpString("\n")]),
                        ),
                    ),
                ),
                "stack",
                $.right($.str("\n"), $.eps),
            ),
        ),
    ),
);
export const enter: $.Parser<$ast.enter> = $.right(
    $.str("%LOGENTRY%%ENTER%"),
    $.left(
        $.stry(
            $.star($.regex<"\n">("^\\n", $.negateExps([$.ExpString("\n")]))),
        ),
        $.str("\n"),
    ),
);
export const exit: $.Parser<$ast.exit> = $.right(
    $.str("%LOGENTRY%%EXIT%"),
    $.left(
        $.stry(
            $.star($.regex<"\n">("^\\n", $.negateExps([$.ExpString("\n")]))),
        ),
        $.str("\n"),
    ),
);
export const $number: $.Parser<$ast.$number> = $.stry(
    $.plus($.regex<string>("0-9", [$.ExpRange("0", "9")])),
);
