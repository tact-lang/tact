/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";

export function* getInheritedTraits(
    traits: readonly Ast.TypeId[],
    scopeRef: () => Ast.CSource,
): Ast.Log<readonly Ast.Decl<Ast.CTraitMembers>[]> {
    const decls = scopeRef().typeDecls;
    const prevTraits: Ast.Decl<Ast.CTraitMembers>[] = [];
    for (const trait of traits) {
        const name = trait.text;
        const decl = decls.get(name);
        if (!decl) {
            yield EUndefinedTrait(name, trait.loc);
            continue;
        }
        const { via, decl: traitDecl } = decl;
        if (traitDecl.kind !== "trait") {
            yield EOnlyTraits(trait.loc);
            continue;
        }
        prevTraits.push(Ast.Decl(yield* traitDecl.content(), via));
    }
    return prevTraits;
}

const EUndefinedTrait = (name: string, loc: Ast.Loc) => Ast.TcError(
    loc,
    Ast.TEText(`Traits "${name}" is not defined`),
);

const EOnlyTraits = (loc: Ast.Loc) => Ast.TcError(
    loc,
    Ast.TEText(`Can only inherit traits`),
);
