import type {
    AstConstantDecl,
    AstConstantDef,
    AstConstantAttribute,
    AstExpression,
} from "../../../src/ast/ast";
import {
    generateAstIdFromName,
    createSample,
    generateAstId,
    generateName,
    dummySrcInfoPrintable,
} from "../util";
import { tyToAstType } from "../types";
import type { Type } from "../types";
import type { Scope } from "../scope";
import { NamedGenerativeEntity } from "./generator";

import fc from "fast-check";

/**
 * An object that encapsulates a generated AstConstantDecl.
 */
export class ConstantDecl extends NamedGenerativeEntity<AstConstantDecl> {
    constructor(scope: Scope, type: Type) {
        super(type, createSample(generateAstId(scope)));
    }

    private getAttributes(
        extraAttrs: AstConstantAttribute[],
    ): AstConstantAttribute[] {
        const attrs: AstConstantAttribute[] = extraAttrs;
        attrs.push({ type: "abstract", loc: dummySrcInfoPrintable });
        return attrs;
    }

    private generateImpl(
        extraAttrs: AstConstantAttribute[],
    ): fc.Arbitrary<AstConstantDecl> {
        return fc.record<AstConstantDecl>({
            kind: fc.constant("constant_decl"),
            id: fc.constant(this.idx),
            name: fc.constant(this.name),
            type: fc.constant(tyToAstType(this.type)),
            attributes: fc.constantFrom(this.getAttributes(extraAttrs)),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }

    /**
     * Generates a constant declaration without extra attributes.
     */
    public generate(): fc.Arbitrary<AstConstantDecl> {
        return this.generateImpl([]);
    }

    /**
     * Create definition for this constant destination.
     * @param init An initializer evaluable in compile-time.
     */
    public createDefinition(init: fc.Arbitrary<AstExpression>): ConstantDef {
        return new ConstantDef(this.name?.text, this.type, init);
    }
}

/**
 * An object that encapsulates a generated AstConstantDef.
 * @parentScope Scope this constant belongs to.
 */
export class ConstantDef extends NamedGenerativeEntity<AstConstantDef> {
    /**
     * Create new constant definition from its name and type. Used to create definition from an existing declaration.
     * @param init An initializer evaluable in compile-time.
     */
    constructor(
        name: string,
        type: Type,
        private init: fc.Arbitrary<AstExpression>,
    ) {
        super(type, generateAstIdFromName(name));
    }
    /**
     * Create a new constant definition generation name from scope.
     * @param scope Scope to generate constant name from.
     * @param type Constant type.
     * @param init An initializer evaluable in compile-time.
     */
    public static fromScope(
        scope: Scope,
        type: Type,
        init: fc.Arbitrary<AstExpression>,
    ): ConstantDef {
        return new ConstantDef(createSample(generateName(scope)), type, init);
    }

    private generateImpl(
        extraAttrs: AstConstantAttribute[],
        init?: fc.Arbitrary<AstExpression>,
    ): fc.Arbitrary<AstConstantDef> {
        const choosenInit = init ?? this.init;
        return fc.record<AstConstantDef>({
            kind: fc.constant("constant_def"),
            id: fc.constant(this.idx),
            name: fc.constant(this.name),
            type: fc.constant(tyToAstType(this.type)),
            initializer: choosenInit,
            attributes: fc.constantFrom(extraAttrs),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }

    /**
     * Generates a constant definition without extra attributes.
     */
    public generate(): fc.Arbitrary<AstConstantDef> {
        return this.generateImpl([]);
    }

    /**
     * Generates a constant definition with extra attributes and overriden init.
     */
    public generateWithAttrs(
        extraAttrs: AstConstantAttribute[] = [],
        init?: fc.Arbitrary<AstExpression>,
    ): fc.Arbitrary<AstConstantDef> {
        return this.generateImpl(extraAttrs, init);
    }
}
