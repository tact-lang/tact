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
import { Blockchain, SandboxContract } from "@ton/sandbox";
import fc from "fast-check";
import { evalConstantExpression } from "@/optimizer/constEval";
import { AstUtil, getAstUtil } from "@/ast/util";

function emptyContext(): StatementContext {
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
    const sctx = emptyContext();
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

function getExprGenerator(): fc.Arbitrary<Ast.Expression> { // TODO: replace this function with the actual one when it is ready
    throw new Error("getExprGenerator is not implemented yet");
}

function createContractWithExpressionGetter(
    makeF: MakeAstFactory,
    contractName: string,
    expr: Ast.Expression,
): Ast.Contract {
    throw new Error("createContract is not implemented yet"); // TODO: implement, probably should place this function in a different file
    // makeF.makeContract(contractName, [], [], [], )
}

describe("evaluation properties", () => {
    let astF: FactoryAst;
    let makeF: MakeAstFactory;
    let customStdlib: CustomStdlib;
    let blockchain: Blockchain;
    let emptyCompileContext: CompilerContext;
    let astUtil: AstUtil;

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
    });

    test("compiler and interpreter evaluate pure generated expressions equally", async () => {
        const contractName = "pureExpressionContract";
        const property = fc.asyncProperty(getExprGenerator(), async (expr) => {
            const contractModule = makeF.makeModule(
                [],
                [createContractWithExpressionGetter(makeF, contractName, expr)],
            );
            const contractMap = await buildModule(
                astF,
                contractModule,
                customStdlib,
                blockchain,
            );
            const contract = contractMap.get(contractName)!;
            const compiledValue = await contract.getInt();

            const intrepretedValue = evalConstantExpression(
                expr,
                emptyCompileContext,
                astUtil,
            );
            expect(intrepretedValue.kind).toBe("number");

            expect(compiledValue).toBe((intrepretedValue as Ast.Number).value);
        });
        await checkAsyncProperty(property);
    });
});
