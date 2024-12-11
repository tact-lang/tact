// Throws a non-fatal const-eval error, in the sense that const-eval as a compiler
// optimization cannot be applied, e.g. to `let`-statements.

import { throwConstEvalError } from "../errors";
import { SrcInfo } from "../grammar/ast";

// Note that for const initializers this is a show-stopper.
export function throwNonFatalErrorConstEval(
    msg: string,
    source: SrcInfo,
): never {
    throwConstEvalError(`Cannot evaluate expression: ${msg}`, false, source);
}

// Throws a fatal const-eval, meaning this is a meaningless program,
// so compilation should be aborted in all cases
export function throwErrorConstEval(msg: string, source: SrcInfo): never {
    throwConstEvalError(`Cannot evaluate expression: ${msg}`, true, source);
}

// bigint arithmetic

// precondition: the divisor is not zero
// rounds the division result towards negative infinity
export function divFloor(a: bigint, b: bigint): bigint {
    const almostSameSign = a > 0n === b > 0n;
    if (almostSameSign) {
        return a / b;
    }
    return a / b + (a % b === 0n ? 0n : -1n);
}

export function abs(a: bigint): bigint {
    return a < 0n ? -a : a;
}

export function sign(a: bigint): bigint {
    if (a === 0n) return 0n;
    else return a < 0n ? -1n : 1n;
}

// precondition: the divisor is not zero
// rounds the result towards negative infinity
// Uses the fact that a / b * b + a % b == a, for all b != 0.
export function modFloor(a: bigint, b: bigint): bigint {
    return a - divFloor(a, b) * b;
}
