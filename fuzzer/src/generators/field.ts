import type { AstFieldDecl, AstExpression, AstId } from "../../../src/ast/ast";
import { createSample, dummySrcInfoPrintable, generateAstId } from "../util";
import { tyToAstType } from "../types";
import type { Type } from "../types";
import type { Scope } from "../scope";
import { NamedGenerativeEntity } from "./generator";

import fc from "fast-check";

/**
 * An object that encapsulates a generated AstFieldDecl.
 */
export class Field extends NamedGenerativeEntity<AstFieldDecl> {
    /**
     * @param init An optional initializer evaluable in compile-time.
     * @param parentScope Scope this field belongs to. Could be a contract or program for struct fields.
     */
    constructor(
        parentScope: Scope,
        type: Type,
        private init?: fc.Arbitrary<AstExpression>,
        name?: AstId,
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

    generate(): fc.Arbitrary<AstFieldDecl> {
        return fc.record<AstFieldDecl>({
            kind: fc.constant("field_decl"),
            id: fc.constant(this.idx),
            name: fc.constant(this.name),
            type: fc.constant(tyToAstType(this.type)),
            initializer: this.init ?? fc.constant(undefined),
            as: fc.constantFrom(undefined),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }
}
