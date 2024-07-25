import { Interval } from "ohm-js";
import FuncGrammar from "./grammar.ohm-bundle";

type Match = { ok: false; message: string; interval: Interval } | { ok: true };

/**
 * Checks that given `src` string of FunC code matches with the FunC grammar
 */
export function match(src: string): Match {
    const matchResult = FuncGrammar.match(src);

    if (matchResult.failed()) {
        return {
            ok: false,
            message: `Parse error: expected ${(matchResult as any).getExpectedText()}\n`,
            interval: matchResult.getInterval(),
        };
    }

    return { ok: true };
}

// TODO: semantics and parsing, with errors
