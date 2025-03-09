import { AstFieldDecl, AstExpression, AstId } from "../../../src/ast/ast";
import { createSample, generateAstId } from "../util";
import { tyToAstType, Type } from "../types";
import { Scope } from "../scope";
import { GenerativeEntity } from "./generator";

import fc from "fast-check";
import { dummySrcInfo } from "../../../src/grammar/";

/**
 * An object that encapsulates a generated AstFieldDecl.
 */
export class Field extends GenerativeEntity<AstFieldDecl> {
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
        super(type);
        this.name =
            name === undefined
                ? createSample(generateAstId(parentScope, "field"))
                : name;
    }

    generate(): fc.Arbitrary<AstFieldDecl> {
        return fc.record<AstFieldDecl>({
            kind: fc.constant("field_decl"),
            id: fc.constant(this.idx),
            name: fc.constant(this.name!),
            type: fc.constant(tyToAstType(this.type)),
            initializer:
                this.init === undefined ? fc.constant(undefined) : this.init,
            as: fc.constantFrom(undefined),
            loc: fc.constant(dummySrcInfo),
        });
    }
}
