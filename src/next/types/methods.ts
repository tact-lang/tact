/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { decodeBody } from "@/next/types/body";
import { decodeFnType } from "@/next/types/type-fn";
import { checkMethodOverride } from "@/next/types/override";
import { decodeExpr } from "@/next/types/expression";
import { crc16 } from "@/utils/crc16";
import { tactMethodIds } from "@/next/types/builtins";
import { evalExpr } from "@/next/types/expr-eval";

export function* getMethodsGeneral(
    typeName: Ast.TypeId,
    traits: readonly Ast.Decl<Ast.TraitContent>[],
    methods: readonly Ast.Method[],
    scopeRef: () => Ast.Scope,
): E.WithLog<ReadonlyMap<string, Ast.DeclMem<Ast.MethodSig<Ast.Body | undefined>>>> {
    // collect all inherited methods
    const inherited: Map<string, Ast.DeclMem<Ast.MethodSig<Ast.Body | undefined>>> = new Map();
    for (const { via, decl: { methods } } of traits) {
        for (const [name, method] of methods) {
            const nextVia = Ast.ViaMemberTrait(
                name,
                via.defLoc,
                method.via,
            );
            const prev = inherited.get(name);
            if (prev) {
                yield E.ERedefineMember(name, prev.via, nextVia);
            } else {
                inherited.set(name, Ast.DeclMem(
                    method.decl,
                    nextVia,
                ));
            }
        }
    }

    // collection of all defined methods
    const all: Map<string, Ast.DeclMem<Ast.MethodSig<Ast.Body | undefined>>> = new Map();

    // whether inherited field/constant was defined locally
    const overridden: Set<string> = new Set();

    for (const method of methods) {
        const { override, overridable, mutates, fun, get } = method;
        const { name, inline, type, body, loc } = fun;
        const nextVia = Ast.ViaMemberOrigin(typeName.text, loc);

        const decodedFn = yield* decodeFnType(type, scopeRef);
        const selfType = Ast.MVTypeRef(typeName, [], loc);
        const methodType = Ast.DecodedMethodType(
            mutates,
            decodedFn.typeParams,
            selfType,
            decodedFn.params,
            decodedFn.returnType,
        );
        const decodedBody = body.kind !== 'abstract_body'
            ? yield* decodeBody(
                body,
                methodType,
                loc,
                scopeRef,
            )
            : undefined;
        const getMethodId = decodeGetLazy(
            name,
            get,
            scopeRef,
        );

        // check for abstract

        const prevInh = inherited.get(name.text);
        if (prevInh) {
            overridden.add(name.text);
        }

        // check that override/abstract/virtual modifiers are correct
        yield* checkMethodOverride(
            name.text,
            prevInh,
            methodType,
            nextVia,
            override,
            scopeRef,
        );

        const methodSig = Ast.MethodSig(
            overridable,
            methodType,
            inline,
            decodedBody,
            getMethodId,
        );

        all.set(name.text, Ast.DeclMem(methodSig, nextVia));
    }

    // add methods that were NOT overridden
    for (const [name, field] of inherited) {
        if (overridden.has(name)) {
            continue;
        }
        all.set(name, field);
    }

    return all;
}

function decodeGetLazy(
    fnName: Ast.Id,
    get: Ast.GetAttribute | undefined,
    scopeRef: () => Ast.Scope,
): undefined | Ast.Lazy<bigint> {
    if (!get) {
        return undefined;
    }
    return Ast.Lazy(() => decodeGet(fnName, get, scopeRef));
}

function* decodeGet(
    fnName: Ast.Id,
    get: Ast.GetAttribute,
    scopeRef: () => Ast.Scope,
): E.WithLog<bigint> {
    if (get.methodId) {
        // decode expression
        const exprLazy = decodeExpr(get.methodId, scopeRef);
        
        // force computation
        const expr = yield* exprLazy();

        // check type of expression
        const type = yield* expr.computedType();

        if (type.kind === 'TyInt') {
            // evaluate expression
            const methodId = yield* evalExpr(expr, scopeRef);
            
            if (
                // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
                methodId.kind === 'number' &&
                    (yield* checkMethodId(methodId.value, expr.loc))
            ) {
                return methodId.value;
            }

            // if evaluation failed, fallthrough to computing it
        } else {
            // TODO: yield EMismatch();
        }
    }

    // compute method id out of function name
    const methodId = BigInt((crc16(fnName.text) & 0xffff) | 0x10000);
    
    // just in case
    yield* checkMethodId(methodId, fnName.loc);

    return methodId;
}

function* checkMethodId(methodId: bigint, loc: Ast.Loc) {
    if (methodId < -(2n ** 18n) || methodId >= 2n ** 18n) {
        // method ids are 19-bit signed integers
        yield EBadId(loc);
        return false;
    } else if (-4n <= methodId && methodId < 2n ** 14n) {
        // method ids -4, -3, -2, -1, 0 ... 2^14 - 1 (inclusive) are kind of reserved by TVM
        // for the upper bound see F12_n (CALL) TVM instruction
        // and many small ids will be taken by internal procedures
        //
        // also, some ids are taken by the getters generated by Tact:
        // supported_interfaces -> 113617
        // lazy_deployment_completed -> 115390
        // get_abi_ipfs -> 121275
        yield EReservedTvmId(loc);
        return false;
    } else if (tactMethodIds.includes(methodId)) {
        yield EReservedTactId(loc, tactMethodIds);
        return false;
    } else {
        return true;
    }
}

const EBadId = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Method ids must fit 19-bit signed integer range`),
    ],
});
const EReservedTvmId = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Method ids cannot overlap with the TVM reserved ids: -4, -3, -2, -1, 0 ... 2^14 - 1`),
    ],
});
const EReservedTactId = (loc: Ast.Loc, tactMethodIds: readonly bigint[]): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Method ids cannot overlap with Tact reserved method ids: ${tactMethodIds.map((n) => n.toString()).join(", ")}`),
    ],
});