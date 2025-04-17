import type * as Ast from "@/ast/ast";
import {
    createSample,
    dummySrcInfoPrintable,
    generateAstId,
} from "@/test/fuzzer/src/util";
import { FunctionDef } from "@/test/fuzzer/src/generators/function";
import type { Trait } from "@/test/fuzzer/src/generators/trait";
import { Expression } from "@/test/fuzzer/src/generators/expression";
import { Receive } from "@/test/fuzzer/src/generators/receiver";
import { UtilType } from "@/test/fuzzer/src/types";
import type { FunctionType } from "@/test/fuzzer/src/types";
import { Scope } from "@/test/fuzzer/src/scope";
import { NamedGenerativeEntity } from "@/test/fuzzer/src/generators/generator";

import fc from "fast-check";
import { Field } from "@/test/fuzzer/src/generators/field";

export interface ContractParameters {
    /**
     * Number of receive method generated within a contract.
     * @default 1
     */
    receiveNum: number;
}

/**
 * An object that encapsulates a randomly generated Ast.Contract including extra information
 * about its entries and their scopes.
 */
export class Contract extends NamedGenerativeEntity<Ast.Contract> {
    /** Scope used within the generated contract. */
    private scope: Scope;

    private receiveNum: number;

    /**
     * @param methodSignatures Signatures of methods to be generated in the contract.
     * @param trait An optional trait that the generated contract must implement.
     */
    constructor(
        parentScope: Scope,
        private methodSignatures: FunctionType[],
        private trait?: Trait,
        params: Partial<ContractParameters> = {},
    ) {
        const scope = new Scope("contract", parentScope);
        super(
            { kind: "util", type: UtilType.Contract },
            createSample(generateAstId(scope)),
        );
        this.scope = scope;

        const { receiveNum = 1 } = params;
        this.receiveNum = receiveNum;
    }

    public generate(): fc.Arbitrary<Ast.Contract> {
        // Implemented declarations from the trait
        let traitFields: fc.Arbitrary<Ast.FieldDecl>[] = [];
        let traitConstants: fc.Arbitrary<Ast.ConstantDef>[] = [];
        let traitMethods: fc.Arbitrary<Ast.FunctionDef>[] = [];
        if (this.trait !== undefined) {
            traitFields = this.trait.fieldDeclarations.map(({ type, name }) => {
                const init = new Expression(this.scope, type, {
                    compileTimeEval: true,
                }).generate();
                return new Field(this.scope, type, init, name).generate();
            });
            traitConstants = this.trait.constantDeclarations
                .map((decl) => {
                    const init = new Expression(this.scope, decl.type, {
                        compileTimeEval: true,
                    }).generate();
                    return decl
                        .createDefinition(init)
                        .generateWithAttrs([
                            { type: "override", loc: dummySrcInfoPrintable },
                        ]);
                })
                .concat(
                    this.trait.constantDefinitions.map((def) =>
                        def.generateWithAttrs([
                            { type: "override", loc: dummySrcInfoPrintable },
                        ]),
                    ),
                );
            traitMethods = this.trait.methodDeclarations.map((m) => {
                return m.generateDefinition("method", [
                    {
                        kind: "function_attribute",
                        type: "override",
                        loc: dummySrcInfoPrintable,
                    },
                    {
                        kind: "function_attribute",
                        type: "get",
                        loc: dummySrcInfoPrintable,
                        methodId: undefined,
                    },
                ]);
            });
        }

        const requestedMethods = this.methodSignatures.map((signature) =>
            new FunctionDef(this.scope, "method", signature).generate(),
        );
        const generatedMethods = Array.from(
            this.scope.getAllNamed("methodDef"),
        ).map((m) => m.generate());
        const requestedReceives = Array.from({ length: this.receiveNum }).map(
            (_) => new Receive(this.scope).generate(),
        );
        const generatedConstants = Array.from(
            this.scope.getAllNamed("constantDef"),
        ).map((c) => c.generate());
        const generatedFields = Array.from(this.scope.getAllNamed("field")).map(
            (f) => f.generate(),
        );
        return fc.record<Ast.Contract>({
            kind: fc.constant("contract"),
            id: fc.constant(this.idx),
            name: fc.constant(this.name),
            traits: fc.constant(
                this.trait === undefined ? [] : [this.trait.name],
            ),
            attributes: fc.constantFrom([]),
            declarations: fc.tuple(
                ...traitConstants,
                ...generatedConstants,
                ...traitFields,
                ...generatedFields,
                ...requestedReceives,
                ...traitMethods,
                ...generatedMethods,
                ...requestedMethods,
            ),
            loc: fc.constant(dummySrcInfoPrintable),
            params: fc.constant(undefined),
        });
    }
}
