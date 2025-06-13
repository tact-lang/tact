/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import { throwInternal } from "@/error/errors";
import { getFieldishGeneral } from "@/next/types/fields";
import { getInheritedTraits } from "@/next/types/traits-scope";
import { getMethodsGeneral } from "@/next/types/methods";
import { getReceivers } from "@/next/types/receivers";
import { decodeDealiasTypeLazy, decodeTypeLazy } from "@/next/types/type";
import { decodeParams } from "@/next/types/type-fn";
import { decodeStatementsLazy } from "@/next/types/statements";
import { Void } from "@/next/types/builtins";
import { emptyTypeParams } from "@/next/types/type-params";

export function* decodeContract(
    Lazy: Ast.ThunkBuilder,
    contract: Ast.Contract,
    scopeRef: () => Ast.CSource,
) {
    const { name, attributes, declarations, init } = contract;
    const { constants, fields, methods, receivers } = declarations;

    // here we have a strange loop
    // to get fields in contentLazy we need contract parameters from initLazy
    // to compute fields for empty init, we need to know contentLazy
    // to check init body in initLazy we have to know `self` from contentLazy

    const decodedInit = yield* decodeInit(
        Lazy,
        contract.loc,
        () => selfType,
        init,
        () => contentLazy,
        scopeRef,
    );

    // delayed until we get all traits and init
    const contentLazy: Ast.Thunk<Ast.CContractMembers> = Lazy({
        callback: function* (Lazy) {
            const traits = yield* getInheritedTraits(contract.traits, scopeRef);

            // const contentRef = () => content;
            const content: Ast.CContractMembers = {
                fieldish: yield* getFieldishFromContract(
                    Lazy,
                    contractSig,
                    name,
                    traits,
                    decodedInit,
                    constants,
                    fields,
                    scopeRef,
                ),
                methods: yield* getMethodsFromContract(
                    Lazy,
                    contractSig,
                    name,
                    traits,
                    methods,
                    scopeRef,
                ),
                receivers: yield* getReceivers(
                    Lazy,
                    () => selfType,
                    name,
                    traits,
                    receivers,
                    scopeRef,
                ),
            };

            return content;
        },
        context: [Ast.TEText("checking scope of contract")],
        loc: contract.loc,
        recover,
    });

    const contractSig = Ast.CContract(attributes, decodedInit, contentLazy);

    const selfType = Ast.SVTRef(
        contract.name,
        contractSig,
        [],
        contract.loc,
    );

    return contractSig;
}

