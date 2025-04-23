import type * as Ast from "@/ast/ast";
import { CompilerContext } from "@/context/context";
import { resolveExpression, getExpType } from "@/types/resolveExpression";
import type { StatementContext } from "@/types/resolveStatements";
import type { TypeRef } from "@/types/types";
import assert from "assert";

import { Expression } from "@/test/fuzzer/src/generators";
import { Scope } from "@/test/fuzzer/src/scope";
import { StdlibType, SUPPORTED_STDLIB_TYPES } from "@/test/fuzzer/src/types";
import type { Type } from "@/test/fuzzer/src/types";
import {
    createProperty,
    checkProperty,
    dummySrcInfoPrintable,
    checkAsyncProperty,
    astNodeCounterexamplePrinter,
    packArbitraries,
} from "@/test/fuzzer/src/util";
import fc from "fast-check";
import {
    initializeGenerator,
    NonTerminal,
    Terminal,
} from "../../src/generators/uniform-expr-gen";
import type { NonTerminalEnum } from "../../src/generators/uniform-expr-gen";
import {
    bindingsAndExpressionPrtinter,
    compileExpression,
    interpretExpression,
    saveExpressionTest,
    setupEnvironment,
} from "./utils";
import type { ExpressionTestingEnvironment } from "./utils";
import { Let } from "@/test/fuzzer/src/generators/statement";
import { GlobalContext } from "@/test/fuzzer/src/context";

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
            const exprGen = new Expression(globalScope, ty).generate();
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

    afterAll(() => {
        expressionTestingEnvironment.outputStream.close();
    });

    test(
        "compiler and interpreter evaluate generated expressions equally",
        async () => {
            /*const expressionGenerationIds: Map<AllowedTypeEnum, string[]> =
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
            */

            const globalScope = new Scope("block", undefined);
            const initializerCtx = {
                minSize: 1,
                maxSize: 1,
                useIdentifiers: false,
                allowedNonTerminals: Object.values(NonTerminal),
                allowedTerminals: Object.values(Terminal),
            };
            const bindingsGenerator = initializeGenerator(initializerCtx);

            const expressionGenerationCtx = {
                minSize: 1,
                maxSize: 10,
                useIdentifiers: true,
                allowedNonTerminals: Object.values(NonTerminal),
                allowedTerminals: Object.values(Terminal),
            };
            const exprGenerator = new Expression(
                globalScope,
                { kind: "stdlib", type: StdlibType.Int },
                expressionGenerationCtx,
            );

            const property = fc.asyncProperty(
                generateBindings(globalScope, bindingsGenerator),
                exprGenerator.generate(),
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

function generateBindings(
    scope: Scope,
    bindingsGenerator: (
        scope: Scope,
        nonTerminal: NonTerminalEnum,
    ) => fc.Arbitrary<Ast.Expression>,
): fc.Arbitrary<Ast.StatementLet[]> {
    // For each of the types, we create a let generator
    const types: Type[] = [
        { kind: "stdlib", type: StdlibType.Int },
        { kind: "stdlib", type: StdlibType.Bool },
        { kind: "stdlib", type: StdlibType.Address },
        { kind: "stdlib", type: StdlibType.Cell },
        { kind: "stdlib", type: StdlibType.Slice },
        { kind: "stdlib", type: StdlibType.String },
        { kind: "optional", type: { kind: "stdlib", type: StdlibType.Int } },
        { kind: "optional", type: { kind: "stdlib", type: StdlibType.Bool } },
        {
            kind: "optional",
            type: { kind: "stdlib", type: StdlibType.Address },
        },
        { kind: "optional", type: { kind: "stdlib", type: StdlibType.Cell } },
        { kind: "optional", type: { kind: "stdlib", type: StdlibType.Slice } },
        { kind: "optional", type: { kind: "stdlib", type: StdlibType.String } },
    ];
    const result: fc.Arbitrary<Ast.StatementLet>[] = [];

    for (const ty of types) {
        result.push(
            new Let(
                scope,
                ty,
                bindingsGenerator(scope, typeToNonTerminal(ty)),
            ).generate() as fc.Arbitrary<Ast.StatementLet>,
        );
        if (ty.kind === "optional") {
            result.push(
                new Let(
                    scope,
                    ty,
                    fc.constant(GlobalContext.makeF.makeDummyNull()),
                ).generate() as fc.Arbitrary<Ast.StatementLet>,
            );
        }
    }

    return packArbitraries(result);
}

function typeToNonTerminal(ty: Type): NonTerminalEnum {
    switch (ty.kind) {
        case "optional": {
            // Treat them as if they were non-optionals
            return typeToNonTerminal(ty.type);
        }
        case "stdlib": {
            switch (ty.type) {
                case StdlibType.Int:
                    return NonTerminal.Int;
                case StdlibType.Address:
                    return NonTerminal.Address;
                case StdlibType.Bool:
                    return NonTerminal.Bool;
                case StdlibType.Cell:
                    return NonTerminal.Cell;
                case StdlibType.Slice:
                    return NonTerminal.Slice;
                case StdlibType.String:
                    return NonTerminal.String;
                case StdlibType.Builder:
                    throw new Error("Not supported");
                case StdlibType.StringBuilder:
                    throw new Error("Not supported");
            }
            break;
        }
        case "function":
        case "map":
        case "message":
        case "struct":
        case "util":
            throw new Error("Not supported.");
    }
}
