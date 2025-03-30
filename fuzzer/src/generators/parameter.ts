import type { TypedParameter as AstTypedParameter } from "../../../src/ast/ast";
import { createSample, dummySrcInfoPrintable, generateAstId } from "../util";
import { tyToAstType } from "../types";
import type { Type } from "../types";
import type { Scope } from "../scope";
import { NamedGenerativeEntity } from "./generator";

import fc from "fast-check";

/**
 * An object that encapsulates generated AstTypedParameter.
 */
export class Parameter extends NamedGenerativeEntity<AstTypedParameter> {
    /**
     * @param parentScope Scope of the function this argument belongs to.
     * @param isBounced If the type of the argument should be wrapped in `bounced<>`
     */
    constructor(
        parentScope: Scope,
        type: Type,
        private isBounced: boolean = false,
    ) {
        if (!parentScope.definedIn("receive", "method", "function")) {
            throw new Error(
                `Cannot define a function argument in the ${parentScope.kind} scope`,
            );
        }
        super(type, createSample(generateAstId(parentScope)));
    }

    generate(): fc.Arbitrary<AstTypedParameter> {
        return fc.record<AstTypedParameter>({
            kind: fc.constant("typed_parameter"),
            id: fc.constant(this.idx),
            name: fc.constant(this.name),
            type: fc.constant(tyToAstType(this.type, this.isBounced)),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }
}
