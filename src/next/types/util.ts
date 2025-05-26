import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { dealiasType } from "@/next/types/aliases";
import { decodeTypeParams } from "@/next/types/type-params";
import { throwInternal } from "@/error/errors";

export const recoverName = (name: string, set: ReadonlySet<string>) => {
    for (let i = 0; i < 100; ++i) {
        const nextName = `${name}${i}`;
        if (!set.has(nextName)) {
            return nextName;
        }
    }
    return throwInternal("Iteration limit reached");
};

export function* decodeFnType(
    { typeParams, params, returnType }: Ast.FnType,
    via: Ast.ViaUser,
    sigs: ReadonlyMap<string, Ast.DeclSig>,
    aliases: ReadonlyMap<string, Ast.AliasSig | Ast.BadSig>,
): E.WithLog<Ast.DecodedFnType> {
    const decodedTypeParams = yield* decodeTypeParams(typeParams);
    const dealias = (type: Ast.Type) => {
        return dealiasType(sigs, aliases, decodedTypeParams, type);
    };
    return Ast.DecodedFnType(
        decodedTypeParams,
        yield* decodeParams(dealias, params),
        yield* dealias(returnType ?? Ast.TypeVoid(via.defLoc)),
    );
}

function* decodeParams(
    dealias: (type: Ast.Type) => E.WithLog<Ast.DecodedType>,
    params: readonly Ast.TypedParameter[],
): E.WithLog<Ast.Parameters> {
    const order: Ast.Parameter[] = [];
    const set: Set<string> = new Set();
    for (const param of params) {
        const name = yield* decodeParamName(param.name, set);
        order.push(Ast.Parameter(
            param.name,
            yield* dealias(param.type),
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
): E.WithLog<string | undefined> {
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

const EDuplicateParam = (name: string, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Duplicate parameter "${name}"`),
    ],
});