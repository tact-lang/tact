/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import { decodeInitializerLazy } from "@/next/types/struct-fields";
import { decodeTypeLazy } from "@/next/types/type";
import { decodeTypeParams } from "@/next/types/type-params";

type Cons = {
    readonly fields: ReadonlyMap<string, Ast.CField>;
    readonly loc: Ast.Loc;
};

export function* decodeUnion(
    Lazy: Ast.ThunkBuilder,
    union: Ast.UnionDecl,
    scopeRef: () => Ast.CSource,
): Ast.Log<Ast.CUnion> {
    const typeParams = yield* decodeTypeParams(union.typeParams);

    const cases: Map<string, Cons> = new Map();
    for (const cons of union.cases) {
        const caseName = cons.name.text;
        const prevCons = cases.get(caseName);
        if (prevCons) {
            yield EDuplicateCons(caseName, prevCons.loc, cons.name.loc);
            continue;
        }
        const fields: Map<string, [Ast.CField, Ast.Loc]> = new Map();
        for (const field of cons.fields) {
            const fieldName = field.name.text;
            const prevField = fields.get(fieldName);
            if (prevField) {
                const [, prevFieldLoc] = prevField;
                yield EDuplicateField(fieldName, prevFieldLoc, field.name.loc);
            }
            const ascribedType = decodeTypeLazy(
                Lazy,
                typeParams,
                field.type,
                scopeRef,
            );

            const lazyExpr = decodeInitializerLazy(
                Lazy,
                field.loc,
                typeParams,
                ascribedType,
                field.initializer,
                undefined,
                scopeRef,
            );

            const decoded = Ast.CField(ascribedType, lazyExpr);
            fields.set(fieldName, [decoded, field.name.loc]);
        }
        cases.set(caseName, {
            fields: new Map([...fields].map(([name, [type]]) => [name, type])),
            loc: cons.name.loc,
        });
    }

    const map = new Map([...cases].map(([name, { fields }]) => [name, fields]));
    return Ast.CUnion(typeParams, map);
}

const EDuplicateCons = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): Ast.TcError => ({
    loc: next,
    descr: [
        Ast.TEText(`Duplicate union case "${name}"`),
        Ast.TEText(`Defined at:`),
        Ast.TECode(next),
        Ast.TEText(`Previously defined at:`),
        Ast.TECode(prev),
    ],
});

const EDuplicateField = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): Ast.TcError => ({
    loc: next,
    descr: [
        Ast.TEText(`Duplicate field "${name}"`),
        Ast.TEText(`Defined at:`),
        Ast.TECode(next),
        Ast.TEText(`Previously defined at:`),
        Ast.TECode(prev),
    ],
});
