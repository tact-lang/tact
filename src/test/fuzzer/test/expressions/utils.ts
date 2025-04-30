import type * as Ast from "@/ast/ast";
import type { MakeAstFactory } from "@/ast/generated/make-factory";
import { Interpreter } from "@/optimizer/interpreter";
import { CompilerContext } from "@/context/context";
import type { AstUtil } from "@/ast/util";
import { getAstUtil } from "@/ast/util";
import type { FactoryAst } from "@/ast/ast-helpers";
import type { CustomStdlib } from "../../src/util";
import {
    buildModule,
    filterStdlib,
    parseStandardLibrary,
} from "../../src/util";
import { Blockchain } from "@ton/sandbox";
import type { Sender } from "@ton/core";
import { toNano } from "@ton/core";
import * as fs from "node:fs";
import { FuzzContext } from "@/test/fuzzer/src/context";
import { NonTerminal } from "@/test/fuzzer/src/uniform-expr-types";
import { expect } from "expect";
import { prettyPrint } from "@/ast/ast-printer";

export function bindingsAndExpressionPrtinter([bindings, exprs]: [
    [Ast.TypedParameter, Ast.Expression][][],
    Ast.Expression[],
]) {
    return "";
    //`\n-----\nGenerated bindings:\n` +
    //bindings.map((bind) => FuzzContext.instance.format(bind)).join("\n")
    //`\nGenerated parameter values:\n` +
    //paramValues +
    //`\nGenerated expressions:\n` +
    //exprs.map(expr => FuzzContext.instance.format(expr)).join("\n") +
    //`\n-----\n`
}

export function makeExpressionGetter(
    makeF: MakeAstFactory,
    getterName: string,
    funParameters: Ast.TypedParameter[],
    returnExpr: Ast.Expression,
): Ast.FunctionDef {
    return makeF.makeDummyFunctionDef(
        [makeF.makeDummyFunctionAttributeGet(undefined)],
        makeF.makeDummyId(getterName),
        makeF.makeDummyTypeId("Bool"),
        funParameters,
        [makeF.makeDummyStatementReturn(returnExpr)],
    );
}

export function createModuleWithExpressionGetter(
    makeF: MakeAstFactory,
    contractName: string,
    getterName: string,
    funParameters: Ast.TypedParameter[],
    returnExpr: Ast.Expression,
): Ast.Module {
    // throw new Error("createContract is not implemented yet"); // TODO: implement, probably should place this function in a different file
    return makeF.makeModule(
        [],
        [
            makeF.makeDummyContract(
                makeF.makeDummyId(contractName),
                [],
                [],
                [],
                [
                    makeExpressionGetter(
                        makeF,
                        getterName,
                        funParameters,
                        returnExpr,
                    ),
                ],
            ),
        ],
    );
}

