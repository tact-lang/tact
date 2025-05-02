import type * as Ast from "@/ast/ast";
import { CompilerContext } from "@/context/context";
import type { StatementContext } from "@/types/resolveStatements";
import type { TypeRef } from "@/types/types";
import { Expression } from "@/test/fuzzer/src/generators";
import { Scope } from "@/test/fuzzer/src/scope";
import { StdlibType } from "@/test/fuzzer/src/types";
import { NonTerminal, Terminal } from "@/test/fuzzer/src/uniform-expr-types";
import type { Type } from "@/test/fuzzer/src/types";
import {
    dummySrcInfoPrintable,
    checkAsyncProperty,
    packArbitraries,
    createSample,
} from "@/test/fuzzer/src/util";
import fc from "fast-check";
import {
    EdgeCaseConfig,
    injectEdgeCases,
} from "../../src/generators/uniform-expr-gen";
import {
    bindingsAndExpressionPrtinter,
    compileExpression,
    interpretExpression,
    setupEnvironment,
} from "./utils";
import type { ExpressionTestingEnvironment } from "./utils";
import { FuzzContext } from "@/test/fuzzer/src/context";
import { Parameter } from "@/test/fuzzer/src/generators/parameter";
import { prettyPrint } from "@/ast/ast-printer";
import { ExpressionParameters } from "@/test/fuzzer/src/generators/expression";

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

// describe("generation properties", () => {
//     it("generates well-typed expressions", () => {
//         const results = setupContexts();
//         let compilerCtx = results[0];
//         const stmtCtx = results[1];
//         const globalScope = new Scope("program", undefined);
//         for (const type of SUPPORTED_STDLIB_TYPES) {
//             const ty: Type = { kind: "stdlib", type };
//             // NOTE: This test checks only pure expressions, without introducing new
//             // entries to any scopes.
//             const exprGen = new Expression(globalScope, ty).generate();
//             const property = createProperty(exprGen, (expr) => {
//                 compilerCtx = resolveExpression(expr, stmtCtx, compilerCtx);
//                 const resolvedTy = getExpType(compilerCtx, expr);
//                 if (resolvedTy.kind == "ref") {
//                     assert.strictEqual(
//                         resolvedTy.name,
//                         ty.type,
//                         `The resolved type ${resolvedTy.name} does not match the expected type ${ty.type}`,
//                     );
//                 } else {
//                     assert.fail(`Unexpected type: ${resolvedTy.kind}`);
//                 }
//             });
//             checkProperty(property, astNodeCounterexamplePrinter);
//         }
//     });
// });

async function test() {
    const script_args = process.argv.slice(2);
    let reportIfOneFailsButNotTheOther = true;
    if (typeof script_args[0] !== "undefined") {
        const boolV = JSON.parse(script_args[0]);
        if (typeof boolV === "boolean") {
            reportIfOneFailsButNotTheOther = boolV;
        }
    }

    let expressionTestingEnvironment: ExpressionTestingEnvironment;

    expressionTestingEnvironment = await setupEnvironment();

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

    const functionScope = new Scope("function", undefined);

    // Attach parameters in the function scope
    const funParameters = addParameters(functionScope);

    // The scope for local declarations
    const blockScope = new Scope("block", functionScope);

    const bindingsGenerationCtx: ExpressionParameters = {
        minExpressionSize: 1,
        maxExpressionSize: 1,
        useIdentifiersInExpressions: false,
        allowedNonTerminals: Object.values(NonTerminal),
        allowedTerminals: Object.values(Terminal),
    };

    const edgeCaseConfigForBindings = {
        tryIntegerValues: [
            0n,
            1n,
            -1n,
            2n,
            -2n,
            -(2n ** 256n),
            2n ** 256n - 1n,
        ],
        tryBooleanValues: [],
        tryStringValues: [],
        generalizeIntegerToIdentifier: false,
        generalizeBooleanToIdentifier: false,
        generalizeStringToIdentifier: false,
        instantiateIntIds: false,
    };

    const bindingsGenerator = initializeBindingsGenerator(
        funParameters,
        bindingsGenerationCtx,
        edgeCaseConfigForBindings,
        blockScope,
    );

    const expressionGenerationCtx: ExpressionParameters = {
        minExpressionSize: 2,
        maxExpressionSize: 10,
        useIdentifiersInExpressions: true,
        allowedNonTerminals: [
            NonTerminal.Bool,
            NonTerminal.Int,
            NonTerminal.LiteralBool,
            NonTerminal.LiteralInt,
        ],
        allowedTerminals: [
            Terminal.id_int,
            Terminal.integer,
            Terminal.shift_l,
            Terminal.shift_r,
            Terminal.eq,
        ],
    };
    const exprGenerator = new Expression(
        blockScope,
        { kind: "stdlib", type: StdlibType.Bool },
        expressionGenerationCtx,
    );

    const edgeCaseConfigForExpr = {
        tryIntegerValues: [
            0n,
            1n,
            -1n,
            2n,
            -2n,
            -(2n ** 256n),
            2n ** 256n - 1n,
        ],
        tryBooleanValues: [],
        tryStringValues: [],
        generalizeIntegerToIdentifier: true,
        generalizeBooleanToIdentifier: true,
        generalizeStringToIdentifier: true,
        instantiateIntIds: true,
    };

    const property = fc.asyncProperty(
        fc.array(bindingsGenerator, { minLength: 100, maxLength: 100 }),
        exprGenerator
            .generate()
            .chain((expr) =>
                fc.array(
                    injectEdgeCases(edgeCaseConfigForExpr, expr, blockScope),
                    { minLength: 50, maxLength: 50 },
                ),
            ),
        async (bindings, exprs) => {
            //const makeF = FuzzContext.instance.makeF;

            //const dummyLet = makeF.makeDummyStatementLet(makeF.makeDummyId("hello_world"), undefined, makeF.makeDummyNumber(10, 0n));
            //expr = makeF.makeDummyOpBinary("<<",
            //    makeF.makeDummyNumber(10, 1n),
            //    makeF.makeDummyId("hello_world")
            //);

            //bindings = [...bindings, dummyLet];
            for (const expr of exprs) {
                const exprStr = prettyPrint(expr);
                console.log(exprStr);
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
                    Array.isArray(compilationResult) &&
                    Array.isArray(interpretationResult)
                ) {
                    //expect(compilationResult.length).toEqual(interpretationResult.length);
                    const differingIndexes = getDifferingIndexes(
                        compilationResult,
                        interpretationResult,
                        reportIfOneFailsButNotTheOther,
                    );
                    if (differingIndexes.length > 0) {
                        const errorString = buildErrorString(
                            expr,
                            compilationResult,
                            interpretationResult,
                            differingIndexes,
                            bindings,
                        );
                        throw new Error(errorString);
                    }
                }
                /*
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
                    }*/
            }
        },
    );
    await checkAsyncProperty(property, bindingsAndExpressionPrtinter);

    expressionTestingEnvironment.outputStream.close();
}

