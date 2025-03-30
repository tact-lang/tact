import type { AstTrait, AstExpression } from "../../../src/ast/ast";
import {
    createSample,
    dummySrcInfoPrintable,
    generateAstId,
    randomBool,
} from "../util";
import { FunctionDecl } from "./function";
import { Field } from "./field";
import { ConstantDecl, ConstantDef } from "./constant";
import { Expression } from "./expression";
import { TypeGen, makeFunctionTy, UtilType } from "../types";
import type { Type } from "../types";
import { Scope } from "../scope";
import { GenerativeEntity } from "./generator";

import fc from "fast-check";

export interface TraitParameters {
    /**
     * Number of fields generated within a trait.
     * @default 1
     */
    fieldNum: number;

    /**
     * Number of method declarations generated within a trait.
     * @default 1
     */
    methodDeclarationsNum: number;

    /**
     * Number of constant declarations generated within a trait.
     * @default 1
     */
    constantNum: number;
}

/**
 * An object that encapsulates a randomly generated AstTrait.
 */
export class Trait extends GenerativeEntity<AstTrait> {
    /** Trait scope. */
    private scope: Scope;

    // Configuration options
    private fieldNum: number;
    private methodDeclarationsNum: number;
    private constantNum: number;

    // Declarations to be defined within contracts/traits that implement this trait.
    public fieldDeclarations: Field[] = [];
    public constantDeclarations: ConstantDecl[] = [];
    public constantDefinitions: ConstantDef[] = [];
    public methodDeclarations: FunctionDecl[] = [];

    constructor(programScope: Scope, params: Partial<TraitParameters> = {}) {
        super({ kind: "util", type: UtilType.Trait });
        this.scope = new Scope("trait", programScope);
        this.name = createSample(generateAstId(this.scope));

        const {
            fieldNum = 1,
            methodDeclarationsNum = 1,
            constantNum = 1,
        } = params;
        this.fieldNum = fieldNum;
        this.methodDeclarationsNum = methodDeclarationsNum;
        this.constantNum = constantNum;

        this.prepareDeclarationTypes();
    }

    /**
     * Randomly generates init expressions for constants.
     */
    private makeInit(ty: Type): fc.Arbitrary<AstExpression> | undefined {
        return ty.kind === "map" || randomBool()
            ? undefined
            : new Expression(this.scope, ty, {
                  compileTimeEval: true,
              }).generate();
    }

    /**
     * Generates arbitrary types for fields, methods and constants that will be
     * defined in the trait.
     */
    private prepareDeclarationTypes() {
        this.fieldDeclarations = Array.from({ length: this.fieldNum }).map(
            (_) => {
                const ty = TypeGen.fromScope(this.scope).pick();
                const field = new Field(this.scope, ty);
                this.scope.add("field", field);
                return field;
            },
        );
        this.methodDeclarations = Array.from({
            length: this.methodDeclarationsNum,
        }).map((_) => {
            const returnTy = TypeGen.fromScope(this.scope).pick();
            const funTy = makeFunctionTy("method", returnTy);
            return new FunctionDecl(this.scope, "method", funTy);
        });
        this.constantDeclarations = [];
        this.constantDefinitions = [];
        Array.from({ length: this.constantNum }).forEach((_) => {
            const ty = TypeGen.fromScope(this.scope).pick();
            const init = this.makeInit(ty);
            if (init)
                this.constantDefinitions.push(
                    ConstantDef.fromScope(this.scope, ty, init),
                );
            else
                this.constantDeclarations.push(
                    new ConstantDecl(this.scope, ty),
                );
        });
    }

    public generate(): fc.Arbitrary<AstTrait> {
        // NOTE: It doesn't implement any receive functions, to don't clutter the top-level with them.
        const constants = (
            this.constantDeclarations as (ConstantDecl | ConstantDef)[]
        )
            .concat(this.constantDefinitions)
            .map((c) => c.generate());
        const fields = this.fieldDeclarations.map((f) => f.generate());
        const methods = this.methodDeclarations.map((m) => m.generate());
        return fc.record<AstTrait>({
            kind: fc.constant("trait"),
            id: fc.constant(this.idx),
            name: fc.constant(this.name!),
            traits: fc.constant([]),
            attributes: fc.constant([]),
            declarations: fc.tuple(...constants, ...fields, ...methods),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }
}
