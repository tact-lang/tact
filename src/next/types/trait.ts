/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import { getFieldishGeneral } from "@/next/types/fields";
import { getInheritedTraits } from "@/next/types/traits-scope";
import { getMethodsGeneral } from "@/next/types/methods";
import { getReceivers } from "@/next/types/receivers";

export function* decodeTrait(
    Lazy: Ast.ThunkBuilder,
    trait: Ast.Trait,
    scopeRef: () => Ast.Scope,
): Ast.WithLog<Ast.TraitSig> {
    const { attributes, declarations, name, loc } = trait;
    const { constants, fields, methods, receivers } = declarations;

    const attr = attributes[0];
    // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
    if (attr) {
        yield ENoAttributes(attr.loc);
    }

    // delayed until we get all traits and init
    const contentLazy = Lazy({
        callback: function* (Lazy) {
            const traits = yield* getInheritedTraits(
                trait.traits,
                scopeRef,
            );
    
            // const contentRef = () => content;
            const content: Ast.TraitContent = {
                fieldish: yield* getFieldishGeneral(
                    Lazy,
                    traitSig,
                    name,
                    traits,
                    constants,
                    fields,
                    scopeRef,
                ),
                methods: yield* getMethodsGeneral(
                    Lazy,
                    traitSig,
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
        context: [Ast.TEText("checking inner scope of trait")],
        loc,
        recover,
    });

    const traitSig = Ast.TraitSig(contentLazy);

    const selfType = Ast.MVTypeRef(
        trait.name,
        traitSig,
        [],
        trait.loc,
    );

    return traitSig;
}

const ENoAttributes = (
    loc: Ast.Loc,
): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(`Traits cannot have attributes`),
    ],
});

const recover: Ast.TraitContent = {
    fieldish: Ast.Ordered([], new Map()),
    methods: new Map(),
    receivers: {
        bounce: {
            message: [],
            messageAny: undefined,
        },
        internal: {
            message: [],
            messageAny: undefined,
            stringAny: undefined,
            empty: undefined,
        },
        external: {
            message: [],
            messageAny: undefined,
            stringAny: undefined,
            empty: undefined,
        },
    },
};