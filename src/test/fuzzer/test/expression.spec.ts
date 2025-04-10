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
} from "@/test/fuzzer/src/util";
import { FactoryAst, getAstFactory } from "@/ast/ast-helpers";
import { getMakeAst, MakeAstFactory } from "@/ast/generated/make-factory";
import { Blockchain } from "@ton/sandbox";
import fc from "fast-check";
import { evalConstantExpression } from "@/optimizer/constEval";
import { AstUtil, getAstUtil } from "@/ast/util";
import {
    AllowedType,
    AllowedTypeEnum,
    GenContext,
    initializeGenerator,
    NonTerminal,
} from "../src/generators/uniform-expr-gen";
import { Sender, toNano } from "@ton/core";

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
            checkProperty(property);
        }
    });
});

type Binding = {
    name: string;
    type: string;
    expr: Ast.Expression;
};

function makeExpressionGetter(
    makeF: MakeAstFactory,
    getterName: string,
    bindings: Binding[],
    returnExpr: Ast.Expression,
): Ast.FunctionDef {
    return makeF.makeDummyFunctionDef(
        [makeF.makeDummyFunctionAttributeGet(undefined)],
        makeF.makeDummyId(getterName),
        makeF.makeDummyTypeId("Int"),
        [],
        bindings
            .map(
                ({ name, type, expr }): Ast.Statement =>
                    makeF.makeDummyStatementLet(
                        makeF.makeDummyId(name),
                        makeF.makeDummyTypeId(type),
                        expr,
                    ),
            )
            .concat([makeF.makeDummyStatementReturn(returnExpr)]),
    );
}

function createContractWithExpressionGetter(
    makeF: MakeAstFactory,
    contractName: string,
    getterName: string,
    bindings: Binding[],
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
    let emptyCompileContext: CompilerContext;
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
                //"Builder",
                //"String",
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
        emptyCompileContext = new CompilerContext();
        astUtil = getAstUtil(astF);
        sender = (await blockchain.treasury("treasury")).getSender();
    });

    test(
        "compiler and interpreter evaluate generated expressions equally",
        async () => {
            const contractName = "PureExpressionContract";

            const expressionGenerationIds: Map<AllowedTypeEnum, string[]> =
                new Map();
            expressionGenerationIds.set(AllowedType.Int, ["int1"]);
            expressionGenerationIds.set(AllowedType.OptInt, ["o_int1"]);
            expressionGenerationIds.set(AllowedType.Bool, ["bool1"]);
            expressionGenerationIds.set(AllowedType.OptBool, ["o_bool1"]);
            expressionGenerationIds.set(AllowedType.Cell, ["cell1"]);
            expressionGenerationIds.set(AllowedType.OptCell, ["o_cell1"]);
            expressionGenerationIds.set(AllowedType.Slice, ["slice1"]);
            expressionGenerationIds.set(AllowedType.OptSlice, ["o_slice1"]);
            expressionGenerationIds.set(AllowedType.Address, ["address1"]);
            expressionGenerationIds.set(AllowedType.OptAddress, ["o_address1"]);
            expressionGenerationIds.set(AllowedType.String, ["string1"]);
            expressionGenerationIds.set(AllowedType.OptString, ["o_string1"]);

            const expressionGenerationCtx: GenContext = {
                identifiers: expressionGenerationIds,
                contractNames: [contractName],
            };
            const generator = initializeGenerator(
                1,
                10,
                expressionGenerationCtx,
            );

            const bindingsGenretor = fc.tuple(
                ...expressionGenerationIds.entries().flatMap(([type, names]) =>
                    names.map((name) =>
                        fc.record<Binding>({
                            type: fc.constant(type),
                            name: fc.constant(name),
                            expr: generator(initializersMapping[type]),
                        }),
                    ),
                ),
            );

            const property = fc.asyncProperty(
                bindingsGenretor,
                generator(NonTerminal.Int),
                async (initExprs, expr) => {
                    const contractModule = makeF.makeModule(
                        [],
                        [
                            createContractWithExpressionGetter(
                                makeF,
                                contractName,
                                "getInt",
                                initExprs,
                                expr,
                            ),
                        ],
                    );
                    const contractMap = await buildModule(
                        astF,
                        contractModule,
                        customStdlib,
                        blockchain,
                    );
                    const contract = contractMap.get(contractName)!;
                    await contract.send(sender, { value: toNano(1) });

                    const compiledValue = await contract.getInt();

                    const intrepretedValue = evalConstantExpression(
                        expr,
                        emptyCompileContext,
                        astUtil,
                    );
                    expect(intrepretedValue.kind).toBe("number");

                    expect(compiledValue).toBe(
                        (intrepretedValue as Ast.Number).value,
                    );
                },
            );
            await checkAsyncProperty(property);
        },
        20 * 1000,
    );
});