function* decodeInit(
    Lazy: Ast.ThunkBuilder,
    contractLoc: Ast.Loc,
    selfTypeRef: () => Ast.SelfType,
    init: Ast.Init | undefined,
    contentLazy: () => Ast.Thunk<Ast.CContractMembers>,
    scopeRef: () => Ast.CSource,
): Ast.Log<Ast.CInit> {
    if (!init) {
        // no init
        const lazyInit = Lazy({
            callback: function* () {
                const order: string[] = [];
                const map: Map<
                    string,
                    Ast.Thunk<Ast.Recover<Ast.Value>>
                > = new Map();
                const { fieldish } = yield* contentLazy()();
                for (const name of fieldish.order) {
                    const f = fieldish.map.get(name);
                    if (!f) {
                        return throwInternal("Missing field");
                    }
                    if (f.decl.kind === "field") {
                        const init = f.decl.init;
                        if (init) {
                            order.push(name);
                            map.set(name, init);
                        } else {
                            yield ENoInitializerEmpty(f.via.defLoc);
                        }
                    }
                }
                return Ast.Ordered(order, map);
            },
            context: [Ast.TEText("computing parameters of empty init")],
            loc: contractLoc,
            recover: undefined,
        });
        return Ast.CInitEmpty(lazyInit);
    } else if (init.kind === "init_params") {
        const order: string[] = [];
        const paramMap: Map<string, Ast.FieldDecl> = new Map();
        for (const param of init.params) {
            const name = param.name.text;
            const prev = paramMap.get(name);
            if (prev) {
                yield EDuplicateParam(name, prev.loc, param.loc);
            } else {
                order.push(name);
                paramMap.set(name, param);
            }
        }

        const map: Map<string, Ast.CInitParam> = new Map();
        for (const [name, param] of paramMap) {
            const decoded = decodeTypeLazy(
                Lazy,
                emptyTypeParams,
                param.type,
                scopeRef,
            );
            if (!param.initializer) {
                yield ENoInitializerParams(param.loc);
            }
            map.set(name, Ast.CInitParam(decoded, undefined, param.loc));
        }
        return Ast.CInitSimple(Ast.Ordered(order, map), init.loc);
    } else {
        const { params, statements } = init;

        const decodedParams = yield* decodeParams((type) => {
            return decodeDealiasTypeLazy(Lazy, emptyTypeParams, type, scopeRef);
        }, params);

        const body = decodeStatementsLazy(
            Lazy,
            init.loc,
            statements,
            emptyTypeParams,
            selfTypeRef,
            Lazy({
                callback: function* () {
                    return Void;
                },
                context: [],
                loc: init.loc,
                recover: Void,
            }),
            true,
            scopeRef,
        );

        return Ast.CInitFn(decodedParams, body);
    }
}
const EDuplicateParam = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): Ast.TcError => ({
    loc: next,
    descr: [
        Ast.TEText(`Contract parameter ${name} was already defined`),
        Ast.TEText(`New definition:`),
        Ast.TECode(next),
        Ast.TEText(`Previously defined at:`),
        Ast.TECode(prev),
    ],
});
const ENoInitializerParams = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Contract parameters cannot have an initializer`)],
});
const ENoInitializerEmpty = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(
            `When there is no init() or contract parameters, all fields must have an initializer`,
        ),
    ],
});

function* getMethodsFromContract(
    Lazy: Ast.ThunkBuilder,
    contractSig: Ast.CContract,
    typeName: Ast.TypeId,
    traits: readonly Ast.Decl<Ast.CTraitMembers>[],
    methods: readonly Ast.Method[],
    scopeRef: () => Ast.CSource,
): Ast.Log<ReadonlyMap<string, Ast.DeclMem<Ast.CMethod<Ast.CBody>>>> {
    const res = yield* getMethodsGeneral(
        Lazy,
        contractSig,
        typeName,
        traits,
        methods,
        scopeRef,
    );

    const map: Map<string, Ast.DeclMem<Ast.CMethod<Ast.CBody>>> = new Map();
    for (const [name, { via, decl: method }] of res) {
        if (method.body) {
            // have to recreate DeclMem, because TS doesn't
            // narrow here
            map.set(name, Ast.DeclMem({ ...method, body: method.body }, via));
        } else {
            // field/constant doesn't have initializer
            yield EAbstract("method", name, via);
        }
    }

    return map;
}

function* getFieldishFromContract(
    Lazy: Ast.ThunkBuilder,
    contractSig: Ast.CContract,
    typeName: Ast.TypeId,
    traits: readonly Ast.Decl<Ast.CTraitMembers>[],
    init: Ast.CInit,
    constants: readonly Ast.FieldConstant[],
    fields: readonly Ast.FieldDecl[],
    scopeRef: () => Ast.CSource,
): Ast.Log<
    Ast.Ordered<Ast.DeclMem<Ast.CFieldish<Ast.Thunk<Ast.Recover<Ast.Value>>>>>
> {
    const res = yield* getFieldishGeneral(
        Lazy,
        contractSig,
        typeName,
        traits,
        constants,
        fields,
        scopeRef,
    );

    const order: string[] = [];
    const map: Map<
        string,
        Ast.DeclMem<Ast.CFieldish<Ast.Thunk<Ast.Recover<Ast.Value>>>>
    > = new Map();
    for (const name of res.order) {
        const field = res.map.get(name);
        if (!field) {
            return throwInternal("getFieldishTrait lost fields");
        }
        if (field.decl.init) {
            // have to recreate DeclMem, because TS doesn't
            // narrow here
            map.set(
                name,
                Ast.DeclMem(
                    { ...field.decl, init: field.decl.init },
                    field.via,
                ),
            );
        } else {
            // field/constant doesn't have initializer
            yield EAbstract("field", name, field.via);
        }
    }

    if (init.kind === "simple") {
        const map: Map<
            string,
            Ast.DeclMem<Ast.CFieldish<Ast.Thunk<Ast.Recover<Ast.Value>>>>
        > = new Map();
        if (order.length !== 0) {
            yield EFieldsTwice(init.loc);
        }
        for (const [name, param] of init.fill.map) {
            order.push(name);
            map.set(
                name,
                Ast.DeclMem(
                    Ast.CField(param.type, param.init),
                    Ast.ViaMemberOrigin(typeName.text, param.loc),
                ),
            );
        }
        return { order: init.fill.order, map };
    } else {
        return { order, map };
    }
}
const EFieldsTwice = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(`Cannot define other fields when using contract parameters`),
    ],
});
const EAbstract = (
    kind: string,
    name: string,
    next: Ast.ViaMember,
): Ast.TcError => ({
    loc: next.defLoc,
    descr: [
        Ast.TEText(`Contract ${kind} "${name}" must have an initializer`),
        Ast.TEViaMember(next),
    ],
});

const recover: Ast.CContractMembers = {
    fieldish: Ast.Ordered([], new Map()),
    methods: new Map(),
    receivers: {
        bounce: {
            message: [],
            messageAny: undefined,
        },
        external: {
            empty: undefined,
            message: [],
            messageAny: undefined,
            stringAny: undefined,
        },
        internal: {
            empty: undefined,
            message: [],
            messageAny: undefined,
            stringAny: undefined,
        },
    },
};
