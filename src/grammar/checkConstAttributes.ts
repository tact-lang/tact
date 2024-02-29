import { ASTConstantAttribute, ASTRef, throwError } from "./ast";

export function checkConstAttributes(isAbstract: boolean, attributes: ASTConstantAttribute[], ref: ASTRef) {
    const k = new Set<string>();
    for (const a of attributes) {
        if (k.has(a.type)) {
            throwError(`Duplicate function attribute ${a.type}`, a.ref);
        }
        k.add(a.type);
    }
    if (isAbstract) {
        if (!k.has('abstract')) {
            throwError(`Abstract function doesn't have abstract modifier`, ref);
        }
    } else {
        if (k.has('abstract')) {
            throwError(`Non abstract function have abstract modifier`, ref);
        }
    }
}