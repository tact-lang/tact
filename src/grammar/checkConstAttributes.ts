import { ASTConstantAttribute, ASTRef } from "./ast";
import { throwCompilationError } from "../errors";

export function checkConstAttributes(
    isAbstract: boolean,
    attributes: ASTConstantAttribute[],
    ref: ASTRef,
) {
    const k = new Set<string>();
    for (const a of attributes) {
        if (k.has(a.type)) {
            throwCompilationError(
                `Duplicate constant attribute "${a.type}"`,
                a.ref,
            );
        }
        k.add(a.type);
    }
    if (isAbstract) {
        if (!k.has("abstract")) {
            throwCompilationError(
                `Abstract constant doesn't have abstract modifier`,
                ref,
            );
        }
    } else {
        if (k.has("abstract")) {
            throwCompilationError(
                `Non abstract constant have abstract modifier`,
                ref,
            );
        }
    }
}
