import type * as Ast from "@/ast/ast";
import { createSample, generateAstId } from "@/test/fuzzer/src/util";
import { tyToAstType } from "@/test/fuzzer/src/types";
import type { Type } from "@/test/fuzzer/src/types";
import type { Scope } from "@/test/fuzzer/src/scope";
import { NamedGenerativeEntity } from "@/test/fuzzer/src/generators/generator";

import fc from "fast-check";
import { GlobalContext } from "@/test/fuzzer/src/context";

/**
 * An object that encapsulates a generated Ast.FieldDecl.
 */
export class Field extends NamedGenerativeEntity<Ast.FieldDecl> {
    /**
     * @param init An optional initializer evaluable in compile-time. // cspell:disable-line
     * @param parentScope Scope this field belongs to. Could be a contract or program for struct fields.
     */
    constructor(
        parentScope: Scope,
        type: Type,
        private init?: fc.Arbitrary<Ast.Expression>,
        name?: Ast.Id,
    ) {
        if (
            !parentScope.definedIn(
                "contract",
                "method",
                "program" /* struct field */,
                "trait",
            )
        ) {
            throw new Error(
                `Cannot define a field in a ${parentScope.kind} scope`,
            );
        }
        super(type, name ?? createSample(generateAstId(parentScope)));
    }

    generate(): fc.Arbitrary<Ast.FieldDecl> {
        return (this.init ?? fc.constant(undefined)).map((i) =>
            GlobalContext.makeF.makeDummyFieldDecl(
                this.name,
                tyToAstType(this.type),
                i,
                undefined,
            ),
        );
    }
}
