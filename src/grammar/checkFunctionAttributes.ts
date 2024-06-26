import { ASTFunctionAttribute, ASTRef } from "./ast";
import { throwCompilationError } from "../errors";

export function checkFunctionAttributes(
    isAbstract: boolean,
    attrs: ASTFunctionAttribute[],
    ref: ASTRef,
) {
    const k = new Set<string>();
    for (const a of attrs) {
        if (k.has(a.type)) {
            throwCompilationError(
                `Duplicate function attribute "${a.type}"`,
                a.ref,
            );
        }
        k.add(a.type);
    }
    if (isAbstract) {
        if (!k.has("abstract")) {
            throwCompilationError(
                `Abstract function doesn't have abstract modifier`,
                ref,
            );
        }
    } else {
        if (k.has("abstract")) {
            throwCompilationError(
                `Non abstract function have abstract modifier`,
                ref,
            );
        }
    }
}
