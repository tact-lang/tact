import * as $ from "@tonstudio/parser-runtime";
import * as G from "@/asm/text/grammar";
import { Instr } from "@/asm/runtime";
import { createLoc, Ctx, ParseError, processInstructions } from "@/asm/text/util";

export type ParseResult = ParseSuccess | ParseFailure;

export type ParseSuccess = {
    readonly $: "ParseSuccess";
    readonly instructions: Instr[];
};

export type ParseFailure = {
    readonly $: "ParseFailure";
    readonly error: ParseError;
};

const success = (instructions: Instr[]): ParseSuccess => ({
    $: "ParseSuccess",
    instructions,
});
const failure = (error: ParseError): ParseFailure => ({
    $: "ParseFailure",
    error,
});

export function parse(filepath: string, code: string): ParseResult {
    const lines = code.split("\n");
    const ctx: Ctx = { lines, filepath };

    const res = $.parse({
        grammar: G.File,
        space: G.space,
        text: code,
    });

    if (res.$ !== "success") {
        const { expected, position } = res.error;

        const loc = createLoc(ctx, { $: "empty", at: position });
        return failure(
            new ParseError(loc, `Expected ${getExpectedText(expected)}`),
        );
    }

    try {
        return success(processInstructions(ctx, res.value.instructions));
    } catch (error) {
        if (error instanceof ParseError) {
            return failure(error);
        }

        throw error;
    }
}

const getExpectedText = (expected: ReadonlySet<string>) => {
    const result: string[] = [];
    const failures = [...expected].sort();
    for (const [idx, failure] of failures.entries()) {
        if (idx > 0) {
            if (idx === failures.length - 1) {
                result.push(failures.length > 2 ? ", or " : " or ");
            } else {
                result.push(", ");
            }
        }
        result.push(failure);
    }
    return result.join("");
};
