/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { throwInternal } from "@/error/errors";
import { getFieldishGeneral } from "@/next/types/fields";
import { getInheritedTraits } from "@/next/types/traits-scope";
import { getMethodsGeneral } from "@/next/types/methods";
import { getReceivers } from "@/next/types/receivers";
import { decodeDealiasTypeLazy, decodeTypeLazy } from "@/next/types/type";
import { decodeParams } from "@/next/types/type-fn";
import { decodeStatements } from "@/next/types/statements";
import { Void } from "@/next/types/builtins";

export function* decodeContract(
    contract: Ast.Contract,
    scopeRef: () => Ast.Scope,
) {
    const { name, attributes, declarations, init } = contract;
    const { constants, fields, methods, receivers } = declarations;

    // here we have a strange loop
    // to get fields in contentLazy we need contract parameters from initLazy
    // to compute fields for empty init, we need to know contentLazy
    // to check init body in initLazy we have to know `self` from contentLazy

    const decodedInit = yield* decodeInit(
        init,
        () => contentLazy(),
        scopeRef,
    );

    // delayed until we get all traits and init
    const contentLazy: Ast.Lazy<Ast.ContractContent> = Ast.Lazy(function* () {
        const traits = yield* getInheritedTraits(
            contract.traits,
            scopeRef,
        );

        // const contentRef = () => content;
        const content: Ast.ContractContent = {
            fieldish: yield* getFieldishFromContract(
                contractSig,
                name,
                traits,
                decodedInit,
                constants,
                fields,
                scopeRef,
            ),
            methods: yield* getMethodsFromContract(
                contractSig,
                name,
                traits,
                methods,
                scopeRef,
            ),
            receivers: yield* getReceivers(
                name,
                traits,
                receivers,
                scopeRef,
            ),
        };

        return content;
    });

    const contractSig = Ast.ContractSig(attributes, decodedInit, contentLazy);

    return contractSig;
}

