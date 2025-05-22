import type * as Ast from "@/ast/ast";
import { Scope } from "@/test/fuzzer/src/scope";
import { StdlibType } from "@/test/fuzzer/src/types";
import {
    checkAsyncProperty,
    ProxyContract,
    compileNativeFunC,
    CustomStdlib,
    getCustomFunCStdlibCode,
} from "@/test/fuzzer/src/util";
import fc from "fast-check";
import { Parameter } from "@/test/fuzzer/src/generators/parameter";
import {
    FunCNonTerminal,
    FunCTerminal,
    generateIntBitLength,
    initializeGenerator,
} from "@/test/fuzzer/src/generators/func-uniform-expr-gen";
import * as fs from "fs";
import { Blockchain, SandboxContract, Treasury } from "@ton/sandbox";
import { toNano } from "@ton/core";
import path from "path";

/*
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
}*/

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
    //const script_args = process.argv.slice(2);
    //let reportIfOneFailsButNotTheOther = true;
    //if (typeof script_args[0] !== "undefined") {
    //    const boolV = JSON.parse(script_args[0]);
    //    if (typeof boolV === "boolean") {
    //        reportIfOneFailsButNotTheOther = boolV;
    //    }
    //}
    const numOfCalcParams = 6;
    const blockchain = await Blockchain.create();
    const treasury = (await blockchain.treasury("treasury")).getSender();

    const customFuncStdlib = getCustomFunCStdlibCode();
    const customStdlib: CustomStdlib = {
        modules: [],
        stdlib_fc: customFuncStdlib.stdlib_fc,
        stdlib_ex_fc: customFuncStdlib.stdlib_ex_fc,
    };

    //const expressionTestingEnvironment = await setupEnvironment();

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
    addParameters(functionScope, numOfCalcParams);

    const integerValuesToTry = [
        0n,
        1n,
        -1n,
        2n,
        -2n,
        5n,
        -5n,
        -(2n ** 256n),
        -(2n ** 256n) + 1n,
        2n ** 256n - 1n,
        2n ** 256n - 2n,
        256n,
        255n,
        257n,
        -256n,
        -255n,
        -257n,
    ];

    const bindGenInit = getIntegerGenerator(integerValuesToTry);

    const expressionGenerationCtx = {
        minSize: 4,
        maxSize: 15,
        useIdentifiers: true,
        allowedNonTerminals: [
            FunCNonTerminal.Int,
            //FunCNonTerminal.LiteralInt,
        ],
        allowedTerminals: [
            FunCTerminal.id_int,
            //FunCTerminal.shift_l,
            //FunCTerminal.shift_r,

            //FunCTerminal.ceil_shift_r,
            //FunCTerminal.round_shift_r,

            //FunCTerminal.mult,
            //FunCTerminal.add,
            //FunCTerminal.minus,
            //FunCTerminal.unary_minus,
            //FunCTerminal.div,
            //FunCTerminal.mod,

            FunCTerminal.muldiv,
            FunCTerminal.ceil_muldiv,
            FunCTerminal.round_muldiv,
            //FunCTerminal.ceil_mod,
            //FunCTerminal.round_mod,
            //FunCTerminal.ceil_div,
            //FunCTerminal.round_div,
            //FunCTerminal.bit_xor,
            //FunCTerminal.bit_and,
            //FunCTerminal.bit_or,
            //FunCTerminal.bit_not,
            FunCTerminal.comparison,

            FunCTerminal.neq,
            //FunCTerminal.le,

            //FunCTerminal.eq,
            //FunCTerminal.cond,
            //FunCTerminal.ge,
            //FunCTerminal.gt,
            //FunCTerminal.lt,
        ],
    };

    const exprGenInit = initializeGenerator(expressionGenerationCtx);

    const errorPatternsToIgnore: PatternToIgnore[] = [
        {
            compilationPattern: {
                kind: "error",
                regExp: new RegExp(
                    "^Unable to execute get method. Got exit_code: 4$",
                ),
            },
            interpretationPattern: {
                kind: "error",
                regExp: new RegExp(
                    "^Unable to execute get method. Got exit_code: 4$",
                ),
            },
        },
        {
            compilationPattern: {
                kind: "error",
                regExp: new RegExp(
                    "^Unable to execute get method. Got exit_code: 5$",
                ),
            },
            interpretationPattern: {
                kind: "error",
                regExp: new RegExp(
                    "^Unable to execute get method. Got exit_code: 5$",
                ),
            },
        },
        {
            compilationPattern: {
                kind: "error",
                regExp: new RegExp(
                    "^Unable to execute get method. Got exit_code: 4$",
                ),
            },
            interpretationPattern: {
                kind: "no_error",
            },
        },
    ];

    // load the func code to specialize
    const genCode = fs.readFileSync(path.join(__dirname, "genExpr.fc"), "utf8");

    const property = fc.asyncProperty(
        fc.array(
            fc.array(fc.tuple(bindGenInit, fc.boolean()), {
                minLength: numOfCalcParams,
                maxLength: numOfCalcParams,
            }),
            { minLength: 200, maxLength: 200 },
        ),
        fc.array(
            fc.array(bindGenInit, {
                minLength: numOfCalcParams,
                maxLength: numOfCalcParams,
            }),
            { minLength: 100, maxLength: 100 },
        ),
        exprGenInit(functionScope, FunCNonTerminal.Int),
        async (instantiations, rawParams, expr) => {
            const genContract = await compileContract(
                genCode.replace("<<GEN_EXPR>>", expr),
                customStdlib,
                blockchain,
                treasury,
            );
            if (genContract instanceof Error) {
                return;
            }
            for (const ins of instantiations) {
                const insExpr = replaceIdentifiers(expr, ins);
                console.log(insExpr);
                const insContract = await compileContract(
                    genCode.replace("<<GEN_EXPR>>", insExpr),
                    customStdlib,
                    blockchain,
                    treasury,
                );
                if (insContract instanceof Error) {
                    continue;
                }

                const params = buildParameters(rawParams, ins);

                const evalResult = await evaluateContracts(
                    genContract,
                    insContract,
                    params,
                );

                const differingIndexes = getDifferingIndexes(
                    evalResult[0],
                    evalResult[1],
                    errorPatternsToIgnore,
                );
                if (differingIndexes.length > 0) {
                    const errorString = buildErrorString(
                        expr,
                        insExpr,
                        evalResult[0],
                        evalResult[1],
                        differingIndexes,
                        params,
                    );
                    throw new Error(errorString);
                }
            }
        },
    );
    await checkAsyncProperty(property, dummyReporterPrinter);
}

