import { CompilerContext } from "@/context/context";
import { resolveExpression, getExpType } from "@/types/resolveExpression";
import type { StatementContext } from "@/types/resolveStatements";
import type { TypeRef } from "@/types/types";
import assert from "assert";
import * as Ast from "@/ast/ast";

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
    filterStdlib,
    parseStandardLibrary,
    CustomStdlib,
    checkAsyncProperty,
    buildModule,
    astNodeCounterexamplePrinter,
} from "@/test/fuzzer/src/util";
import { FactoryAst, getAstFactory } from "@/ast/ast-helpers";
import { getMakeAst, MakeAstFactory } from "@/ast/generated/make-factory";
import { Blockchain } from "@ton/sandbox";
import fc from "fast-check";
import { AstUtil, getAstUtil } from "@/ast/util";
import {
    AllowedType,
    AllowedTypeEnum,
    GenContext,
    initializeGenerator,
    NonTerminal,
} from "../src/generators/uniform-expr-gen";
import { Sender, toNano } from "@ton/core";
import { GlobalContext } from "../src/context";
import { Interpreter } from "@/optimizer/interpreter";

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

function makeExpressionGetter(
    makeF: MakeAstFactory,
    getterName: string,
    bindings: Ast.Statement[],
    returnExpr: Ast.Expression,
): Ast.FunctionDef {
    return makeF.makeDummyFunctionDef(
        [makeF.makeDummyFunctionAttributeGet(undefined)],
        makeF.makeDummyId(getterName),
        makeF.makeDummyTypeId("Int"),
        [],
        bindings.concat([makeF.makeDummyStatementReturn(returnExpr)]),
    );
}

function createContractWithExpressionGetter(
    makeF: MakeAstFactory,
    contractName: string,
    getterName: string,
    bindings: Ast.Statement[],
    returnExpr: Ast.Expression,
): Ast.Contract {
    // throw new Error("createContract is not implemented yet"); // TODO: implement, probably should place this function in a different file
    return makeF.makeDummyContract(
        makeF.makeDummyId(contractName),
        [],
        [],
        [],
        [makeExpressionGetter(makeF, getterName, bindings, returnExpr)],
    );
}

const initializersMapping = {
    Int: NonTerminal.LiteralInt,
    "Int?": NonTerminal.LiteralInt,
    Bool: NonTerminal.LiteralBool,
    "Bool?": NonTerminal.LiteralBool,
    Cell: NonTerminal.LiteralCell,
    "Cell?": NonTerminal.LiteralCell,
    Address: NonTerminal.LiteralAddress,
    "Address?": NonTerminal.LiteralAddress,
    Slice: NonTerminal.LiteralSlice,
    "Slice?": NonTerminal.LiteralSlice,
    String: NonTerminal.LiteralString,
    "String?": NonTerminal.LiteralString,
} as const;

describe("evaluation properties", () => {
    let astF: FactoryAst;
    let makeF: MakeAstFactory;
    let customStdlib: CustomStdlib;
    let blockchain: Blockchain;
    const emptyCompilerContext: CompilerContext = new CompilerContext();
    let astUtil: AstUtil;
    let sender: Sender;

    beforeAll(async () => {
        astF = getAstFactory();
        makeF = getMakeAst(astF);
        customStdlib = filterStdlib(
            parseStandardLibrary(astF),
            makeF,
            new Set([
                "Int",
                "Bool",
                "Address",
                "Cell",
                "Context",
                "Slice",
                "Slice?",
                "String",
                "String?",
                "StateInit",
                "SendParameters",
                "BaseTrait",
                "SendDefaultMode",
                "SendRemainingValue",
                "SendIgnoreErrors",
                "SendRemainingBalance",
                "ReserveExact",
                "sender",
                "context",
                "myBalance",
                "nativeReserve",
                //"contractAddress",
                //"contractAddressExt",
                //"storeUint",
                //"storeInt",
                //"contractHash",
                //"newAddress",
                //"beginCell",
                //"endCell",
                "send",
                //"asSlice",
                //"asAddressUnsafe",
                //"beginParse",
            ]),
        );
        blockchain = await Blockchain.create();
        astUtil = getAstUtil(astF);
        sender = (await blockchain.treasury("treasury")).getSender();
    });

    test(
        "compiler and interpreter evaluate generated expressions equally",
        async () => {
            const contractName = "ExpressionContract";

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
                contractNames: [contractName],
            };
            const generator = initializeGenerator(
                1,
                10,
                astF,
                expressionGenerationCtx,
            );

            const bindingsGenretor = fc.tuple(
                ...expressionGenerationIds
                    .entries()
                    .flatMap(([type, names]) =>
                        names.map((name) =>
                            type.slice(-1) === "?"
                                ? fc.constant(
                                      makeF.makeDummyStatementLet(
                                          makeF.makeDummyId(name),
                                          makeF.makeDummyOptionalType(
                                              makeF.makeDummyTypeId(
                                                  type.slice(0, -1),
                                              ),
                                          ),
                                          makeF.makeDummyNull(),
                                      ),
                                  )
                                : generator(initializersMapping[type]).map(
                                      (expr) =>
                                          makeF.makeDummyStatementLet(
                                              makeF.makeDummyId(name),
                                              makeF.makeDummyTypeId(type),
                                              expr,
                                          ),
                                  ),
                        ),
                    ),
            );

            const property = fc.asyncProperty(
                bindingsGenretor,
                generator(NonTerminal.Int),
                async (bindings, expr) => {
                    const contractModule = makeF.makeModule(
                        [],
                        [
                            createContractWithExpressionGetter(
                                makeF,
                                contractName,
                                "getInt",
                                bindings,
                                expr,
                            ),
                        ],
                    );

                    let compiledValue: bigint | undefined;
                    let compilationError: Error | undefined;
                    try {
                        let contractMapPromise = buildModule(
                            astF,
                            contractModule,
                            customStdlib,
                            blockchain,
                        );

                        const contractMap = await contractMapPromise;
                        const contract = contractMap.get(contractName)!;
                        await contract.send(sender, { value: toNano(1) });
                        compiledValue = await contract.getInt();
                    } catch (e: any) {
                        compilationError = e;
                    }

                    let interpretedValue: bigint | undefined;
                    let interpretationError: Error | undefined;
                    try {
                        const interpreter = new Interpreter(
                            astUtil,
                            emptyCompilerContext,
                        );
                        bindings.forEach((bind) => {
                            interpreter.interpretStatement(bind);
                        });
                        const result = interpreter.interpretExpression(expr);
                        expect(result.kind).toBe("number");
                        interpretedValue = (result as Ast.Number).value;
                    } catch (e: any) {
                        interpretationError = e;
                    }

                    if (
                        (compilationError && !interpretationError) ||
                        (!compilationError && interpretationError)
                    ) {
                        expect(compilationError).toEqual(interpretationError);
                    } else if (compilationError && interpretationError) {
                        
                    }
                    expect(compiledValue).toBe(interpretedValue);
                },
            );
            await checkAsyncProperty(property, ([bindings, expr]) => {
                return (
                    `\n-----\nGenerated bindings:\n` +
                    bindings
                        .map((bind) => GlobalContext.format(bind))
                        .join("\n") +
                    `\nGenerated expression:\n` +
                    GlobalContext.format(expr) +
                    `\n-----\n`
                );
            });
        },
        60 * 1000, // 1 minute
    );
});
