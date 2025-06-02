/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import { decodeTypeParams } from "@/next/types/type-params";
import { decodeDealiasTypeLazy } from "@/next/types/type";
import { recoverName } from "@/next/types/name";

export function* decodeFnType(
    Lazy: Ast.ThunkBuilder,
    { typeParams, params, returnType }: Ast.FnType,
    scopeRef: () => Ast.Scope,
): Ast.WithLog<Ast.DecodedFnType> {
    const decodedTypeParams = yield* decodeTypeParams(typeParams);
    const dealias = (type: Ast.Type) => {
        return decodeDealiasTypeLazy(Lazy, decodedTypeParams, type, scopeRef);
    };
    return Ast.DecodedFnType(
        decodedTypeParams,
        yield* decodeParams(dealias, params),
        dealias(returnType),
    );
}

export function* decodeParams(
    dealias: (type: Ast.Type) => Ast.Thunk<Ast.DecodedType>,
    params: readonly Ast.TypedParameter[],
): Ast.WithLog<Ast.Parameters> {
    const order: Ast.Parameter[] = [];
    const set: Set<string> = new Set();
    for (const param of params) {
        const name = yield* decodeParamName(param.name, set);
        order.push(Ast.Parameter(
            param.name,
            dealias(param.type),
            param.loc,
        ));
        if (typeof name !== 'undefined') {
            set.add(name);
        }
    }
    return Ast.Parameters(order, set);
}

function* decodeParamName(
    node: Ast.OptionalId,
    set: ReadonlySet<string>,
): Ast.WithLog<string | undefined> {
    if (node.kind === 'wildcard') {
        return undefined;
    }
    const name = node.text;
    if (!set.has(name)) {
        return name;
    }
    yield EDuplicateParam(name, node.loc);
    return recoverName(name, set);
}

const EDuplicateParam = (name: string, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(`Duplicate parameter "${name}"`),
    ],
});
