import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { decodeTypeParams } from "@/next/types/type-params";
import { decodeDealiasTypeLazy } from "@/next/types/type";
import { recoverName } from "@/next/types/name";
import { messageBuiltin, structBuiltin } from "@/next/types/builtins";

export function* decodeFnType(
    { typeParams, params, returnType }: Ast.FnType,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.DecodedFnType> {
    const decodedTypeParams = yield* decodeTypeParams(typeParams);
    const dealias = (type: Ast.Type) => {
        return decodeDealiasTypeLazy(decodedTypeParams, type, scopeRef);
    };
    return Ast.DecodedFnType(
        decodedTypeParams,
        yield* decodeParams(dealias, params),
        dealias(returnType),
    );
}

export function* decodeParams(
    dealias: (type: Ast.Type) => Ast.Lazy<Ast.DecodedType>,
    params: readonly Ast.TypedParameter[],
): E.WithLog<Ast.Parameters> {
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

export type CallResult = {
    readonly returnType: Ast.DecodedType;
    readonly typeArgs: ReadonlyMap<string, Ast.DecodedType>;
}

export function* getCallResult(
    fn: Ast.DecodedFnType,
    args: readonly Ast.DecodedType[],
): E.WithLog<CallResult> {
    // yield* assignType(ascribed.key, key.computedType, ctx.scopeRef);
}

export function* lookupMethod(
    selfType: Ast.DecodedType,
    methodName: string,
    computedArgTypes: readonly Ast.DecodedType[],
    typeDecls: ReadonlyMap<string, Ast.Decl<Ast.TypeDeclSig>>,
    extensions: ReadonlyMap<string, Ast.Lazy<readonly Ast.Decl<Ast.ExtSig>[]>>,
): E.WithLog<CallResult>  {
    if (self.computedType.kind === 'type_ref') {
        const selfDecl = ctx.scopeRef().typeDecls.get(self.computedType.name.text);
        if (!selfDecl) {
            //
        } else if (selfDecl.decl.kind === 'struct') {
            const builtin = structBuiltin.get(node.method.text);
            if (builtin) {
                return Ast.DMethodCall(self, node.method, args, typeArgs, returnType, node.loc);
            }
        } else if (selfDecl.decl.kind === 'message') {
            const builtin = messageBuiltin.get(node.method.text);
        }
    }

    switch (selfType.kind) {
        case "recover":
        case "type_ref":
        case "TypeAlias":
        case "TypeParam":
        case "map_type":
        case "TypeBounced":
        case "TypeMaybe":
        case "tuple_type":
        case "tensor_type":
        case "TyInt":
        case "TySlice":
        case "TyCell":
        case "TyBuilder":
        case "unit_type":
        case "TypeVoid":
        case "TypeNull":
        case "TypeBool":
        case "TypeAddress":
        case "TypeString":
        case "TypeStringBuilder":
    }
    if (selfType.kind === 'type_ref') {
        const typeName = selfType.name.text;
        const decl = typeDecls.get(typeName)
        switch (decl?.decl.kind) {
            case undefined: {
                return;
            }
            case "alias": {
                return;
            }
            case "trait":
            case "contract": {
                const { methods } = yield* decl.decl.content();
                const method = methods.get(methodName);
                if (!method) {
                    return;
                }
                const methodType = method.decl.type;
                return;
            }
            case "struct":
            case "message":
            case "union": {
                const extsLazy = extensions.get(methodName);
                if (!extsLazy) {
                    return;
                }
                for (const { decl } of yield* extsLazy()) {
                    const methodType = decl.type;
                    // methodType.typeParams
                    // typeArgs
                    if (methodType.self.ground === 'yes') {
                        //
                    } else {
                        //
                    }
                }
            }
        }
    }
}

export function* lookupFunction(
    fnType: Ast.DecodedFnType | undefined,
    ascribed: readonly Ast.DecodedType[],
    argTypes: readonly Ast.DecodedType[],
): E.WithLog<CallResult> {

}