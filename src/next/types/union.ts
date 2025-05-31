/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { evalExpr } from "@/next/types/expr-eval";
import { decodeExpr } from "@/next/types/expression";
import { assignType, decodeTypeLazy } from "@/next/types/type";
import { decodeTypeParams } from "@/next/types/type-params";

type Cons = {
    readonly fields: ReadonlyMap<string, Ast.InhFieldSig>;
    readonly loc: Ast.Loc;
}

export function* decodeUnion(
    union: Ast.UnionDecl,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.UnionSig> {
    const typeParams = yield* decodeTypeParams(union.typeParams);
    
    const cases: Map<string, Cons> = new Map();
    for (const cons of union.cases) {
        const caseName = cons.name.text;
        const prevCons = cases.get(caseName);
        if (prevCons) {
            yield EDuplicateCons(caseName, prevCons.loc, cons.name.loc)
            continue;
        }
        const fields: Map<string, [Ast.InhFieldSig, Ast.Loc]> = new Map();
        for (const field of cons.fields) {
            const fieldName = field.name.text;
            const prevField = fields.get(fieldName);
            if (prevField) {
                const [, prevFieldLoc] = prevField;
                yield EDuplicateField(fieldName, prevFieldLoc, field.name.loc)
            }
            const ascribedType = decodeTypeLazy(typeParams, field.type, scopeRef);
            const initializer = field.initializer;
            const lazyExpr = initializer ? Ast.Lazy(function* () {
                const expr = yield* decodeExpr(
                    typeParams,
                    initializer,
                    scopeRef,
                    undefined,
                    new Map(),
                );
                const computed = expr.computedType;
                const ascribed = yield* ascribedType();
                yield* assignType(expr.loc, ascribed, computed);
                return yield* evalExpr(expr, scopeRef);
            }) : undefined;
            const decoded = Ast.InhFieldSig(ascribedType, lazyExpr);
            fields.set(fieldName, [decoded, field.name.loc])
        }
        cases.set(caseName, {
            fields: new Map([...fields].map(([name, [type]]) => [name, type])),
            loc: cons.name.loc,
        })
    }

    const map = new Map([...cases].map(([name, { fields }]) => [name, fields]));
    return Ast.UnionSig(typeParams, map);
}

const EDuplicateCons = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`Duplicate union case "${name}"`),
        E.TEText(`Defined at:`),
        E.TECode(next),
        E.TEText(`Previously defined at:`),
        E.TECode(prev),
    ],
});

const EDuplicateField = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`Duplicate field "${name}"`),
        E.TEText(`Defined at:`),
        E.TECode(next),
        E.TEText(`Previously defined at:`),
        E.TECode(prev),
    ],
});