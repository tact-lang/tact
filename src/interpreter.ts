import { evalConstantExpression } from "./constEval";
import { CompilerContext } from "./context";
import { TactConstEvalError, TactParseError } from "./errors";
import { parseExpression } from "./grammar/grammar";
import { Value } from "./types/types";

type EvalResult =
    | { kind: "ok"; value: Value }
    | { kind: "error"; message: string };

export function parseAndEvalExpression(sourceCode: string): EvalResult {
    try {
        const ast = parseExpression(sourceCode);
        const constEvalResult = evalConstantExpression(
            ast,
            new CompilerContext(),
        );
        return { kind: "ok", value: constEvalResult };
    } catch (error) {
        if (
            error instanceof TactParseError ||
            error instanceof TactConstEvalError
        )
            return { kind: "error", message: error.message };
        throw error;
    }
}
