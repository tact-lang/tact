/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { getFieldishGeneral } from "@/next/types/fields";
import { getInheritedTraits } from "@/next/types/traits-scope";
import { getMethodsGeneral } from "@/next/types/methods";
import { getReceivers } from "@/next/types/receivers";

export function* decodeTrait(
    trait: Ast.Trait,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.TraitSig> {
    const { attributes, declarations, name, loc } = trait;
    const { constants, fields, methods, receivers } = declarations;

    const attr = attributes[0];
    // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
    if (attr) {
        yield ENoAttributes(attr.loc);
    }

    // delayed until we get all traits and init
    const contentLazy = Ast.Lazy(function* () {
        const traits = yield* getInheritedTraits(
            trait.traits,
            scopeRef,
        );

        // const contentRef = () => content;
        const content: Ast.TraitContent = {
            fieldish: yield* getFieldishGeneral(
                traitSig,
                name,
                traits,
                constants,
                fields,
                scopeRef,
            ),
            methods: yield* getMethodsGeneral(
                traitSig,
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

    const traitSig = Ast.TraitSig(contentLazy);

    return traitSig;
}

const ENoAttributes = (
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Traits cannot have attributes`),
    ],
});
