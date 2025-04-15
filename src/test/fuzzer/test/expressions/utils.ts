import * as Ast from "@/ast/ast";
import { getMakeAst, MakeAstFactory } from "@/ast/generated/make-factory";
import {
    AllowedType,
    AllowedTypeEnum,
    GenContext,
    initializeGenerator,
    NonTerminal,
    NonTerminalEnum,
} from "../../src/generators/uniform-expr-gen";
import { GlobalContext } from "../../src/context";
import { Interpreter } from "@/optimizer/interpreter";
import { CompilerContext } from "@/context/context";
import { AstUtil, getAstUtil } from "@/ast/util";
import { FactoryAst, getAstFactory } from "@/ast/ast-helpers";
import {
    buildModule,
    CustomStdlib,
    filterStdlib,
    parseStandardLibrary,
} from "../../src/util";
import { Blockchain } from "@ton/sandbox";
import { Sender, toNano } from "@ton/core";
import fc from "fast-check";
import * as fs from "node:fs";

export function bindingsAndExpressionPrtinter([bindings, expr]: [
    Ast.StatementLet[],
    Ast.Expression,
]) {
    return (
        `\n-----\nGenerated bindings:\n` +
        bindings.map((bind) => GlobalContext.format(bind)).join("\n") +
        `\nGenerated expression:\n` +
        GlobalContext.format(expr) +
        `\n-----\n`
    );
}

export function makeExpressionGetter(
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

export function createModuleWithExpressionGetter(
    makeF: MakeAstFactory,
    contractName: string,
    getterName: string,
    bindings: Ast.Statement[],
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
                [makeExpressionGetter(makeF, getterName, bindings, returnExpr)],
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

export async function setupEnvironment(
    interestingTestFilename: string,
): Promise<ExpressionTestingEnvironment> {
    const astF = getAstFactory();
    const makeF = getMakeAst(astF);
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
        outputStream: fs.createWriteStream(interestingTestFilename, {
            flags: "a",
        }),
    };
}

export function interpretExpression(
    { astUtil, emptyCompilerContext }: ExpressionTestingEnvironment,
    bindings: Ast.StatementLet[],
    expr: Ast.Expression,
): bigint | Error {
    try {
        const interpreter = new Interpreter(astUtil, emptyCompilerContext);
        bindings.forEach((bind) => {
            interpreter.interpretStatement(bind);
        });
        const result = interpreter.interpretExpression(expr);
        expect(result.kind).toBe("number");
        return (result as Ast.Number).value;
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
    bindings: Ast.StatementLet[],
    expr: Ast.Expression,
): Promise<bigint | Error> {
    const contractModule = createModuleWithExpressionGetter(
        makeF,
        contractNameToCompile,
        "getInt",
        bindings,
        expr,
    );

    try {
        let contractMapPromise = buildModule(
            astF,
            contractModule,
            customStdlib,
            blockchain,
        );

        const contractMap = await contractMapPromise;
        const contract = contractMap.get(contractNameToCompile)!;
        await contract.send(sender, { value: toNano(1) });
        return await contract.getInt();
    } catch (e: any) {
        return e;
    }
}

export function generateBindings(
    expressionTestingEnvironment: ExpressionTestingEnvironment,
    expressionGenerationIds: Map<AllowedTypeEnum, string[]>,
    generator: (type: NonTerminalEnum) => fc.Arbitrary<Ast.Expression>,
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

export function saveExpressionTest(
    bindings: Ast.StatementLet[],
    expr: Ast.Expression,
    compilationResult: Error,
    interpretationResult: Error,
    outputStream: fs.WriteStream,
): void {
    outputStream.write(
        bindingsAndExpressionPrtinter([bindings, expr]) +
            `\nCompilation error: ${compilationResult}\nInterpretation error: ${interpretationResult}\n`,
    );
}

const defaultGenerationIds: Map<AllowedTypeEnum, string[]> = new Map([
    [AllowedType.Int, ["int1"]],
    [AllowedType.OptInt, ["int_null"]],
    [AllowedType.Bool, ["bool1"]],
    [AllowedType.OptBool, ["bool_null"]],
    [AllowedType.Cell, ["cell1"]],
    [AllowedType.OptCell, ["opt_cell"]],
    [AllowedType.Slice, ["slice1"]],
    [AllowedType.OptSlice, ["slice_null"]],
    [AllowedType.Address, ["address1"]],
    [AllowedType.OptAddress, ["address_null"]],
    [AllowedType.String, ["string1"]],
    [AllowedType.OptString, ["string_null"]],
]);

export function createExpressionComputationEqualityProperty(
    expressionTestingEnvironment: ExpressionTestingEnvironment,
    minSize: number,
    maxSize: number,
    expressionGenerationIds: Map<
        AllowedTypeEnum,
        string[]
    > = defaultGenerationIds,
) {
    const expressionGenerationCtx: GenContext = {
        identifiers: expressionGenerationIds,
        contractNames: [expressionTestingEnvironment.contractNameToCompile],
    };

    const generator = initializeGenerator(
        minSize,
        maxSize,
        expressionGenerationCtx,
        expressionTestingEnvironment.astF,
    );

    return fc.asyncProperty(
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
}