const TYPES: Type[] = [
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

function addParameters(
    functionScope: Scope,
): [Ast.TypedParameter, Parameter][] {
    // For each of the types, we create a parameter generator
    const result: [Ast.TypedParameter, Parameter][] = TYPES.map((ty) => {
        const param = new Parameter(functionScope, ty, false);
        functionScope.addNamed("parameter", param);
        return [createSample(param.generate()), param];
    });
    return result;
}

function initializeBindingsGenerator(
    parameters: [Ast.TypedParameter, Parameter][],
    bindingsCtx: ExpressionParameters,
    edgeCaseConfig: EdgeCaseConfig,
    blockScope: Scope,
): fc.Arbitrary<[Ast.TypedParameter, Ast.Expression][]> {
    const result: fc.Arbitrary<[Ast.TypedParameter, Ast.Expression]>[] = [];

    for (const [typedParam, param] of parameters) {
        const genBuilder = new Expression(blockScope, param.type, bindingsCtx);
        result.push(
            genBuilder.generate().chain((expr) =>
                injectEdgeCases(edgeCaseConfig, expr, blockScope).map(
                    (injectedExpr) => {
                        const result: [Ast.TypedParameter, Ast.Expression] = [
                            typedParam,
                            injectedExpr,
                        ];
                        return result;
                    },
                ),
            ),
        );
    }

    return packArbitraries(result);
}

/*function typeToNonTerminal(ty: Type): NonTerminalEnum {
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
}*/

function getDifferingIndexes(
    compilationResult: (boolean | Error)[],
    interpretationResult: (boolean | Error)[],
    reportIfOneFailsButNotTheOther: boolean,
): number[] {
    if (compilationResult.length !== interpretationResult.length) {
        throw new Error(
            "Unexpected array lengths: interpreter results and compiler results should have same length",
        );
    }
    // They all have the same length

    const result: number[] = [];
    for (let i = 0; i < compilationResult.length; i++) {
        const i1 = compilationResult[i];
        const i2 = interpretationResult[i];
        if (typeof i1 === "undefined" || typeof i2 === "undefined") {
            throw new Error(`Index ${i} should exist in array`);
        }
        if (typeof i1 === "boolean" && typeof i2 === "boolean") {
            if (i1 !== i2) {
                result.push(i);
            }
        } else if (typeof i1 !== "boolean" && typeof i2 !== "boolean") {
            // Both produced an error, ignore
        } else {
            // One produced an error, but not the other
            if (reportIfOneFailsButNotTheOther) {
                result.push(i);
            }
        }
    }
    return result;
}

function buildErrorString(
    expr: Ast.Expression,
    compilationResult: (boolean | Error)[],
    interpretationResult: (boolean | Error)[],
    differingIndexes: number[],
    bindings: [Ast.TypedParameter, Ast.Expression][][],
): string {
    const bindingsString = bindings.map(
        (args) =>
            `Parameters: ${args.map(([arg, value]) => astToString(arg.name) + ", " + astToString(value))}`,
    );
    const failingBindings = bindingsString.filter((_, i) =>
        differingIndexes.includes(i),
    );
    const errors = differingIndexes.map((i) => {
        return (
            `${failingBindings[i]}\n` +
            `Compiler: ${compilationResult[i]}\n` +
            `Interpreter: ${interpretationResult[i]}\n`
        );
    });
    const message =
        `\nFailing parameter values:\n` +
        failingBindings +
        `\nGenerated expression:\n` +
        FuzzContext.instance.format(expr) +
        `\n` +
        errors.join("\n") +
        `\n-----\n`;
    return message;
}

function astToString(expr: Ast.Expression | Ast.OptionalId): string {
    switch (expr.kind) {
        case "number":
            return `${expr.value}`;
        case "boolean":
            return `${expr.value}`;
        case "id":
            return expr.text;
        case "address":
            return expr.value.toRawString();
        case "cell":
            return expr.value.toString();
        case "slice":
            return expr.value.toString();
        case "null":
            return "null";
        case "wildcard":
            return "_";
        case "string":
            return expr.value;
        default:
            throw new Error("Currently not supported");
    }
}

test();
