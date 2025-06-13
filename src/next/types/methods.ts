/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import { decodeBody } from "@/next/types/body";
import { decodeFnType } from "@/next/types/type-fn";
import { checkMethodOverride } from "@/next/types/override";
import { decodeExpr } from "@/next/types/expression";
import { crc16 } from "@/utils/crc16";
import { Int, tactMethodIds } from "@/next/types/builtins";
import { evalExpr } from "@/next/types/expr-eval";
import { assignType } from "@/next/types/type";
import { emptyTypeParams } from "@/next/types/type-params";

export function* getMethodsGeneral(
    Lazy: Ast.ThunkBuilder,
    declSig: Ast.CTrait | Ast.CContract,
    typeName: Ast.TypeId,
    traits: readonly Ast.Decl<Ast.CTraitMembers>[],
    methods: readonly Ast.Method[],
    scopeRef: () => Ast.CSource,
): Ast.Log<
    ReadonlyMap<string, Ast.DeclMem<Ast.CMethod<Ast.CBody | undefined>>>
> {
    // collect all inherited methods
    const inherited: Map<
        string,
        Ast.DeclMem<Ast.CMethod<Ast.CBody | undefined>>
    > = new Map();
    for (const {
        via,
        decl: { methods },
    } of traits) {
        for (const [name, method] of methods) {
            const nextVia = Ast.ViaMemberTrait(name, via.defLoc, method.via);
            const prev = inherited.get(name);
            if (prev) {
                yield Ast.ERedefineMember(name, prev.via, nextVia);
            } else {
                inherited.set(name, Ast.DeclMem(method.decl, nextVia));
            }
        }
    }

    // collection of all defined methods
    const all: Map<
        string,
        Ast.DeclMem<Ast.CMethod<Ast.CBody | undefined>>
    > = new Map();

    // whether inherited field/constant was defined locally
    const overridden: Set<string> = new Set();

    for (const method of methods) {
        const { override, overridable, mutates, fun, get } = method;
        const { name, inline, type, body, loc } = fun;
        const nextVia = Ast.ViaMemberOrigin(typeName.text, loc);

        const decodedFn = yield* decodeFnType(Lazy, type, scopeRef);
        const selfType = Ast.SVTRef(typeName, declSig, [], loc);
        const methodType = Ast.CTMethod(
            true, // always mutates
            emptyTypeParams,
            selfType,
            decodedFn.params,
            decodedFn.returnType,
        );
        const decodedBody =
            body.kind !== "abstract_body"
                ? yield* decodeBody(Lazy, body, methodType, loc, scopeRef)
                : undefined;
        const getMethodId = decodeGetLazy(
            Lazy,
            emptyTypeParams,
            name,
            get,
            scopeRef,
            selfType,
        );
        if (type.typeParams.length > 0) {
            yield EGenericMethod(loc);
        }

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
        );

        const methodSig = Ast.CMethod(
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
const EGenericMethod = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Method cannot be generic`)],
});

function decodeGetLazy(
    Lazy: Ast.ThunkBuilder,
    typeParams: Ast.CTypeParams,
    fnName: Ast.Id,
    get: Ast.GetAttribute | undefined,
    scopeRef: () => Ast.CSource,
    selfType: Ast.SelfType,
): undefined | Ast.Thunk<bigint | undefined> {
    if (!get) {
        return undefined;
    }
    return Lazy({
        callback: (Lazy) =>
            decodeGet(Lazy, typeParams, fnName, get, scopeRef, selfType),
        context: [Ast.TEText("checking get() opcode")],
        loc: get.loc,
        recover: undefined,
    });
}

function* decodeGet(
    Lazy: Ast.ThunkBuilder,
    typeParams: Ast.CTypeParams,
    fnName: Ast.Id,
    get: Ast.GetAttribute,
    scopeRef: () => Ast.CSource,
    selfType: Ast.SelfType,
): Ast.Log<bigint> {
    if (get.methodId) {
        const expr = yield* decodeExpr(
            Lazy,
            typeParams,
            get.methodId,
            scopeRef,
            selfType,
            new Map(),
        );
        const type = expr.value.computedType;
        if (yield* assignType(expr.value.loc, emptyTypeParams, Int, type, false)) {
            const methodId = yield* evalExpr(expr.value, scopeRef);
            if (
                // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
                methodId.kind === "number" &&
                (yield* checkMethodId(methodId.value, expr.value.loc))
            ) {
                return methodId.value;
            }
            // if evaluation failed, fallthrough to computing it
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

const EBadId = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Method ids must fit 19-bit signed integer range`)],
});
const EReservedTvmId = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(
            `Method ids cannot overlap with the TVM reserved ids: -4, -3, -2, -1, 0 ... 2^14 - 1`,
        ),
    ],
});
const EReservedTactId = (
    loc: Ast.Loc,
    tactMethodIds: readonly bigint[],
): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(
            `Method ids cannot overlap with Tact reserved method ids: ${tactMethodIds.map((n) => n.toString()).join(", ")}`,
        ),
    ],
});
