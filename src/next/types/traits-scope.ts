/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";

export function* getInheritedTraits(
    traits: readonly Ast.TypeId[],
    scopeRef: () => Ast.Scope,
): E.WithLog<readonly Ast.Decl<Ast.TraitContent>[]> {
    const decls = scopeRef().typeDecls;
    const prevTraits: Ast.Decl<Ast.TraitContent>[] = [];
    for (const trait of traits) {
        const name = trait.text;
        const decl = decls.get(name);
        if (!decl) {
            yield EUndefinedTrait(name, trait.loc);
            continue;
        }
        const { via, decl: traitDecl } = decl;
        if (traitDecl.kind !== 'trait') {
            yield EOnlyTraits(trait.loc);
            continue;
        }
        prevTraits.push(Ast.Decl(
            yield* traitDecl.content(),
            via,
        ));
    }
    return prevTraits;
}

const EUndefinedTrait = (
    name: string,
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Traits "${name}" is not defined`),
    ],
});

const EOnlyTraits = (
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Can only inherit traits`),
    ],
});
