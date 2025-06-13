/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import { throwInternal } from "@/error/errors";
import { decodeTypeLazy } from "@/next/types/type";
import { checkFieldOverride } from "@/next/types/override";
import { decodeConstantDef } from "@/next/types/constant-def";
import { emptyTypeParams } from "@/next/types/type-params";
import { decodeInitializerLazy } from "@/next/types/struct-fields";

type MaybeExpr = Ast.Thunk<Ast.Value | undefined> | undefined;

export function* getFieldishGeneral(
    Lazy: Ast.ThunkBuilder,
    traitSigRef: Ast.CTrait | Ast.CContract,
    typeName: Ast.TypeId,
    traits: readonly Ast.Decl<Ast.CTraitMembers>[],
    constants: readonly Ast.FieldConstant[],
    fields: readonly Ast.FieldDecl[],
    scopeRef: () => Ast.CSource,
): Ast.Log<Ast.Ordered<Ast.DeclMem<Ast.CFieldish<MaybeExpr>>>> {
    // collect all inherited fields and constants
    const inherited: Map<
        string,
        Ast.DeclMem<Ast.CFieldish<MaybeExpr>>
    > = new Map();
    for (const {
        via,
        decl: { fieldish },
    } of traits) {
        for (const name of fieldish.order) {
            const field = fieldish.map.get(name);
            if (!field) {
                return throwInternal("Field was lost");
            }
            const nextVia = Ast.ViaMemberTrait(name, via.defLoc, field.via);
            const prev = inherited.get(name);
            if (prev) {
                yield Ast.ERedefineMember(name, prev.via, nextVia);
            } else {
                inherited.set(name, Ast.DeclMem(field.decl, nextVia));
            }
        }
    }

    const selfType = Ast.SVTRef(typeName, traitSigRef, [], typeName.loc);

    // in which order fields were defined
    const order: string[] = [];

    // collection of all defined fields and constants
    const all: Map<string, Ast.DeclMem<Ast.CFieldish<MaybeExpr>>> = new Map();

    // whether inherited field/constant was defined locally
    const overridden: Set<string> = new Set();

    for (const field of fields) {
        const name = field.name;
        const nextVia = Ast.ViaMemberOrigin(typeName.text, field.loc);

        const prev = all.get(name.text);
        if (prev) {
            // duplicate local field
            yield Ast.ERedefineMember(name.text, prev.via, nextVia);
        }

        // remember order of fields
        order.push(name.text);

        // decode field
        all.set(
            name.text,
            decodeField(Lazy, typeName.text, field, scopeRef, selfType),
        );

        // check if this field was inherited
        const prevInh = inherited.get(name.text);
        if (prevInh) {
            // remember that this inherited field was handled
            overridden.add(name.text);

            if (prevInh.decl.kind !== "field") {
                // cannot override constant with field
                yield Ast.ERedefineMember(name.text, prevInh.via, nextVia);
            }
        }
    }

    for (const field of constants) {
        const { override, overridable, body } = field;
        const { init, name, loc } = body;
        const nextVia = Ast.ViaMemberOrigin(typeName.text, loc);

        const prev = all.get(name.text);
        if (prev) {
            // duplicate local constant
            yield Ast.ERedefineMember(name.text, prev.via, nextVia);
        }

        // we mostly need this for technical reasons:
        // fields and constants occupy the same namespace
        order.push(name.text);

        // remember that this inherited constant was handled.
        // we always override previous constants for type
        // recovery reasons, so no other conditions are given
        const prevInh = inherited.get(name.text);
        if (prevInh) {
            overridden.add(name.text);
        }

        // get the definition
        const next = yield* decodeConstant(
            Lazy,
            init,
            overridable,
            nextVia,
            scopeRef,
            selfType,
        );

        // check that override/abstract/virtual modifiers are correct
        yield* checkFieldOverride(
            name.text,
            prevInh,
            next.decl.type,
            nextVia,
            override,
        );

        // we're all set to store this constant
        all.set(name.text, next);
    }

    // add fields/constants that were NOT overridden
    for (const [name, field] of inherited) {
        if (overridden.has(name)) {
            continue;
        }
        if (field.decl.kind === "field") {
            // fields must always be redefined
            yield EMustCopyField(name, field.via);
        } else {
            // constants are inherited as is
        }
        all.set(name, field);
    }

    return {
        order,
        map: all,
    };
}

function decodeField(
    Lazy: Ast.ThunkBuilder,
    typeName: string,
    field: Ast.FieldDecl,
    scopeRef: () => Ast.CSource,
    selfType: Ast.SelfType,
) {
    const { initializer, type, loc } = field;
    const nextVia = Ast.ViaMemberOrigin(typeName, loc);

    const decoded = decodeTypeLazy(Lazy, emptyTypeParams, type, scopeRef);

    const init = decodeInitializerLazy(
        Lazy,
        field.loc,
        emptyTypeParams,
        decoded,
        initializer,
        selfType,
        scopeRef,
    );

    // decode field
    return Ast.DeclMem(Ast.CField(decoded, init), nextVia);
}

const EMustCopyField = (name: string, prev: Ast.ViaMember): Ast.TcError => ({
    loc: prev.defLoc,
    descr: [
        Ast.TEText(
            `Field "${name}" was defined in parent trait, but never mentioned`,
        ),
        Ast.TEViaMember(prev),
    ],
});

function* decodeConstant(
    Lazy: Ast.ThunkBuilder,
    init: Ast.ConstantInit,
    overridable: boolean,
    nextVia: Ast.ViaMember,
    scopeRef: () => Ast.CSource,
    selfType: Ast.SelfType,
): Ast.Log<Ast.DeclMem<Ast.CFieldConstant<MaybeExpr>>> {
    if (init.kind === "constant_decl") {
        const type = decodeTypeLazy(Lazy, emptyTypeParams, init.type, scopeRef);
        return Ast.DeclMem(
            Ast.CFieldConstant(overridable, type, undefined),
            nextVia,
        );
    } else {
        const [type, expr] = decodeConstantDef(
            Lazy,
            nextVia.defLoc,
            emptyTypeParams,
            init,
            scopeRef,
            selfType,
        );
        return Ast.DeclMem(Ast.CFieldConstant(overridable, type, expr), nextVia);
    }
}
