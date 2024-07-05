import { AstFunctionAttribute, SrcInfo } from "./ast";
import { throwCompilationError } from "../errors";

export function checkFunctionAttributes(
    isAbstract: boolean,
    attrs: AstFunctionAttribute[],
    loc: SrcInfo,
) {
    const k: Set<string> = new Set();
    for (const a of attrs) {
        if (k.has(a.type)) {
            throwCompilationError(
                `Duplicate function attribute "${a.type}"`,
                a.loc,
            );
        }
        k.add(a.type);
    }
    if (isAbstract) {
        if (!k.has("abstract")) {
            throwCompilationError(
                `Abstract function doesn't have abstract modifier`,
                loc,
            );
        }
    } else {
        if (k.has("abstract")) {
            throwCompilationError(
                `Non abstract function have abstract modifier`,
                loc,
            );
        }
    }
}
