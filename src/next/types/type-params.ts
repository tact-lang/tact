import * as Ast from "@/next/ast";
import { recoverName } from "@/next/types/name";

export const emptyTypeParams = Ast.CTypeParams([], new Set());

export function* decodeTypeParams(
    ids: readonly Ast.TypeId[],
): Ast.Log<Ast.CTypeParams> {
    const set: Set<string> = new Set();
    const order: Ast.TypeId[] = [];

    for (const id of ids) {
        if (set.has(id.text)) {
            yield EDuplicateTypeParam(id.text, id.loc);
            const newName = recoverName(id.text, set);
            order.push(Ast.TypeId(newName, id.loc));
        } else {
            set.add(id.text);
            order.push(id);
        }
    }

    return Ast.CTypeParams(ids, set);
}

const EDuplicateTypeParam = (name: string, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Duplicate type parameter "${name}"`)],
});
