/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { isSubsetOf } from "@/utils/isSubsetOf";
import { decodeStatementsLazy } from "@/next/types/statements";

export function* decodeBody(
    Lazy: Ast.ThunkBuilder,
    node: Ast.FunctionalBody,
    fnType: Ast.DecodedFnType | Ast.DecodedMethodType,
    loc: Ast.Loc,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.Body> {
    switch (node.kind) {
        case "abstract_body": {
            yield ENoBody(loc)
            return Ast.TactBody(Lazy({
                callback: function* () { return undefined; },
                context: [E.TEText("checking body of function")],
                loc,
                recover: undefined,
            }));
        }
        case "regular_body": {
            const selfTypeRef = () => {
                return fnType.kind === 'DecodedMethodType'
                    ? fnType.self
                    : undefined;
            };
            return Ast.TactBody(decodeStatementsLazy(
                Lazy,
                loc,
                node.statements,
                fnType.typeParams,
                selfTypeRef,
                fnType.returnType,
                true,
                scopeRef,
            ));
        }
        case "asm_body": {
            return Ast.FiftBody(
                Lazy({
                    callback: () => checkShuffle(
                        node.shuffle,
                        fnType,
                        loc,
                        scopeRef,
                    ),
                    context: [E.TEText("checking shuffle")],
                    loc,
                    recover: undefined,
                }),
                node.instructions,
            );
        }
        case "native_body": {
            return Ast.FuncBody(node.nativeName);
        }
    }
}

const ENoBody = (
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Function must have a body`),
    ],
});

function* checkShuffle(
    shuffle: Ast.AsmShuffle,
    fnType: Ast.DecodedFnType | Ast.DecodedMethodType,
    loc: Ast.Loc,
    scopeRef: () => Ast.Scope,
) {
    const { args, ret } = shuffle;
    if (args.length !== 0) {
        const argSet = new Set(args.map((id) => id.text));

        if (argSet.size !== args.length) {
            yield EDuplicateArgs(loc);
        }

        const paramsArray: string[] = [];
        for (const typedId of fnType.params.order) {
            if (typedId.name.kind === "wildcard") {
                yield EWildcardArgs(loc);
            } else {
                paramsArray.push(typedId.name.text);
            }
        }

        const paramSet = new Set(paramsArray);
        if (!isSubsetOf(paramSet, argSet)) {
            yield EMissingArgs(loc);
        }

        if (!isSubsetOf(argSet, paramSet)) {
            yield EExtraArgs(loc);
        }
    }

    if (ret.length !== 0) {
        const shuffleRetSet = new Set(ret.map((num) => num.value));
        if (shuffleRetSet.size !== ret.length) {
            yield EDuplicateRet(loc);
        }
        
        const retTupleSize = yield* getRetTupleSize(
            fnType,
            scopeRef,
        );

        if (typeof retTupleSize !== 'undefined') {
            const returnValueSet = new Set([
                ...Array(retTupleSize).keys().map(x => BigInt(x))
            ]);

            if (!isSubsetOf(returnValueSet, shuffleRetSet)) {
                yield EMissingRet(loc);
            }

            if (!isSubsetOf(shuffleRetSet, returnValueSet)) {
                yield EExtraRet(loc);
            }
        }
    }
    
    return shuffle;
}

function* getRetTupleSize(
    { kind, returnType }: Ast.DecodedFnType | Ast.DecodedMethodType,
    scopeRef: () => Ast.Scope,
): E.WithLog<undefined | number> {
    const type = yield* returnType();
    const baseSize = yield* getTypeTupleSize(type, scopeRef);
    if (typeof baseSize === 'undefined') {
        return undefined;
    }
    return baseSize + (kind === 'DecodedMethodType' ? 1 : 0);
}

function* getTypeTupleSize(
    type: Ast.DecodedType,
    scopeRef: () => Ast.Scope,
) {
    switch (type.kind) {
        case "recover": {
            return undefined;
        }
        case "type_ref": {
            const decl = scopeRef().typeDecls.get(type.name.text);
            if (!decl) {
                return undefined;
            }
            switch (decl.decl.kind) {
                case "contract": {
                    const content = yield* decl.decl.content();
                    return content.fieldish.order.length;
                }
                case "struct":
                case "message": {
                    return decl.decl.fields.order.length;
                }
                case "union": {
                    // unions don't have exact size
                    return undefined;
                }
                case "alias": {
                    // aliases already handled by decoder
                    return undefined;
                }
                case "trait": {
                    // traits cannot be used as types
                    return undefined;
                }
            }
            // typescript wants this
            return undefined;
        }
        case "TypeAlias": {
            return undefined;
        }
        case "TypeParam": {
            // this size can be anything
            return undefined;
        }
        case "map_type": {
            return 1;
        }
        case "TypeBounced": {
            // undefined can have weird encodings
            return undefined;
        }
        case "TypeMaybe": {
            return getTypeTupleSize(type.type, scopeRef);
        }
        case "tuple_type": {
            return 1;
        }
        case "tensor_type": {
            return type.typeArgs.length;
        }
        case "TyInt":
        case "TySlice":
        case "TyCell":
        case "TyBuilder":
        case "unit_type":
        case "TypeBool":
        case "TypeAddress":
        case "TypeString":
        case "TypeStateInit":
        case "TypeStringBuilder":
        case "TypeNull": {
            return 1;
        }
        case "TypeVoid": {
            return 0;
        }
    }
}

const EDuplicateArgs = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Argument rearrangement cannot have duplicates`),
    ],
});

const EWildcardArgs = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Argument rearrangement cannot use wildcards`),
    ],
});

const EMissingArgs = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Argument rearrangement must mention all function parameters`),
    ],
});

const EExtraArgs = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Argument rearrangement must mention only function parameters`),
    ],
});

const EDuplicateRet = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Return rearrangement cannot have duplicates`),
    ],
});

const EMissingRet = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Return rearrangement must mention all function parameters`),
    ],
});

const EExtraRet = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Return rearrangement must mention only function parameters`),
    ],
});
