import type * as Ast from "../../../src/ast/ast";
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
 * An object that encapsulates a generated Ast.ConstantDecl.
 */
export class ConstantDecl extends NamedGenerativeEntity<Ast.ConstantDecl> {
    constructor(scope: Scope, type: Type) {
        super(type, createSample(generateAstId(scope)));
    }

    private getAttributes(
        extraAttrs: Ast.ConstantAttribute[],
    ): Ast.ConstantAttribute[] {
        const attrs: Ast.ConstantAttribute[] = extraAttrs;
        attrs.push({ type: "abstract", loc: dummySrcInfoPrintable });
        return attrs;
    }

    private generateImpl(
        extraAttrs: Ast.ConstantAttribute[],
    ): fc.Arbitrary<Ast.ConstantDecl> {
        return fc.record<Ast.ConstantDecl>({
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
    public generate(): fc.Arbitrary<Ast.ConstantDecl> {
        return this.generateImpl([]);
    }

    /**
     * Create definition for this constant destination.
     * @param init An initializer evaluable in compile-time. // cspell:disable-line
     */
    public createDefinition(init: fc.Arbitrary<Ast.Expression>): ConstantDef {
        return new ConstantDef(this.name.text, this.type, init);
    }
}

/**
 * An object that encapsulates a generated Ast.ConstantDef.
 * @parentScope Scope this constant belongs to.
 */
export class ConstantDef extends NamedGenerativeEntity<Ast.ConstantDef> {
    /**
     * Create new constant definition from its name and type. Used to create definition from an existing declaration.
     * @param init An initializer evaluable in compile-time. // cspell:disable-line
     */
    constructor(
        name: string,
        type: Type,
        private init: fc.Arbitrary<Ast.Expression>,
    ) {
        super(type, generateAstIdFromName(name));
    }
    /**
     * Create a new constant definition generation name from scope.
     * @param scope Scope to generate constant name from.
     * @param type Constant type.
     * @param init An initializer evaluable in compile-time. // cspell:disable-line
     */
    public static fromScope(
        scope: Scope,
        type: Type,
        init: fc.Arbitrary<Ast.Expression>,
    ): ConstantDef {
        return new ConstantDef(createSample(generateName(scope)), type, init);
    }

    private generateImpl(
        extraAttrs: Ast.ConstantAttribute[],
        init?: fc.Arbitrary<Ast.Expression>,
    ): fc.Arbitrary<Ast.ConstantDef> {
        const chosenInit = init ?? this.init;
        return fc.record<Ast.ConstantDef>({
            kind: fc.constant("constant_def"),
            id: fc.constant(this.idx),
            name: fc.constant(this.name),
            type: fc.constant(tyToAstType(this.type)),
            initializer: chosenInit,
            attributes: fc.constantFrom(extraAttrs),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }

    /**
     * Generates a constant definition without extra attributes.
     */
    public generate(): fc.Arbitrary<Ast.ConstantDef> {
        return this.generateImpl([]);
    }

    /**
     * Generates a constant definition with extra attributes and overridden init.
     */
    public generateWithAttrs(
        extraAttrs: Ast.ConstantAttribute[] = [],
        init?: fc.Arbitrary<Ast.Expression>,
    ): fc.Arbitrary<Ast.ConstantDef> {
        return this.generateImpl(extraAttrs, init);
    }
}