function* decodeInit(
    selfType: Ast.SelfType,
    init: Ast.Init | undefined,
    contentLazy: Ast.Lazy<Ast.ContractContent>,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.InitSig> {
    const typeParams = Ast.TypeParams([], new Set());
    if (!init) {
        // no init
        const lazyInit = Ast.Lazy(function* () {
            const order: string[] = [];
            const map: Map<string, Ast.Lazy<Ast.Value>> = new Map();
            const { fieldish } = (yield* contentLazy());
            for (const name of fieldish.order) {
                const f = fieldish.map.get(name);
                if (!f) {
                    return throwInternal("Missing field");
                }
                if (f.decl.kind === 'field') {
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
        });
        return Ast.InitEmpty(lazyInit);
    } else if (init.kind === 'init_params') {
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

        const map: Map<string, Ast.InitParam> = new Map();
        for (const [name, param] of paramMap) {
            const decoded = decodeTypeLazy(typeParams, param.type, scopeRef)
            if (!param.initializer) {
                yield ENoInitializerParams(param.loc);
            }
            // TODO: support Foo { } syntax for contracts
            // const lazyExpr = Ast.Lazy(function* () {
            //     const expr = yield* decodeExpr(param.initializer, scopeRef)();
            //     const computed = expr.computedType;
            //     const ascribed = yield* decoded();
            //     yield* assignType( ascribed, computed, scopeRef);
            //     return yield* evalExpr(expr, scopeRef);
            // });
            map.set(name, Ast.InitParam(decoded, undefined, param.loc));
        }
        return Ast.InitSimple(Ast.Ordered(order, map), init.loc);
    } else {
        const { params, statements } = init;

        const decodedParams = yield* decodeParams((type) => {
            return decodeDealiasTypeLazy(typeParams, type, scopeRef);
        }, params);

        const body = yield* decodeStatements(
            statements,
            typeParams,
            selfType,
            Void,
            yield* getRequired(selfType),
            scopeRef,
        );

        // TODO: make Lazy a builder
        // (Lazy: LazyBuilder)
        // Lazy(`body of ${name}`, function* (Lazy) { ... })

        return Ast.InitFn(decodedParams, body.node);
    }
}
const EDuplicateParam = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`Contract parameter ${name} was already defined`),
        E.TEText(`New definition:`),
        E.TECode(next),
        E.TEText(`Previously defined at:`),
        E.TECode(prev),
    ],
});
const ENoInitializerParams = (
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Contract parameters cannot have an initializer`),
    ],
});
const ENoInitializerEmpty = (
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`When there is no init() or contract parameters, all fields must have an initializer`),
    ],
});

function* getRequired(selfType: Ast.SelfType | undefined): E.WithLog<undefined | Set<string>> {
    if (!selfType) {
        return new Set();
    }
    const required: Set<string> = new Set();
    switch (selfType.kind) {
        case "type_ref": {
            switch (selfType.type.kind) {
                case "contract":
                case "trait": {
                    const { fieldish } = (yield* selfType.type.content());
                    for (const [name, field] of fieldish.map) {
                        if (field.decl.kind === 'field' && !field.decl.init) {
                            required.add(name)
                        }
                    }
                    return required;
                }
                case "struct":
                case "message":
                case "union": {
                    // no requirement to fill self on these, because they have
                    // no init()
                    return required;
                }
            }
            // linter needs this
            return required;
        }
        case "map_type":
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
        case "TypeStateInit":
        case "TypeStringBuilder": {
            return undefined;
        }
    }
}

function* getMethodsFromContract(
    contractSig: Ast.ContractSig,
    typeName: Ast.TypeId,
    traits: readonly Ast.Decl<Ast.TraitContent>[],
    methods: readonly Ast.Method[],
    scopeRef: () => Ast.Scope
): E.WithLog<ReadonlyMap<string, Ast.DeclMem<Ast.MethodSig<Ast.Body>>>> {
    const res = yield* getMethodsGeneral(
        contractSig,
        typeName, 
        traits, 
        methods, 
        scopeRef,
    );

    const map: Map<string, Ast.DeclMem<Ast.MethodSig<Ast.Body>>> = new Map();
    for (const [name, { via, decl: method }] of res) {
        if (method.body) {
            // have to recreate DeclMem, because TS doesn't
            // narrow here
            map.set(name, Ast.DeclMem(
                { ...method, body: method.body },
                via,
            ));
        } else {
            // field/constant doesn't have initializer
            yield EAbstract("method", name, via);
        }
    }

    return map;
}

function* getFieldishFromContract(
    contractSig: Ast.ContractSig,
    typeName: Ast.TypeId,
    traits: readonly Ast.Decl<Ast.TraitContent>[],
    init: Ast.InitSig,
    constants: readonly Ast.FieldConstant[],
    fields: readonly Ast.FieldDecl[],
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.Ordered<Ast.DeclMem<Ast.Fieldish<Ast.Lazy<Ast.Value>>>>> {
    const res = yield* getFieldishGeneral(
        contractSig,
        typeName, 
        traits, 
        constants, 
        fields, 
        scopeRef,
    );
    
    const order: string[] = [];
    const map: Map<string, Ast.DeclMem<Ast.Fieldish<Ast.Lazy<Ast.Value>>>> = new Map();
    for (const name of res.order) {
        const field = res.map.get(name);
        if (!field) {
            return throwInternal("getFieldishTrait lost fields");
        }
        if (field.decl.init) {
            // have to recreate DeclMem, because TS doesn't
            // narrow here
            map.set(name, Ast.DeclMem(
                { ...field.decl, init: field.decl.init },
                field.via,
            ));
        } else {
            // field/constant doesn't have initializer
            yield EAbstract("field", name, field.via);
        }
    }

    if (init.kind === 'simple') {
        const map: Map<string, Ast.DeclMem<Ast.Fieldish<Ast.Lazy<Ast.Value>>>> = new Map();
        if (order.length !== 0) {
            yield EFieldsTwice(init.loc);
        }
        for (const [name, param] of init.fill.map) {
            order.push(name);
            map.set(name, Ast.DeclMem(
                Ast.InhFieldSig(param.type, param.init),
                Ast.ViaMemberOrigin(typeName.text, param.loc),
            ));
        }
        return { order: init.fill.order, map };
    } else {
        return { order, map };
    }
}
const EFieldsTwice = (
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Cannot define other fields when using contract parameters`),
    ],
});
const EAbstract = (
    kind: string,
    name: string,
    next: Ast.ViaMember,
): E.TcError => ({
    loc: next.defLoc,
    descr: [
        E.TEText(`Contract ${kind} "${name}" must have an initializer`),
        E.TEViaMember(next),
    ],
});