function dummyReporterPrinter(
    params: [[bigint, boolean][][], bigint[][], string],
) {
    return "";
    //`\n-----\nGenerated bindings:\n` +
    //bindings.map((bind) => FuzzContext.instance.format(bind)).join("\n")
    //`\nGenerated parameter values:\n` +
    //paramValues +
    //`\nGenerated expressions:\n` +
    //exprs.map(expr => FuzzContext.instance.format(expr)).join("\n") +
    //`\n-----\n`
}

function addParameters(functionScope: Scope, numOfCalcParams: number) {
    // Create integer parameters
    for (let i = 1; i <= numOfCalcParams; i++) {
        const param = new Parameter(
            functionScope,
            { kind: "stdlib", type: StdlibType.Int },
            `x${i}`,
            false,
        );
        functionScope.addNamed("parameter", param);
    }
}

function buildParameters(
    rawParams: bigint[][],
    ins: [bigint, boolean][],
): bigint[][] {
    return rawParams.map((binds) =>
        binds.map((param, index) => (ins[index]![1] ? ins[index]![0] : param)),
    );
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

type ErrorPattern =
    | {
          kind: "no_error";
      }
    | {
          kind: "error";
          regExp: RegExp;
      };

type PatternToIgnore = {
    compilationPattern: ErrorPattern;
    interpretationPattern: ErrorPattern;
};

function getDifferingIndexes(
    compilationResult: (bigint | Error)[],
    interpretationResult: (bigint | Error)[],
    errorPatternsToIgnore: PatternToIgnore[],
): number[] {
    function ignoreErrors(cE: string | bigint, iE: string | bigint): boolean {
        return errorPatternsToIgnore.some(
            ({ compilationPattern: cP, interpretationPattern: iP }) => {
                if (cP.kind === "no_error" && iP.kind === "no_error") {
                    return typeof cE === "bigint" && typeof iE === "bigint";
                } else if (cP.kind === "no_error" && iP.kind === "error") {
                    if (typeof iE === "bigint") {
                        return false;
                    }
                    return typeof cE === "bigint" && iP.regExp.test(iE);
                } else if (cP.kind === "error" && iP.kind === "no_error") {
                    if (typeof cE === "bigint") {
                        return false;
                    }
                    return cP.regExp.test(cE) && typeof iE === "bigint";
                } else if (cP.kind === "error" && iP.kind === "error") {
                    if (typeof cE === "bigint") {
                        return false;
                    }
                    if (typeof iE === "bigint") {
                        return false;
                    }
                    return cP.regExp.test(cE) && iP.regExp.test(iE);
                } else {
                    // Impossible case
                    throw new Error("Impossible case");
                }
            },
        );
    }

    if (compilationResult.length !== interpretationResult.length) {
        throw new Error(
            "Unexpected array lengths: interpreter results and compiler results should have same length",
        );
    }
    // They all have the same length

    const result: number[] = [];
    for (let i = 0; i < compilationResult.length; i++) {
        const cR = compilationResult[i];
        const iR = interpretationResult[i];
        if (typeof cR === "undefined" || typeof iR === "undefined") {
            throw new Error(`Index ${i} should exist in array`);
        }
        if (typeof cR === "bigint" && typeof iR === "bigint") {
            if (cR !== iR) {
                result.push(i);
            }
        } else if (typeof cR !== "bigint" && typeof iR !== "bigint") {
            // Both produced an error
            if (!ignoreErrors(cR.message, iR.message)) {
                result.push(i);
            }
        } else if (typeof cR !== "bigint" && typeof iR === "bigint") {
            // Compilation produced an error, but not interpretation
            if (!ignoreErrors(cR.message, iR)) {
                result.push(i);
            }
        } else if (typeof cR === "bigint" && typeof iR !== "bigint") {
            // Compilation did not produce an error, but interpretation did
            if (!ignoreErrors(cR, iR.message)) {
                result.push(i);
            }
        }
    }
    return result;
}

function buildErrorString(
    genExpr: string,
    insExpr: string,
    compilationResult: (bigint | Error)[],
    interpretationResult: (bigint | Error)[],
    differingIndexes: number[],
    bindings: bigint[][],
): string {
    const bindingsString = bindings.map(
        (binds) =>
            `${binds.map((arg, index) => `x${index + 1}: ${arg}`).join(", ")}`,
    );
    const errors = differingIndexes.map((i) => {
        return (
            `${bindingsString[i]}\n` +
            `General: ${compilationResult[i]}\n` +
            `Instantitiated: ${interpretationResult[i]}\n`
        );
    });
    const message =
        `\n------------\n` +
        `Generated general expression:\n` +
        genExpr +
        `\nInstantiated expression:\n` +
        insExpr +
        `\n\nFailing parameters:\n\n` +
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

function getIntegerGenerator(
    integerValuesToTry: bigint[],
): fc.Arbitrary<bigint> {
    return generateIntBitLength(257, true).chain((rand) =>
        fc.constantFrom(...integerValuesToTry, rand),
    );
}

function replaceIdentifiers(expr: string, ins: [bigint, boolean][]): string {
    let result = expr;
    for (let i = 0; i < ins.length; i++) {
        if (ins[i]![1]) {
            // If true, instantiate the i-th parameter with the i-th value
            result = result.replaceAll(`x${i + 1}`, ins[i]![0].toString());
        }
    }
    return result;
}

async function compileContract(
    codeString: string,
    customStdlib: CustomStdlib,
    blockchain: Blockchain,
    treasury: Treasury,
): Promise<SandboxContract<ProxyContract> | Error> {
    try {
        const contract = await compileNativeFunC(
            codeString,
            customStdlib,
            blockchain,
        );
        await contract.send(treasury, { value: toNano(1) });
        return contract;
    } catch (e) {
        if (e instanceof Error) {
            return e;
        } else {
            throw e;
        }
    }
}

async function evaluateContracts(
    genContract: SandboxContract<ProxyContract>,
    insContract: SandboxContract<ProxyContract>,
    allParams: bigint[][],
): Promise<[(bigint | Error)[], (bigint | Error)[]]> {
    const genResult: (bigint | Error)[] = [];

    for (const params of allParams) {
        try {
            genResult.push(await genContract.getCalc(params));
        } catch (e) {
            if (e instanceof Error) {
                genResult.push(e);
            } else {
                throw e;
            }
        }
    }

    const insResult: (bigint | Error)[] = [];

    for (const params of allParams) {
        try {
            insResult.push(await insContract.getCalc(params));
        } catch (e) {
            if (e instanceof Error) {
                insResult.push(e);
            } else {
                throw e;
            }
        }
    }

    return [genResult, insResult];
}

void test();
