/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { throwInternal } from "@/error/errors";
import { getFieldishGeneral } from "@/next/types/fields";
import { getInheritedTraits } from "@/next/types/traits-scope";
import { getMethodsGeneral } from "@/next/types/methods";

export function* decodeContract(
    contract: Ast.Contract,
    scopeRef: () => Ast.Scope,
) {
    const { name, attributes, declarations, init } = contract;
    const { constants, fields, methods, receivers } = declarations;

    // delayed until we get all traits
    const content = Ast.Lazy(function* () {
        const traits = yield* getInheritedTraits(
            contract.traits,
            scopeRef,
        );

        // const contentRef = () => content;
        const content: Ast.ContractContent = {
            fieldish: yield* getFieldishFromContract(
                name.text,
                traits,
                constants,
                fields,
                scopeRef,
            ),
            methods: yield* getMethodsFromContract(
                name,
                traits,
                methods,
                scopeRef,
            ),
            bounce,
            external,
            internal,
        };

        return content;
    });

    const decodedInit = decodeInit(init, fields, scopeRef);

    return Ast.ContractSig(attributes, decodedInit, content);
}

function* getMethodsFromContract(
    typeName: Ast.TypeId,
    traits: readonly Ast.Decl<Ast.TraitContent>[],
    methods: readonly Ast.Method[],
    scopeRef: () => Ast.Scope
): E.WithLog<ReadonlyMap<string, Ast.DeclMem<Ast.MethodSig<Ast.Body>>>> {
    const res = yield* getMethodsGeneral(typeName, traits, methods, scopeRef);

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
    typeName: string,
    traits: readonly Ast.Decl<Ast.TraitContent>[],
    constants: readonly Ast.FieldConstant[],
    fields: readonly Ast.FieldDecl[],
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.Ordered<Ast.DeclMem<Ast.Fieldish<Ast.Lazy<Ast.DecodedExpression>>>>> {
    const res = yield* getFieldishGeneral(typeName, traits, constants, fields, scopeRef);
    
    const order: string[] = [];
    const map: Map<string, Ast.DeclMem<Ast.Fieldish<Ast.Lazy<Ast.DecodedExpression>>>> = new Map();
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

    return { order, map };
}

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