export const initializersMapping = {
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

export type ExpressionTestingEnvironment = {
    astF: FactoryAst;
    makeF: MakeAstFactory;
    customStdlib: CustomStdlib;
    blockchain: Blockchain;
    emptyCompilerContext: CompilerContext;
    astUtil: AstUtil;
    sender: Sender;
    contractNameToCompile: string;
    outputStream: fs.WriteStream;
};

export async function setupEnvironment(): Promise<ExpressionTestingEnvironment> {
    const astF = FuzzContext.instance.astF;
    const makeF = FuzzContext.instance.makeF;
    const customStdlib = filterStdlib(
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
            "toString",
            "StringBuilder",
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
    const blockchain = await Blockchain.create();
    const astUtil = getAstUtil(astF);
    const sender = (await blockchain.treasury("treasury")).getSender();
    return {
        astF,
        makeF,
        customStdlib,
        blockchain,
        astUtil,
        sender,
        emptyCompilerContext: new CompilerContext(),
        contractNameToCompile: "ExpressionContract",
        outputStream: fs.createWriteStream("interesting-failing-tests.txt", {
            flags: "a",
        }),
    };
}

export function interpretExpression(
    { astUtil, emptyCompilerContext }: ExpressionTestingEnvironment,
    bindings: [Ast.TypedParameter, Ast.Expression][][],
    expr: Ast.Expression,
): (boolean | Error)[] | Error {
    try {
        const interpreter = new Interpreter(astUtil, emptyCompilerContext);
        // Interpret the bindings as if they were let statements
        const makeF = FuzzContext.instance.makeF;
        const resultValues: (boolean | Error)[] = [];
        for (const args of bindings) {
            const lets = args.map(([param, value]) =>
                makeF.makeDummyStatementLet(param.name, param.type, value),
            );
            lets.forEach((letStmt) => {
                interpreter.interpretStatement(letStmt);
            });
            try {
                const result = interpreter.interpretExpression(expr);
                expect(result.kind).toBe("boolean");
                resultValues.push((result as Ast.Boolean).value);
            } catch (e: any) {
                resultValues.push(e);
            }
        }
        return resultValues;
    } catch (e: any) {
        return e as Error;
    }
}

export async function compileExpression(
    {
        makeF,
        contractNameToCompile,
        astF,
        customStdlib,
        blockchain,
        sender,
    }: ExpressionTestingEnvironment,
    bindings: [Ast.TypedParameter, Ast.Expression][][],
    expr: Ast.Expression,
): Promise<(boolean | Error)[] | Error> {
    const contractModule = createModuleWithExpressionGetter(
        makeF,
        contractNameToCompile,
        "getBool",
        bindings[0]!.map(([param, _]) => param),
        expr,
    );

    try {
        const contractMapPromise = buildModule(
            astF,
            contractModule,
            customStdlib,
            blockchain,
        );

        const contractMap = await contractMapPromise;
        const contract = contractMap.get(contractNameToCompile)!;
        await contract.send(sender, { value: toNano(1) });
        const result: (boolean | Error)[] = [];
        for (const args of bindings) {
            try {
                result.push(
                    await contract.getBool(args.map(([_, val]) => val)),
                );
            } catch (e: any) {
                result.push(e);
            }
        }
        return result;
    } catch (e: any) {
        return e;
    }
}

/*
export function generateBindings(
    expressionTestingEnvironment: ExpressionTestingEnvironment,
    expressionGenerationIds: Map<AllowedTypeEnum, string[]>,
    generator: (nonTerminalId: NonTerminalEnum) => fc.Arbitrary<Ast.Expression>,
): fc.Arbitrary<Ast.StatementLet[]> {
    return fc.tuple(
        ...expressionGenerationIds
            .entries()
            .flatMap(([type, names]) =>
                names.map((name) =>
                    type.slice(-1) === "?"
                        ? fc.constant(
                              expressionTestingEnvironment.makeF.makeDummyStatementLet(
                                  expressionTestingEnvironment.makeF.makeDummyId(
                                      name,
                                  ),
                                  expressionTestingEnvironment.makeF.makeDummyOptionalType(
                                      expressionTestingEnvironment.makeF.makeDummyTypeId(
                                          type.slice(0, -1),
                                      ),
                                  ),
                                  expressionTestingEnvironment.makeF.makeDummyNull(),
                              ),
                          )
                        : generator(initializersMapping[type]).map((expr) =>
                              expressionTestingEnvironment.makeF.makeDummyStatementLet(
                                  expressionTestingEnvironment.makeF.makeDummyId(
                                      name,
                                  ),
                                  expressionTestingEnvironment.makeF.makeDummyTypeId(
                                      type,
                                  ),
                                  expr,
                              ),
                          ),
                ),
            ),
    );
}
*/

export function saveExpressionTest(
    bindings: [Ast.TypedParameter, Ast.Expression][][],
    expr: Ast.Expression[],
    compilationResult: Error,
    interpretationResult: Error,
    outputStream: fs.WriteStream,
): void {
    outputStream.write(
        bindingsAndExpressionPrtinter([bindings, expr]) +
            `\nCompilation error: ${compilationResult}\nInterpretation error: ${interpretationResult}\n`,
    );
}
