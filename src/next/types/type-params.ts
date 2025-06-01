import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { recoverName } from "@/next/types/name";

export const emptyTypeParams = Ast.TypeParams([], new Set());

export function* decodeTypeParams(ids: readonly Ast.TypeId[]): E.WithLog<Ast.TypeParams> {
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

    return Ast.TypeParams(ids, set);
}

const EDuplicateTypeParam = (name: string, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Duplicate type parameter "${name}"`),
    ],
});


