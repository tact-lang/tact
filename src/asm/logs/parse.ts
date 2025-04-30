import * as $ from "@tonstudio/parser-runtime";
import * as G from "@/asm/logs/grammar";
import type { Stack, StackElement } from "@/asm/logs/stack";
import VmParsedStack = G.$ast.VmParsedStack;

export type VmLine =
    | VmLoc
    | VmStack
    | VmExecute
    | VmLimitChanged
    | VmGasRemaining
    | VmException
    | VmExceptionHandler
    | VmFinalC5
    | VmUnknown;

export type VmLoc = {
    readonly $: "VmLoc";
    readonly hash: string;
    readonly offset: number;
};

export type VmStack = {
    readonly $: "VmStack";
    readonly stack: Stack;
};

export type VmExecute = {
    readonly $: "VmExecute";
    readonly instr: string;
};

export type VmLimitChanged = {
    readonly $: "VmLimitChanged";
    readonly limit: number;
};

export type VmGasRemaining = {
    readonly $: "VmGasRemaining";
    readonly gas: number;
};

export type VmException = {
    readonly $: "VmException";
    readonly errno: number;
    readonly message: string;
};

export type VmExceptionHandler = {
    readonly $: "VmExceptionHandler";
    readonly errno: number;
};

export type VmFinalC5 = {
    readonly $: "VmFinalC5";
    readonly hex: string;
};

export type VmUnknown = {
    readonly $: "VmUnknown";
    readonly text: string;
};

export const parse = (log: string): VmLine[] => {
    const lines = log.split("\n");
    const vmLines = lines.map((line) => parseLine(line));

    return vmLines.map((it) => processVmLine(it));
};

const parseLine = (line: string): G.$ast.vmLine => {
    const res = $.parse({
        grammar: G.vmLine,
        space: G.space,
        text: line,
    });
    if (res.$ === "success") {
        return res.value;
    }
    return {
        $: "VmUnknown",
        text: line,
        loc: $.emptyLoc(0),
    };
};

const processVmLine = (line: G.$ast.vmLine): VmLine => {
    switch (line.$) {
        case "VmLoc":
            return {
                $: "VmLoc",
                hash: line.hash.trim(),
                offset: parseNumber(line.offset),
            };
        case "VmStack": {
            const stack = parseStack(line.stack);
            if (!stack) {
                throw new Error(`Cannot parse stack: ${line.stack}`);
            }

            return {
                $: "VmStack",
                stack: processStack(stack),
            };
        }
        case "VmExecute":
            return {
                $: "VmExecute",
                instr: line.instr.trim(),
            };
        case "VmLimitChanged":
            return {
                $: "VmLimitChanged",
                limit: parseNumber(line.limit),
            };
        case "VmGasRemaining":
            return {
                $: "VmGasRemaining",
                gas: parseNumber(line.gas),
            };
        case "VmException":
            return {
                $: "VmException",
                errno: parseNumber(line.errno),
                message: line.message.trim(),
            };
        case "VmExceptionHandler":
            return {
                $: "VmExceptionHandler",
                errno: parseNumber(line.errno),
            };
        case "VmFinalC5":
            return {
                $: "VmFinalC5",
                hex: line.value.value.trim(),
            };
        case "VmUnknown":
            return {
                $: "VmUnknown",
                text: line.text.trim(),
            };
        default:
            return {
                $: "VmUnknown",
                text: "",
            };
    }
};

const parseStack = (line: string) => {
    const res = tryParseStack(line);
    if (res) return res;

    const res2 = tryParseStack(line + "]");
    if (res2) return res2;

    const res3 = tryParseStack(line + "} ]");
    if (res3) return res3;

    // try to recover many missing `]`
    for (let i = 0; i < 100; i++) {
        const resN = tryParseStack(line + "} ]" + "]".repeat(i));
        if (resN) {
            return resN;
        }
    }

    return undefined;
};

const tryParseStack = (line: string) => {
    const res = $.parse({
        grammar: G.VmParsedStack,
        space: G.space,
        text: line,
    });
    if (res.$ === "success") {
        return res.value;
    }
    return undefined;
};

const processStack = (stack: VmParsedStack): StackElement[] => {
    return stack.values.map((it) => processStackElement(it));
};

const parseNumber = (it: G.$ast.$number) => {
    const val = Number.parseInt(it.value);
    if (it.op === "-") {
        return -val;
    }
    return val;
};

const parseBigNum = (it: G.$ast.$number) => {
    const val = BigInt(it.value);
    if (it.op === "-") {
        return -val;
    }
    return val;
};

const processStackElement = (it: G.$ast.VmStackValue): StackElement => {
    switch (it.value.$) {
        case "Null":
            return { $: "Null" };
        case "NaN":
            return { $: "NaN" };
        case "Integer":
            return { $: "Integer", value: parseBigNum(it.value.value) };
        case "Tuple":
        case "TupleParen":
            return {
                $: "Tuple",
                elements: it.value.elements.map((it) =>
                    processStackElement(it),
                ),
            };
        case "Cell":
            return {
                $: "Cell",
                boc: it.value.value,
            };
        case "Continuation":
            return {
                $: "Continuation",
                name: it.value.value,
            };
        case "Builder":
            return {
                $: "Builder",
                hex: it.value.value,
            };
        case "CellSlice":
            if (it.value.body.$ === "CellSliceBody") {
                return {
                    $: "Slice",
                    hex: it.value.body.value,
                    startBit: parseNumber(it.value.body.bits.start),
                    endBit: parseNumber(it.value.body.bits.end),
                    startRef: parseNumber(it.value.body.refs.start),
                    endRef: parseNumber(it.value.body.refs.end),
                };
            }

            return {
                $: "Slice",
                hex: it.value.body.value,
                startBit: 0,
                endBit: 0,
                startRef: 0,
                endRef: 0,
            };
        case "Unknown":
            return {
                $: "Unknown",
                value: "",
            };
        default:
            return { $: "Unknown", value: "" };
    }
};
