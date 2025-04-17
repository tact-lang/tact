import { CompilerContext } from "@/context/context";
import { resolveExpression, getExpType } from "@/types/resolveExpression";
import type { StatementContext } from "@/types/resolveStatements";
import type { TypeRef } from "@/types/types";
import assert from "assert";

import {
    Expression,
    NonGenerativeExpressionParams,
} from "@/test/fuzzer/src/generators";
import { Scope } from "@/test/fuzzer/src/scope";
import { SUPPORTED_STDLIB_TYPES } from "@/test/fuzzer/src/types";
import type { Type } from "@/test/fuzzer/src/types";
import {
    createProperty,
    checkProperty,
    dummySrcInfoPrintable,
    checkAsyncProperty,
    astNodeCounterexamplePrinter,
} from "@/test/fuzzer/src/util";
import fc from "fast-check";
import {
    AllowedType,
    AllowedTypeEnum,
    GenContext,
    initializeGenerator,
    NonTerminal,
    Terminal,
} from "../../src/generators/uniform-expr-gen";
import {
    bindingsAndExpressionPrtinter,
    compileExpression,
    ExpressionTestingEnvironment,
    generateBindings,
    interpretExpression,
    saveExpressionTest,
    setupEnvironment,
} from "./utils";

function emptyStatementContext(): StatementContext {
    return {
        root: dummySrcInfoPrintable,
        returns: { kind: "void" },
        vars: new Map<string, TypeRef>(),
        requiredFields: [],
        funName: null,
    };
}

function setupContexts(): [CompilerContext, StatementContext] {
    const ctx: CompilerContext = new CompilerContext();
    const sctx = emptyStatementContext();
    return [ctx, sctx];
}

describe("generation properties", () => {
    it("generates well-typed expressions", () => {
        const results = setupContexts();
        let compilerCtx = results[0];
        const stmtCtx = results[1];
        const globalScope = new Scope("program", undefined);
        for (const type of SUPPORTED_STDLIB_TYPES) {
            const ty: Type = { kind: "stdlib", type };
            // NOTE: This test checks only pure expressions, without introducing new
            // entries to any scopes.
            const exprGen = new Expression(
                globalScope,
                ty,
                NonGenerativeExpressionParams,
            ).generate();
            const property = createProperty(exprGen, (expr) => {
                compilerCtx = resolveExpression(expr, stmtCtx, compilerCtx);
                const resolvedTy = getExpType(compilerCtx, expr);
                if (resolvedTy.kind == "ref") {
                    assert.strictEqual(
                        resolvedTy.name,
                        ty.type,
                        `The resolved type ${resolvedTy.name} does not match the expected type ${ty.type}`,
                    );
                } else {
                    assert.fail(`Unexpected type: ${resolvedTy.kind}`);
                }
            });
            checkProperty(property, astNodeCounterexamplePrinter);
        }
    });
});

describe("evaluation properties", () => {
    let expressionTestingEnvironment: ExpressionTestingEnvironment;

    beforeAll(async () => {
        expressionTestingEnvironment = await setupEnvironment();
    });

    afterAll(() => expressionTestingEnvironment.outputStream.close());

    test(
        "compiler and interpreter evaluate generated expressions equally",
        async () => {
            const expressionGenerationIds: Map<AllowedTypeEnum, string[]> =
                new Map();
            expressionGenerationIds.set(AllowedType.Int, ["int1"]);
            expressionGenerationIds.set(AllowedType.OptInt, ["int_null"]);
            expressionGenerationIds.set(AllowedType.Bool, ["bool1"]);
            expressionGenerationIds.set(AllowedType.OptBool, ["bool_null"]);
            expressionGenerationIds.set(AllowedType.Cell, ["cell1"]);
            expressionGenerationIds.set(AllowedType.OptCell, ["cell_null"]);
            expressionGenerationIds.set(AllowedType.Slice, ["slice1"]);
            expressionGenerationIds.set(AllowedType.OptSlice, ["slice_null"]);
            expressionGenerationIds.set(AllowedType.Address, ["address1"]);
            expressionGenerationIds.set(AllowedType.OptAddress, [
                "address_null",
            ]);
            expressionGenerationIds.set(AllowedType.String, ["string1"]);
            expressionGenerationIds.set(AllowedType.OptString, ["string_null"]);

            const expressionGenerationCtx: GenContext = {
                identifiers: expressionGenerationIds,
                contractNames: [
                    expressionTestingEnvironment.contractNameToCompile,
                ],
                allowedNonTerminals: Object.values(NonTerminal),
                allowedTerminals: Object.values(Terminal),
            };
            const generator = initializeGenerator(
                1,
                10,
                expressionGenerationCtx,
                expressionTestingEnvironment.astF,
            );

            const property = fc.asyncProperty(
                generateBindings(
                    expressionTestingEnvironment,
                    expressionGenerationIds,
                    generator,
                ),
                generator(NonTerminal.Int),
                async (bindings, expr) => {
                    const compilationResult = await compileExpression(
                        expressionTestingEnvironment,
                        bindings,
                        expr,
                    );

                    const interpretationResult = interpretExpression(
                        expressionTestingEnvironment,
                        bindings,
                        expr,
                    );
                    if (
                        (compilationResult instanceof Error &&
                            interpretationResult instanceof BigInt) ||
                        (interpretationResult instanceof Error &&
                            compilationResult instanceof BigInt)
                    ) {
                        expect(compilationResult).toEqual(interpretationResult);
                    } else if (
                        compilationResult instanceof Error &&
                        interpretationResult instanceof Error
                    ) {
                        saveExpressionTest(
                            bindings,
                            expr,
                            compilationResult,
                            interpretationResult,
                            expressionTestingEnvironment.outputStream,
                        );
                    } else {
                        expect(compilationResult).toBe(interpretationResult);
                    }
                },
            );
            await checkAsyncProperty(property, bindingsAndExpressionPrtinter);
        },
        60 * 1000, // 1 minute
    );
});
