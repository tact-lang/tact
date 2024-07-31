import { AstConstantAttribute, SrcInfo } from "./ast";
import { throwSyntaxError } from "../errors";

export function checkConstAttributes(
    isAbstract: boolean,
    attributes: AstConstantAttribute[],
    loc: SrcInfo,
) {
    const k: Set<string> = new Set();
    for (const a of attributes) {
        if (k.has(a.type)) {
            throwSyntaxError(`Duplicate constant attribute "${a.type}"`, a.loc);
        }
        k.add(a.type);
    }
    if (isAbstract) {
        if (!k.has("abstract")) {
            throwSyntaxError(
                `Abstract constant doesn't have abstract modifier`,
                loc,
            );
        }
    } else {
        if (k.has("abstract")) {
            throwSyntaxError(
                `Non-abstract constant has abstract modifier`,
                loc,
            );
        }
    }
}
