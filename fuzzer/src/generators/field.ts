import type * as Ast from "../../../src/ast/ast";
import { createSample, dummySrcInfoPrintable, generateAstId } from "../util";
import { tyToAstType } from "../types";
import type { Type } from "../types";
import type { Scope } from "../scope";
import { NamedGenerativeEntity } from "./generator";

import fc from "fast-check";

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
        return fc.record<Ast.FieldDecl>({
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
