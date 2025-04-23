import type * as Ast from "@/ast/ast";
import { createSample, generateAstId } from "@/test/fuzzer/src/util";
import { tyToAstType } from "@/test/fuzzer/src/types";
import type { Type } from "@/test/fuzzer/src/types";
import type { Scope } from "@/test/fuzzer/src/scope";
import { NamedGenerativeEntity } from "@/test/fuzzer/src/generators/generator";

import fc from "fast-check";
import { GlobalContext } from "@/test/fuzzer/src/context";

/**
 * An object that encapsulates generated Ast.TypedParameter.
 */
export class Parameter extends NamedGenerativeEntity<Ast.TypedParameter> {
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

    generate(): fc.Arbitrary<Ast.TypedParameter> {
        return fc.constant(
            GlobalContext.makeF.makeDummyTypedParameter(
                this.name,
                tyToAstType(this.type, this.isBounced),
            ),
        );
    }
}
