import type * as Ast from "@/ast/ast";
import {
    createSample,
    dummySrcInfoPrintable,
    generateAstId,
    packArbitraries,
} from "@/test/fuzzer/src/util";
import { FunctionDef } from "@/test/fuzzer/src/generators/function";
import type { Trait } from "@/test/fuzzer/src/generators/trait";
import { Expression } from "@/test/fuzzer/src/generators/expression";
import { Receive } from "@/test/fuzzer/src/generators/receiver";
import { SUPPORTED_STDLIB_TYPES, UtilType } from "@/test/fuzzer/src/types";
import type { FunctionType } from "@/test/fuzzer/src/types";
import { Scope } from "@/test/fuzzer/src/scope";
import { NamedGenerativeEntity } from "@/test/fuzzer/src/generators/generator";

import fc from "fast-check";
import { Field } from "@/test/fuzzer/src/generators/field";
import { ConstantDef } from "@/test/fuzzer/src/generators/constant";
import { FuzzConfig } from "@/test/fuzzer/src/config";
import { FuzzContext } from "@/test/fuzzer/src/context";

export interface ContractParameters {
    /**
     * Minimum number of receivers generated within a contract.
     * @default FuzzConfig.receiveMinNum
     */
    receiveMinNum: number;

    /**
     * Maximum number of receivers generated within a contract.
     * @default FuzzConfig.receiveMaxNum
     */
    receiveMaxNum: number;

    /**
     * Minimum number of constants generated within a contract.
     * @default FuzzConfig.contractConstantMinNum
     */
    contractConstantMinNum: number;

    /**
     * Maximum number of constants generated within a contract.
     * @default FuzzConfig.contractConstantMaxNum
     */
    contractConstantMaxNum: number;

    /**
     * Minimum number of fields generated within a contract.
     * @default FuzzConfig.contractFieldMinNum
     */
    contractFieldMinNum: number;

    /**
     * Maximum number of fields generated within a contract.
     * @default FuzzConfig.contractFieldMaxNum
     */
    contractFieldMaxNum: number;
}

/**
 * An object that encapsulates a randomly generated Ast.Contract including extra information
 * about its entries and their scopes.
 */
export class Contract extends NamedGenerativeEntity<Ast.Contract> {
    /** Scope used within the generated contract. */
    private scope: Scope;

    private receiveMinNum: number;
    private receiveMaxNum: number;
    private contractConstantMinNum: number;
    private contractConstantMaxNum: number;
    private contractFieldMinNum: number;
    private contractFieldMaxNum: number;

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

        const {
            receiveMinNum = FuzzConfig.receiveMinNum,
            receiveMaxNum = FuzzConfig.receiveMaxNum,
            contractConstantMinNum = FuzzConfig.contractConstantMinNum,
            contractConstantMaxNum = FuzzConfig.contractConstantMaxNum,
            contractFieldMinNum = FuzzConfig.contractFieldMinNum,
            contractFieldMaxNum = FuzzConfig.contractFieldMaxNum,
        } = params;
        this.receiveMinNum = receiveMinNum;
        this.receiveMaxNum = receiveMaxNum;
        this.contractConstantMinNum = contractConstantMinNum;
        this.contractConstantMaxNum = contractConstantMaxNum;
        this.contractFieldMinNum = contractFieldMinNum;
        this.contractFieldMaxNum = contractFieldMaxNum;
    }

    public generate(): fc.Arbitrary<Ast.Contract> {
        // Implemented declarations from the trait
        let traitFields: fc.Arbitrary<Ast.FieldDecl>[] = [];
        let traitConstants: fc.Arbitrary<Ast.ConstantDef>[] = [];
        let traitMethods: fc.Arbitrary<Ast.FunctionDef>[] = [];
        if (this.trait !== undefined) {
            traitFields = this.trait.fieldDeclarations.map(({ type, name }) => {
                const init = new Expression(this.scope, type, {
                    useIdentifiersInExpressions: false,
                }).generate();
                return new Field(this.scope, type, init, name).generate();
            });
            traitConstants = this.trait.constantDeclarations
                .map((decl) => {
                    const init = new Expression(this.scope, decl.type, {
                        useIdentifiersInExpressions: false,
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
        //const generatedMethods = Array.from(
        //    this.scope.getAllNamed("methodDef"),
        //).map((m) => m.generate());

        const requestedReceives = fc.array(new Receive(this.scope).generate(), {
            minLength: this.receiveMinNum,
            maxLength: this.receiveMaxNum,
        });

        // TODO: Augment the SUPPORTED_STDLIB_TYPES
        const genConstantDefEntities = fc
            .constantFrom(...SUPPORTED_STDLIB_TYPES)
            .map((ty) =>
                ConstantDef.fromScope(
                    this.scope,
                    { kind: "stdlib", type: ty },
                    new Expression(
                        this.scope,
                        { kind: "stdlib", type: ty },
                        { useIdentifiersInExpressions: false },
                    ).generate(),
                ),
            )
            .chain((d) => d.generate());

        const generatedConstants = fc.array(genConstantDefEntities, {
            minLength: this.contractConstantMinNum,
            maxLength: this.contractConstantMaxNum,
        });

        //const generatedConstants = Array.from(
        //    this.scope.getAllNamed("constantDef"),
        //).map((c) => c.generate());

        //const generatedFields = Array.from(this.scope.getAllNamed("field")).map(
        //    (f) => f.generate(),
        //);

        // TODO: Augment the SUPPORTED_STDLIB_TYPES
        const genFieldEntities = fc
            .constantFrom(...SUPPORTED_STDLIB_TYPES)
            .map(
                (ty) =>
                    new Field(
                        this.scope,
                        { kind: "stdlib", type: ty },
                        new Expression(
                            this.scope,
                            { kind: "stdlib", type: ty },
                            { useIdentifiersInExpressions: false },
                        ).generate(),
                    ),
            )
            .chain((f) => f.generate());

        const generatedFields = fc.array(genFieldEntities, {
            minLength: this.contractFieldMinNum,
            maxLength: this.contractFieldMaxNum,
        });

        return fc
            .tuple(
                packArbitraries(traitConstants),
                generatedConstants,
                packArbitraries(traitFields),
                generatedFields,
                requestedReceives,
                packArbitraries(traitMethods),
                //...generatedMethods,
                packArbitraries(requestedMethods),
            )
            .map((decls) =>
                FuzzContext.instance.makeF.makeDummyContract(
                    this.name,
                    this.trait === undefined ? [] : [this.trait.name],
                    [],
                    undefined,
                    decls.flat(),
                ),
            );
    }
}
