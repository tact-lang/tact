import { ASTConstantAttribute, SrcInfo } from "./ast";
import { throwCompilationError } from "../errors";

export function checkConstAttributes(
    isAbstract: boolean,
    attributes: ASTConstantAttribute[],
    loc: SrcInfo,
) {
    const k = new Set<string>();
    for (const a of attributes) {
        if (k.has(a.type)) {
            throwCompilationError(
                `Duplicate constant attribute "${a.type}"`,
                a.loc,
            );
        }
        k.add(a.type);
    }
    if (isAbstract) {
        if (!k.has("abstract")) {
            throwCompilationError(
                `Abstract constant doesn't have abstract modifier`,
                loc,
            );
        }
    } else {
        if (k.has("abstract")) {
            throwCompilationError(
                `Non-abstract constant has abstract modifier`,
                loc,
            );
        }
    }
}
