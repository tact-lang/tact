import path from "path";
import type * as A from "../../ast/ast";
import { getAstFactory, idText } from "../../ast/ast-helpers";
import type { FactoryAst } from "../../ast/ast-helpers";
import { prettyPrint } from "../../ast/ast-printer";
import { getParser } from "../../grammar";
import * as fs from "fs";
import fc from "fast-check";
import {
    buildModule,
    filterGlobalDeclarations,
    loadCustomStdlibFc,
    parseStandardLibrary,
    ProxyContract,
} from "./util";
import type { CustomStdlib } from "./util";
import { getSrcInfo } from "../../grammar/src-info";
import { Blockchain } from "@ton/sandbox";
import type { BlockchainTransaction } from "@ton/sandbox";
import type { CommonMessageInfoInternal, Message, StateInit } from "@ton/core";
import { Cell, beginCell, toNano } from "@ton/core";
import { findTransaction } from "@ton/test-utils";

type ItemWithDeclarations<T> = {
    item: T;
    declarations: Declarations;
    featuresTrace: GeneratorFeatureType[];
};

type Declarations = {
    globalDeclarations: Map<string, A.AstModuleItem>;
    contractDeclarations: Map<string, A.AstContractDeclaration>;
};

type ExpressionWrapper = {
    name: string;
    expression: A.AstExpression;
};

type StatementsWrapper = {
    name: string;
    statements: A.AstStatement[];
    assignedStateInit: boolean;
};

type Test = {
    module: A.AstModule;
    contractNames: string[];
};

const GeneratorFeature = {
    LET_STATEMENT: "LET",
    EXPRESSION_STATEMENT: "EXPRESSION",
    IF_NO_ELSE_STATEMENT: "IF_NO_ELSE",
    IF_THEN_STATEMENT: "IF_THEN",
    IF_ELSE_STATEMENT: "IF_ELSE",
    WHILE_STATEMENT: "WHILE",
    UNTIL_STATEMENT: "UNTIL",
    REPEAT_STATEMENT: "REPEAT",
    DESTRUCT_STATEMENT: "DESTRUCT",
    BLOCK_STATEMENT: "BLOCK",
    TRY_STATEMENT: "TRY",
    CATCH_STATEMENT: "CATCH",

    STATIC_CALL_EXPRESSION: "STATIC_CALL",
    INIT_OF_EXPRESSION: "INIT_OF",

    CONTRACT_WITH_INIT: "CONTRACT_WITH_INIT",
} as const;

type GeneratorFeatureType =
    (typeof GeneratorFeature)[keyof typeof GeneratorFeature];

type GeneratorDescriptor<T> = {
    feature: GeneratorFeatureType;
    generator: fc.Arbitrary<T>;
};

function getGeneratorFactory(
    astF: FactoryAst,
    allowedFeatures: Set<GeneratorFeatureType>,
    maxFunCallDepth: number,
): {
    generator: fc.Arbitrary<ItemWithDeclarations<A.AstContract>>;
    batchBuilder: (
        items: ItemWithDeclarations<A.AstContract>[],
        extraModule: A.AstModule,
        compilationBatchSize: number,
    ) => Test[];
} {
    let idCounter = 0;
    const emptySrcInfo = getSrcInfo(" ", 0, 0, null, "user");

    function makeInitOf(
        contract: A.AstId,
        args: A.AstExpression[],
    ): A.AstInitOf {
        return astF.createNode({
            kind: "init_of",
            args,
            contract,
            loc: emptySrcInfo,
        }) as A.AstInitOf;
    }

    function makeId(name: string): A.AstId {
        return astF.createNode({
            kind: "id",
            text: name,
            loc: emptySrcInfo,
        }) as A.AstId;
    }

    function makeTypeId(name: string): A.AstTypeId {
        return astF.createNode({
            kind: "type_id",
            text: name,
            loc: emptySrcInfo,
        }) as A.AstTypeId;
    }

    function makeTypedParameter(
        name: string,
        type: string,
    ): A.AstTypedParameter {
        return astF.createNode({
            kind: "typed_parameter",
            name: makeId(name),
            type: makeTypeId(type),
            loc: emptySrcInfo,
        }) as A.AstTypedParameter;
    }

    /*
    function makeFunctionAttribute(
        name: A.AstFunctionAttributeName,
    ): A.AstFunctionAttribute {
        return astF.createNode({
            kind: "function_attribute",
            type: name,
            loc: emptySrcInfo,
        }) as A.AstFunctionAttribute;
    }

    function makeBoolean(value: boolean): A.AstBoolean {
        return astF.createNode({
            kind: "boolean",
            value,
            loc: emptySrcInfo,
        }) as A.AstBoolean;
    }
    */

    function makeString(value: string): A.AstString {
        return astF.createNode({
            kind: "string",
            value,
            loc: emptySrcInfo,
        }) as A.AstString;
    }

    function makeInt(value: bigint): A.AstNumber {
        return astF.createNode({
            kind: "number",
            value,
            base: 10,
            loc: emptySrcInfo,
        }) as A.AstNumber;
    }

    /*
    function makeNull(): A.AstNull {
        return astF.createNode({
            kind: "null",
            loc: emptySrcInfo,
        }) as A.AstNull;
    }

    function makeFreshFieldName(): A.AstId {
        const newName = `field_${idCounter++}`;
        return makeId(newName);
    }
    */

    function makeFreshFunctionName(): A.AstId {
        const newName = `fun_${idCounter++}`;
        return makeId(newName);
    }

    /*
    function makeFreshConstantName(): A.AstId {
        const newName = `CONS_${idCounter++}`;
        return makeId(newName);
    }
    */

    function makeFreshVarName(): A.AstId {
        const newName = `v_${idCounter++}`;
        return makeId(newName);
    }

    function makeBinaryExpression(
        op: A.AstBinaryOperation,
        operand1: A.AstExpression,
        operand2: A.AstExpression,
    ): A.AstOpBinary {
        return astF.createNode({
            kind: "op_binary",
            op,
            left: operand1,
            right: operand2,
            loc: emptySrcInfo,
        }) as A.AstOpBinary;
    }

    /*
    function makeConditional(
        boolValue: boolean,
        exprT: A.AstExpression,
        exprF: A.AstExpression,
    ): A.AstConditional {
        return astF.createNode({
            kind: "conditional",
            condition: makeBoolean(boolValue),
            thenBranch: exprT,
            elseBranch: exprF,
            loc: emptySrcInfo,
        }) as A.AstConditional;
    }

    function makeMethodCall(
        name: A.AstId,
        self: A.AstExpression,
        args: A.AstExpression[],
    ): A.AstMethodCall {
        return astF.createNode({
            kind: "method_call",
            self,
            args,
            method: name,
            loc: emptySrcInfo,
        }) as A.AstMethodCall;
    }
    */

    function makeStaticCall(
        name: A.AstId,
        args: A.AstExpression[],
    ): A.AstStaticCall {
        return astF.createNode({
            kind: "static_call",
            args,
            function: name,
            loc: emptySrcInfo,
        }) as A.AstStaticCall;
    }

    function makeStructInstance(
        type: A.AstId,
        args: A.AstStructFieldInitializer[],
    ): A.AstStructInstance {
        return astF.createNode({
            kind: "struct_instance",
            type,
            args,
            loc: emptySrcInfo,
        }) as A.AstStructInstance;
    }

    /*
    function generateContractConstant(type: A.AstTypeId, expr: A.AstExpression): { constant: A.AstId, decl: A.AstConstantDef } {
        const name = generateFreshConstantName();
        const decl = astF.createNode({ kind: "constant_def", name, type, initializer: expr, attributes: [], loc: emptySrcInfo }) as A.AstConstantDef;
        return { constant: name, decl };
    }
    
    function generateContractField(type: A.AstTypeId, expr: A.AstExpression): { field: A.AstId, decl: A.AstFieldDecl } {
        const name = generateFreshFieldName();
        const decl = astF.createNode({ kind: "field_decl", name, type, as: null, initializer: expr, loc: emptySrcInfo }) as A.AstFieldDecl;
        return { field: name, decl };
    }
    */

    function makeLetStatement(
        name: A.AstId,
        type: A.AstTypeId,
        expr: A.AstExpression,
    ): A.AstStatementLet {
        return astF.createNode({
            kind: "statement_let",
            name,
            type,
            expression: expr,
            loc: emptySrcInfo,
        }) as A.AstStatementLet;
    }

    function makeAssignStatement(
        name: A.AstId,
        expr: A.AstExpression,
    ): A.AstStatementAssign {
        return astF.createNode({
            kind: "statement_assign",
            path: name,
            expression: expr,
            loc: emptySrcInfo,
        }) as A.AstStatementAssign;
    }

    function makeStructFieldInitializer(
        name: A.AstId,
        initializer: A.AstExpression,
    ): A.AstStructFieldInitializer {
        return astF.createNode({
            kind: "struct_field_initializer",
            field: name,
            initializer,
            loc: emptySrcInfo,
        }) as A.AstStructFieldInitializer;
    }

    /*
    function makeFieldAccess(
        aggregate: A.AstExpression,
        field: A.AstId,
    ): A.AstFieldAccess {
        return astF.createNode({
            kind: "field_access",
            aggregate,
            field,
            loc: emptySrcInfo,
        }) as A.AstFieldAccess;
    }
    */

    function makeExpressionStatement(
        expr: A.AstExpression,
    ): A.AstStatementExpression {
        return astF.createNode({
            kind: "statement_expression",
            expression: expr,
            loc: emptySrcInfo,
        }) as A.AstStatementExpression;
    }

    function makeConditionStatement(
        cond: A.AstExpression,
        thenBranch: A.AstStatement[],
        elseBranch: A.AstStatement[] | undefined,
    ): A.AstStatementCondition {
        return astF.createNode({
            kind: "statement_condition",
            condition: cond,
            trueStatements: thenBranch,
            falseStatements: elseBranch,
            loc: emptySrcInfo,
        }) as A.AstStatementCondition;
    }

    function makeWhileStatement(
        cond: A.AstExpression,
        body: A.AstStatement[],
    ): A.AstStatementWhile {
        return astF.createNode({
            kind: "statement_while",
            condition: cond,
            statements: body,
            loc: emptySrcInfo,
        }) as A.AstStatementWhile;
    }

    function makeUntilStatement(
        cond: A.AstExpression,
        body: A.AstStatement[],
    ): A.AstStatementUntil {
        return astF.createNode({
            kind: "statement_until",
            condition: cond,
            statements: body,
            loc: emptySrcInfo,
        }) as A.AstStatementUntil;
    }

    function makeRepeatStatement(
        count: A.AstExpression,
        body: A.AstStatement[],
    ): A.AstStatementRepeat {
        return astF.createNode({
            kind: "statement_repeat",
            iterations: count,
            statements: body,
            loc: emptySrcInfo,
        }) as A.AstStatementRepeat;
    }

    /*
    function makeForEachStatement(
        mapVar: A.AstExpression,
        keyVar: A.AstId,
        valueVar: A.AstId,
        body: A.AstStatement[],
    ): A.AstStatementForEach {
        return astF.createNode({
            kind: "statement_foreach",
            map: mapVar,
            keyName: keyVar,
            valueName: valueVar,
            statements: body,
            loc: emptySrcInfo,
        }) as A.AstStatementForEach;
    }
    */

    function makeDestructStatement(
        expr: A.AstExpression,
        identifiers: Map<string, [A.AstId, A.AstId]>,
        type: A.AstTypeId,
    ): A.AstStatementDestruct {
        return astF.createNode({
            kind: "statement_destruct",
            expression: expr,
            identifiers,
            ignoreUnspecifiedFields: false,
            type,
            loc: emptySrcInfo,
        }) as A.AstStatementDestruct;
    }

    function makeBlockStatement(body: A.AstStatement[]): A.AstStatementBlock {
        return astF.createNode({
            kind: "statement_block",
            statements: body,
            loc: emptySrcInfo,
        }) as A.AstStatementBlock;
    }

    function makeTryStatement(
        catchName: A.AstId,
        tryBody: A.AstStatement[],
        catchBody: A.AstStatement[] | undefined,
    ): A.AstStatementTry {
        const catchBlock =
            typeof catchBody !== "undefined"
                ? makeCatchBlock(catchName, catchBody)
                : undefined;
        return astF.createNode({
            kind: "statement_try",
            statements: tryBody,
            catchBlock,
            loc: emptySrcInfo,
        }) as A.AstStatementTry;
    }

    function makeCatchBlock(
        catchName: A.AstId,
        body: A.AstStatement[],
    ): A.AstCatchBlock {
        return { catchName, catchStatements: body };
    }

    function makeFunctionDefinition(
        name: A.AstId,
        params: A.AstTypedParameter[],
        statements: A.AstStatement[],
        attributes: A.AstFunctionAttribute[],
        ret: A.AstTypeId,
    ): A.AstFunctionDef {
        return astF.createNode({
            kind: "function_def",
            name,
            params,
            statements,
            attributes,
            return: ret,
            loc: emptySrcInfo,
        }) as A.AstFunctionDef;
    }

    function makeReturnStatement(
        expression: A.AstExpression,
    ): A.AstStatementReturn {
        return astF.createNode({
            kind: "statement_return",
            expression,
            loc: emptySrcInfo,
        }) as A.AstStatementReturn;
    }

    function makeContractInit(stmts: A.AstStatement[]): A.AstContractInit {
        const addrExpr = makeStaticCall(makeId("contractAddress"), [
            makeId("stateInit"),
        ]);
        const addrVar = makeId("addr");
        const addrLet = makeLetStatement(
            addrVar,
            makeTypeId("Address"),
            addrExpr,
        );
        const tonExpr = makeStaticCall(makeId("ton"), [makeString("1")]);
        const sendParams = makeStructInstance(makeId("SendParameters"), [
            makeStructFieldInitializer(makeId("to"), addrVar),
            makeStructFieldInitializer(makeId("value"), tonExpr),
        ]);
        const sendExpr = makeStaticCall(makeId("send"), [sendParams]);
        const sendStmt = makeExpressionStatement(sendExpr);
        return astF.createNode({
            kind: "contract_init",
            params: [makeTypedParameter("arg", "Int")],
            statements: [...stmts, addrLet, sendStmt],
            loc: emptySrcInfo,
        }) as A.AstContractInit;
    }

    /*
    function makeContractInitNoSend(
        stmts: A.AstStatement[],
    ): A.AstContractInit {
        return astF.createNode({
            kind: "contract_init",
            params: [makeTypedParameter("arg", "Int")],
            statements: stmts,
            loc: emptySrcInfo,
        }) as A.AstContractInit;
    }
    */

    function makeEmptyInternalReceiver(): A.AstReceiver {
        const receiverKind = astF.createNode({
            kind: "fallback",
        }) as A.AstReceiverFallback;
        const internalSelector = astF.createNode({
            kind: "internal",
            subKind: receiverKind,
            loc: emptySrcInfo,
        }) as A.AstReceiverInternal;
        return astF.createNode({
            kind: "receiver",
            selector: internalSelector,
            statements: [],
            loc: emptySrcInfo,
        }) as A.AstReceiver;
    }

    function makeContract(
        name: A.AstId,
        stmts: A.AstStatement[],
        decls: A.AstContractDeclaration[],
    ): A.AstContract {
        const init = makeContractInit(stmts);
        const receiver = makeEmptyInternalReceiver();
        const finalDecls = [...decls, init, receiver];
        return astF.createNode({
            kind: "contract",
            name,
            traits: [],
            attributes: [],
            params: undefined,
            declarations: finalDecls,
            loc: emptySrcInfo,
        }) as A.AstContract;
    }

    /*
    function makeContractNoSend(
        name: A.AstId,
        stmts: A.AstStatement[],
        decls: A.AstContractDeclaration[],
    ): A.AstContract {
        const init = makeContractInitNoSend(stmts);
        const receiver = makeEmptyInternalReceiver();
        const finalDecls = [...decls, init, receiver];
        return astF.createNode({
            kind: "contract",
            name,
            traits: [],
            attributes: [],
            params: undefined,
            declarations: finalDecls,
            loc: emptySrcInfo,
        }) as A.AstContract;
    }
    */

    function withEmptyDeclarations<T>(
        item: T,
        featuresTrace: GeneratorFeatureType[],
    ): ItemWithDeclarations<T> {
        return {
            item: item,
            declarations: {
                globalDeclarations: new Map(),
                contractDeclarations: new Map(),
            },
            featuresTrace,
        };
    }

    function withDeclarations<T>(
        item: T,
        declarations: Declarations,
        featuresTrace: GeneratorFeatureType[],
    ): ItemWithDeclarations<T> {
        return {
            item,
            declarations,
            featuresTrace,
        };
    }

    /*
    function chainGenerators<T>(
        gens: fc.Arbitrary<readonly T[]>[],
    ): fc.Arbitrary<T[]> {
        return chainGeneratorsAux([], gens);
    }

    function chainGeneratorsAux<T>(
        accumulator: T[],
        gens: fc.Arbitrary<readonly T[]>[],
    ): fc.Arbitrary<T[]> {
        if (gens.length === 0) {
            return fc.constant(accumulator);
        }
        // First element is ensured to exist
        const gen = gens[0]!;
        return gen.chain((currData) => {
            return chainGeneratorsAux(
                [...accumulator, ...currData],
                gens.slice(1),
            );
        });
    }*/

    /*
    function contractConstantGenerator(baseExpr: A.AstExpression): GeneratorWithDeclarations<ExpressionWithName> {
        return {
            generate: () => {
                const globalDecl = generateContractConstant(generateTypeId("StateInit"), baseExpr);
                const name = "ContractConstant";
                const finalDecls: Map<string, A.AstContractDeclaration> = new Map();
                finalDecls.set(idText(globalDecl.constant), globalDecl.decl);
                return { globalDeclarations: new Map(), contractDeclarations: finalDecls, items: [{name, expression: generateFieldAccess(generateId("self"), globalDecl.constant)}] };
            }
        };
    }

    function contractFieldGenerator(baseExpr: A.AstExpression): GeneratorWithDeclarations<ExpressionWithName> {
        return { generate: () => {
        const globalDecl = generateContractField(generateTypeId("StateInit"), baseExpr);
        const name = "ContractField";
        const finalDecls: Map<string, A.AstContractDeclaration> = new Map();
        finalDecls.set(idText(globalDecl.field), globalDecl.decl);
        return { globalDeclarations: new Map(), contractDeclarations: finalDecls, items: [{name, expression: generateFieldAccess(generateId("self"), globalDecl.field) }]};
        }};
    }*/

    function initOfGenerator(): GeneratorDescriptor<
        ItemWithDeclarations<ExpressionWrapper>
    > {
        const generator = fc.constant(
            withEmptyDeclarations(
                {
                    name: "InitOf",
                    expression: makeInitOf(makeId("Deployer"), []),
                },
                [GeneratorFeature.INIT_OF_EXPRESSION],
            ),
        );

        return {
            feature: GeneratorFeature.INIT_OF_EXPRESSION,
            generator,
        };
    }

    function staticCallGenerator(
        currentFunCallDepth: number,
        desiredFunCallDepth: number,
    ): GeneratorDescriptor<ItemWithDeclarations<ExpressionWrapper>> {
        const buildGenerator = (
            returnStmt: A.AstStatementReturn,
            genStmt: ItemWithDeclarations<StatementsWrapper>,
        ) => {
            const finalGlobalDecls: Map<string, A.AstModuleItem> = new Map(
                genStmt.declarations.globalDeclarations,
            );

            const funName = makeFreshFunctionName();
            const funDef = makeFunctionDefinition(
                funName,
                [makeTypedParameter("arg", "Int")],
                [...genStmt.item.statements, returnStmt],
                [],
                makeTypeId("StateInit"),
            );
            const call = makeStaticCall(funName, [makeId("arg")]);
            const testName = `StaticCall_${genStmt.item.name}`;
            finalGlobalDecls.set(idText(funName), funDef);
            return fc.constant(
                withDeclarations(
                    { name: testName, expression: call },
                    {
                        globalDeclarations: finalGlobalDecls,
                        contractDeclarations: new Map(),
                    },
                    [
                        ...genStmt.featuresTrace,
                        GeneratorFeature.STATIC_CALL_EXPRESSION,
                    ],
                ),
            );
        };

        const generator = statementGenerator(
            currentFunCallDepth + 1,
            desiredFunCallDepth,
        ).chain((genStmt) => {
            if (!genStmt.item.assignedStateInit) {
                // If the statement did not assign the stateInit variable,
                // then if we use the statement as such, it would
                // result in an invalid function. In this case, default into using
                // "return initOf Deployer()"
                return initOfGenerator().generator.chain((initOfExpr) =>
                    buildGenerator(
                        makeReturnStatement(initOfExpr.item.expression),
                        genStmt,
                    ),
                );
            }

            // The statement assigned the stateInit variable, just return it
            return buildGenerator(
                makeReturnStatement(makeId("stateInit")),
                genStmt,
            );
        });

        return {
            feature: GeneratorFeature.STATIC_CALL_EXPRESSION,
            generator,
        };
    }

    /*
    function methodCallGenerator(): GeneratorWithDeclarations<ExpressionWithName> {
        return {
            generate: () => {
                const finalGlobalDecls: Map<string, A.AstModuleItem> =
                    new Map();
                const finalItems: ExpressionWithName[] = [];

                // If we reached the max function call depth, then do not call the generators
                // just generate a return statement with the initOf
                if (currentFunDepth >= maxFunCallDepth) {
                    const funName = generateFreshFunctionName();
                    const returnStmt = generateReturnStatement(
                        generateInitOf(generateId("Deployer"), []),
                    );
                    const funDef = generateFunctionDefinition(
                        funName,
                        [generateTypedParameter("self", "Int")],
                        [returnStmt],
                        [generateFunctionAttribute("extends")],
                        generateTypeId("StateInit"),
                    );
                    const call = generateMethodCall(
                        funName,
                        generateId("arg"),
                        [],
                    );
                    const testName = `StaticMethodCall`;
                    finalGlobalDecls.set(idText(funName), funDef);
                    finalItems.push({ name: testName, expression: call });
                    return {
                        globalDeclarations: finalGlobalDecls,
                        contractDeclarations: new Map(),
                        items: finalItems,
                    };
                }

                // Increase the fun call depth
                currentFunDepth++;

                const stmtGenResult = statementGenerator().generate();
                stmtGenResult.globalDeclarations.forEach((value, key) => {
                    finalGlobalDecls.set(key, value);
                });

                for (const stmtWithDecls of stmtGenResult.items) {
                    // We can only create a test that generated an assignment to stateInit (because we need to return it)
                    if (stmtWithDecls.assignedStateInit) {
                        const funName = generateFreshFunctionName();
                        const returnStmt = generateReturnStatement(
                            generateId("stateInit"),
                        );
                        const funDef = generateFunctionDefinition(
                            funName,
                            [generateTypedParameter("self", "Int")],
                            [returnStmt],
                            [generateFunctionAttribute("extends")],
                            generateTypeId("StateInit"),
                        );
                        const call = generateMethodCall(
                            funName,
                            generateId("arg"),
                            [],
                        );
                        const testName = `StaticMethodCall_${stmtWithDecls.name}`;
                        finalGlobalDecls.set(idText(funName), funDef);
                        finalItems.push({ name: testName, expression: call });
                    }
                }

                // decrease the fun call depth
                currentFunDepth--;

                return {
                    globalDeclarations: finalGlobalDecls,
                    contractDeclarations: new Map(),
                    items: finalItems,
                };
            },
        };
    }
    */

    function letStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const varName = makeId("stateInit");
        const varType = makeTypeId("StateInit");
        const stmtLet = makeLetStatement(
            varName,
            varType,
            baseExpr.item.expression,
        );
        const newName = `Let_${baseExpr.item.name}`;

        const generator = fc.constant(
            withDeclarations(
                {
                    name: newName,
                    statements: [stmtLet],
                    assignedStateInit: true,
                },
                baseExpr.declarations,
                [...baseExpr.featuresTrace, GeneratorFeature.LET_STATEMENT],
            ),
        );

        return {
            feature: GeneratorFeature.LET_STATEMENT,
            generator,
        };
    }

    function expressionStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const stmtExpr = makeExpressionStatement(baseExpr.item.expression);
        const newName = `Expr_${baseExpr.item.name}`;
        const generator = fc.constant(
            withDeclarations(
                {
                    name: newName,
                    statements: [stmtExpr],
                    assignedStateInit: false,
                },
                baseExpr.declarations,
                [
                    ...baseExpr.featuresTrace,
                    GeneratorFeature.EXPRESSION_STATEMENT,
                ],
            ),
        );

        return {
            feature: GeneratorFeature.EXPRESSION_STATEMENT,
            generator,
        };
    }

    function ifNoElseStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );
        const condExpr = makeBinaryExpression(
            "==",
            makeBinaryExpression("-", makeId("arg"), makeId("arg")),
            makeInt(0n),
        );
        const thenStmt = makeAssignStatement(
            makeId("stateInit"),
            baseExpr.item.expression,
        );
        const stmt = makeConditionStatement(condExpr, [thenStmt], undefined);

        const newName = `IfNoElse_${baseExpr.item.name}`;

        const generator = fc.constant(
            withDeclarations(
                {
                    name: newName,
                    statements: [initVarStmt, stmt],
                    assignedStateInit: true,
                },
                baseExpr.declarations,
                [
                    ...baseExpr.featuresTrace,
                    GeneratorFeature.IF_NO_ELSE_STATEMENT,
                ],
            ),
        );

        return {
            feature: GeneratorFeature.IF_NO_ELSE_STATEMENT,
            generator,
        };
    }

    function ifThenStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );
        const condExpr = makeBinaryExpression(
            "==",
            makeBinaryExpression("-", makeId("arg"), makeId("arg")),
            makeInt(0n),
        );

        const thenStmt = makeAssignStatement(
            makeId("stateInit"),
            baseExpr.item.expression,
        );
        const elseStmt = makeAssignStatement(
            makeId("stateInit"),
            makeInitOf(makeId("Dummy2"), []),
        );
        const stmt = makeConditionStatement(condExpr, [thenStmt], [elseStmt]);

        const newName = `IfThen_${baseExpr.item.name}`;

        const generator = fc.constant(
            withDeclarations(
                {
                    name: newName,
                    statements: [initVarStmt, stmt],
                    assignedStateInit: true,
                },
                baseExpr.declarations,
                [...baseExpr.featuresTrace, GeneratorFeature.IF_THEN_STATEMENT],
            ),
        );

        return {
            feature: GeneratorFeature.IF_THEN_STATEMENT,
            generator,
        };
    }

    function ifElseStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );
        const condExpr = makeBinaryExpression(
            "==",
            makeBinaryExpression(
                "+",
                makeBinaryExpression("-", makeId("arg"), makeId("arg")),
                makeInt(1n),
            ),
            makeInt(0n),
        );

        const thenStmt = makeAssignStatement(
            makeId("stateInit"),
            makeInitOf(makeId("Dummy2"), []),
        );

        const elseStmt = makeAssignStatement(
            makeId("stateInit"),
            baseExpr.item.expression,
        );

        const stmt = makeConditionStatement(condExpr, [thenStmt], [elseStmt]);

        const newName = `IfElse_${baseExpr.item.name}`;

        const generator = fc.constant(
            withDeclarations(
                {
                    name: newName,
                    statements: [initVarStmt, stmt],
                    assignedStateInit: true,
                },
                baseExpr.declarations,
                [...baseExpr.featuresTrace, GeneratorFeature.IF_ELSE_STATEMENT],
            ),
        );

        return {
            feature: GeneratorFeature.IF_ELSE_STATEMENT,
            generator,
        };
    }

    function whileStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );
        const countVarStmt = makeLetStatement(
            makeId("counter"),
            makeTypeId("Int"),
            makeBinaryExpression("-", makeId("arg"), makeId("arg")),
        );
        const expr = makeAssignStatement(
            makeId("stateInit"),
            baseExpr.item.expression,
        );
        const counterIncr = makeAssignStatement(
            makeId("counter"),
            makeBinaryExpression("+", makeId("counter"), makeInt(1n)),
        );
        const cond = makeBinaryExpression("<=", makeId("counter"), makeInt(2n));
        const loop = makeWhileStatement(cond, [expr, counterIncr]);

        const newName = `While_${baseExpr.item.name}`;

        const generator = fc.constant(
            withDeclarations(
                {
                    name: newName,
                    statements: [initVarStmt, countVarStmt, loop],
                    assignedStateInit: true,
                },
                baseExpr.declarations,
                [...baseExpr.featuresTrace, GeneratorFeature.WHILE_STATEMENT],
            ),
        );

        return {
            feature: GeneratorFeature.WHILE_STATEMENT,
            generator,
        };
    }

    function untilStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );
        const countVarStmt = makeLetStatement(
            makeId("counter"),
            makeTypeId("Int"),
            makeBinaryExpression("-", makeId("arg"), makeId("arg")),
        );
        const expr = makeAssignStatement(
            makeId("stateInit"),
            baseExpr.item.expression,
        );
        const counterIncr = makeAssignStatement(
            makeId("counter"),
            makeBinaryExpression("+", makeId("counter"), makeInt(1n)),
        );
        const cond = makeBinaryExpression(">=", makeId("counter"), makeInt(2n));
        const loop = makeUntilStatement(cond, [expr, counterIncr]);

        const newName = `Until_${baseExpr.item.name}`;

        const generator = fc.constant(
            withDeclarations(
                {
                    name: newName,
                    statements: [initVarStmt, countVarStmt, loop],
                    assignedStateInit: true,
                },
                baseExpr.declarations,
                [...baseExpr.featuresTrace, GeneratorFeature.UNTIL_STATEMENT],
            ),
        );

        return {
            feature: GeneratorFeature.UNTIL_STATEMENT,
            generator,
        };
    }

    function repeatStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );
        const counterExpr = makeBinaryExpression(
            "+",
            makeBinaryExpression("-", makeId("arg"), makeId("arg")),
            makeInt(1n),
        );
        const countVarStmt = makeLetStatement(
            makeId("counter"),
            makeTypeId("Int"),
            counterExpr,
        );
        const expr = makeAssignStatement(
            makeId("stateInit"),
            baseExpr.item.expression,
        );
        const loop = makeRepeatStatement(makeId("counter"), [expr]);

        const newName = `Repeat_${baseExpr.item.name}`;

        const generator = fc.constant(
            withDeclarations(
                {
                    name: newName,
                    statements: [initVarStmt, countVarStmt, loop],
                    assignedStateInit: true,
                },
                baseExpr.declarations,
                [...baseExpr.featuresTrace, GeneratorFeature.REPEAT_STATEMENT],
            ),
        );

        return {
            feature: GeneratorFeature.REPEAT_STATEMENT,
            generator,
        };
    }

    /*
    function forEachStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): fc.Arbitrary<ItemsWithDeclarations<StatementsWithName>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );
        const mapVar = makeId("intMap");
        const mapVarStmt = makeLetStatement(
            mapVar,
            makeTypeId("map<Int,Int>"),
            makeNull(),
        );
        const mutateMap = makeExpressionStatement(
            makeMethodCall(makeId("set"), mapVar, [makeInt(1n), makeInt(3n)]),
        );

        const expr = makeAssignStatement(makeId("stateInit"), baseExpr);
        const loop = makeForEachStatement(
            mapVar,
            makeFreshVarName(),
            makeFreshVarName(),
            [expr],
        );

        const newName = `ForEach_${name}`;

        return withEmptyDeclarations([
            {
                name: newName,
                statements: [initVarStmt, mapVarStmt, mutateMap, loop],
                assignedStateInit: true,
            },
        ]);
    }
    */

    function destructStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const identifiers: Map<string, [A.AstId, A.AstId]> = new Map();
        identifiers.set("init", [makeId("init"), makeId("stateInit")]);

        const wrapped = makeStructInstance(makeId("StateInitWrapper"), [
            makeStructFieldInitializer(
                makeId("init"),
                baseExpr.item.expression,
            ),
        ]);

        const unwrapped = makeDestructStatement(
            wrapped,
            identifiers,
            makeTypeId("StateInitWrapper"),
        );

        const newName = `Destruct_${baseExpr.item.name}`;

        const generator = fc.constant(
            withDeclarations(
                {
                    name: newName,
                    statements: [unwrapped],
                    assignedStateInit: true,
                },
                baseExpr.declarations,
                [
                    ...baseExpr.featuresTrace,
                    GeneratorFeature.DESTRUCT_STATEMENT,
                ],
            ),
        );

        return {
            feature: GeneratorFeature.DESTRUCT_STATEMENT,
            generator,
        };
    }

    function blockStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );

        const exprStmt = makeAssignStatement(
            makeId("stateInit"),
            baseExpr.item.expression,
        );

        const stmt = makeBlockStatement([exprStmt]);

        const newName = `Block_${baseExpr.item.name}`;

        const generator = fc.constant(
            withDeclarations(
                {
                    name: newName,
                    statements: [initVarStmt, stmt],
                    assignedStateInit: true,
                },
                baseExpr.declarations,
                [...baseExpr.featuresTrace, GeneratorFeature.BLOCK_STATEMENT],
            ),
        );
        return {
            feature: GeneratorFeature.BLOCK_STATEMENT,
            generator,
        };
    }

    function tryStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );

        const exprStmt = makeAssignStatement(
            makeId("stateInit"),
            baseExpr.item.expression,
        );

        const tryStmt = makeTryStatement(
            makeFreshVarName(),
            [exprStmt],
            undefined,
        );

        const newName = `Try_${baseExpr.item.name}`;

        const generator = fc.constant(
            withDeclarations(
                {
                    name: newName,
                    statements: [initVarStmt, tryStmt],
                    assignedStateInit: true,
                },
                baseExpr.declarations,
                [...baseExpr.featuresTrace, GeneratorFeature.TRY_STATEMENT],
            ),
        );
        return {
            feature: GeneratorFeature.TRY_STATEMENT,
            generator,
        };
    }

    function catchStatementGenerator(
        baseExpr: ItemWithDeclarations<ExpressionWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<StatementsWrapper>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );

        const exprStmt = makeAssignStatement(
            makeId("stateInit"),
            baseExpr.item.expression,
        );
        const requireArg = makeBinaryExpression(
            "!=",
            makeBinaryExpression("-", makeId("arg"), makeId("arg")),
            makeInt(0n),
        );
        const requireStatement = makeExpressionStatement(
            makeStaticCall(makeId("require"), [requireArg, makeString("")]),
        );

        const catchStmt = makeTryStatement(
            makeFreshVarName(),
            [requireStatement],
            [exprStmt],
        );

        const case2Name = `Catch_${baseExpr.item.name}`;

        const generator = fc.constant(
            withDeclarations(
                {
                    name: case2Name,
                    statements: [initVarStmt, catchStmt],
                    assignedStateInit: true,
                },
                baseExpr.declarations,
                [...baseExpr.featuresTrace, GeneratorFeature.CATCH_STATEMENT],
            ),
        );
        return {
            feature: GeneratorFeature.CATCH_STATEMENT,
            generator,
        };
    }

    function expressionGenerator(
        currentFunCallDepth: number,
        desiredFunCallDepth: number,
    ): fc.Arbitrary<ItemWithDeclarations<ExpressionWrapper>> {
        const baseGens = [
            initOfGenerator(),
            //contractConstantGenerator(initOf),
            //contractFieldGenerator(initOf)
        ];

        // Keep only those generators allowed by the features
        const finalBaseGens = baseGens
            .filter((genDesc) => allowedFeatures.has(genDesc.feature))
            .map((genDesc) => genDesc.generator);

        if (currentFunCallDepth >= desiredFunCallDepth) {
            // Use base generators
            if (finalBaseGens.length === 0) {
                // Default to use initof generator
                return initOfGenerator().generator;
            } else {
                return fc.oneof(...finalBaseGens);
            }
        }

        // We haven't reached the desired function call depth, use
        // the recursive generators

        const recursiveGens = [
            staticCallGenerator(currentFunCallDepth, desiredFunCallDepth),
            //methodCallGenerator(),
        ];

        const finalRecursiveGens = recursiveGens
            .filter((genDesc) => allowedFeatures.has(genDesc.feature))
            .map((genDesc) => genDesc.generator);

        if (finalRecursiveGens.length === 0) {
            // Default to use initof generator
            return initOfGenerator().generator;
        } else {
            return fc.oneof(...finalRecursiveGens);
        }
    }

    function statementGenerator(
        currentFunCallDepth: number,
        desiredFunCallDepth: number,
    ): fc.Arbitrary<ItemWithDeclarations<StatementsWrapper>> {
        return expressionGenerator(
            currentFunCallDepth,
            desiredFunCallDepth,
        ).chain((genExpr) => {
            const stmtGens = [
                letStatementGenerator(genExpr),
                expressionStatementGenerator(genExpr),
                ifNoElseStatementGenerator(genExpr),
                ifThenStatementGenerator(genExpr),
                ifElseStatementGenerator(genExpr),
                whileStatementGenerator(genExpr),
                untilStatementGenerator(genExpr),
                repeatStatementGenerator(genExpr) /*
                    forEachStatementGenerator(
                        genExpr
                    ),*/,
                destructStatementGenerator(genExpr),
                blockStatementGenerator(genExpr),
                tryStatementGenerator(genExpr),
                catchStatementGenerator(genExpr),
            ];

            // Keep only those generators allowed by the features
            const finalGens = stmtGens
                .filter((genDesc) => allowedFeatures.has(genDesc.feature))
                .map((genDesc) => genDesc.generator);

            if (finalGens.length === 0) {
                // Default to use let statement generator
                return letStatementGenerator(genExpr).generator;
            } else {
                return fc.oneof(...finalGens);
            }
        });
    }

    function contractWithInitGenerator(
        stmtsData: ItemWithDeclarations<StatementsWrapper>,
    ): GeneratorDescriptor<ItemWithDeclarations<A.AstContract>> {
        const newName = `${stmtsData.item.name}_${idCounter++}`;
        const stmtsToUse = stmtsData.item.assignedStateInit
            ? stmtsData.item.statements
            : [
                  ...stmtsData.item.statements,
                  makeLetStatement(
                      makeId("stateInit"),
                      makeTypeId("StateInit"),
                      makeInitOf(makeId("Deployer"), []),
                  ),
              ];

        const contract = makeContract(
            makeId(newName),
            stmtsToUse,
            Array.from(stmtsData.declarations.contractDeclarations.values()),
        );

        const generator = fc.constant(
            withDeclarations(
                contract,
                {
                    globalDeclarations:
                        stmtsData.declarations.globalDeclarations,
                    contractDeclarations: new Map(),
                },
                [
                    ...stmtsData.featuresTrace,
                    GeneratorFeature.CONTRACT_WITH_INIT,
                ],
            ),
        );

        return {
            feature: GeneratorFeature.CONTRACT_WITH_INIT,
            generator,
        };
    }

    function contractGenerator(
        currentFunCallDepth: number,
        desiredFunCallDepth: number,
    ): fc.Arbitrary<ItemWithDeclarations<A.AstContract>> {
        return statementGenerator(
            currentFunCallDepth,
            desiredFunCallDepth,
        ).chain((stmtsWithName) => {
            const contractGens = [contractWithInitGenerator(stmtsWithName)];

            const finalGens = contractGens
                .filter((genDesc) => allowedFeatures.has(genDesc.feature))
                .map((genDesc) => genDesc.generator);

            if (finalGens.length === 0) {
                // Default to use let contractWithInitGenerator generator
                return contractWithInitGenerator(stmtsWithName).generator;
            } else {
                return fc.oneof(...finalGens);
            }
        });
    }

    /*
    function makeImport(path: string): A.AstImport {
        return astF.createNode({kind: "import", importPath: {path: fromString(path), type: "relative", language: "tact"}, loc: emptySrcInfo}) as A.AstImport;
    }*/

    function makeModule(decls: A.AstModuleItem[]): A.AstModule {
        return astF.createNode({
            kind: "module",
            imports: [],
            items: decls,
        }) as A.AstModule;
    }

    function createTestsInBatches(
        items: ItemWithDeclarations<A.AstContract>[],
        extraModule: A.AstModule,
        compilationBatchSize: number,
    ): Test[] {
        const tests: Test[] = [];

        let moduleItemAccumulator: Map<string, A.AstModuleItem> = new Map();
        let contractNamesAccumulator: string[] = [];

        let counter = 0;

        for (const item of items) {
            for (const [name, decl] of item.declarations.globalDeclarations) {
                moduleItemAccumulator.set(name, decl);
            }
            const contractName = idText(item.item.name);
            moduleItemAccumulator.set(contractName, item.item);
            contractNamesAccumulator.push(contractName);
            counter++;

            if (counter >= compilationBatchSize) {
                tests.push({
                    module: makeModule([
                        ...moduleItemAccumulator.values(),
                        ...extraModule.items,
                    ]),
                    contractNames: contractNamesAccumulator,
                });
                counter = 0;
                moduleItemAccumulator = new Map();
                contractNamesAccumulator = [];
            }
        }

        // if there are elements in the accumulator arrays, it means that the last group
        // did not fill completely, we need to create a test with the leftovers
        if (contractNamesAccumulator.length > 0) {
            tests.push({
                module: makeModule([
                    ...moduleItemAccumulator.values(),
                    ...extraModule.items,
                ]),
                contractNames: contractNamesAccumulator,
            });
        }

        return tests;
    }

    const generator = fc
        .nat(maxFunCallDepth)
        .chain((depth) => contractGenerator(0, depth));

    return {
        generator,
        batchBuilder: createTestsInBatches,
    };
}

async function testContracts(
    testName: string,
    contractCodes: Map<string, Buffer>,
) {
    const blockchain = await Blockchain.create();
    const deployerStateInit = getDeployerStateInit(contractCodes);
    const contractToTestStateInit = getTestedContractStateInit(
        testName,
        0n,
        contractCodes,
    );
    const deployer = blockchain.openContract(
        new ProxyContract(deployerStateInit),
    );
    const contractToTest = blockchain.openContract(
        new ProxyContract(contractToTestStateInit),
    );
    const treasure = await blockchain.treasury("treasure");

    const { transactions } = await deployer.send(
        treasure.getSender(),
        { value: toNano("100") },
        beginCell()
            .storeUint(100, 32)
            .storeAddress(contractToTest.address)
            .storeRef(contractToTestStateInit.data!)
            .storeRef(contractToTestStateInit.code!)
            .endCell(),
    );

    // The deployer must have sent a message to the tested contract, which changed the status
    // of the tested contract from uninitialized to active.
    // The tested contract must have returned with exit code 0 from its computation phase,
    // and result code 0 from its action phase
    const trans1 = ensureTransactionExists(
        testName,
        findTransaction(transactions, {
            from: deployer.address,
            to: contractToTest.address,
            oldStatus: "uninitialized",
            endStatus: "active",
            exitCode: 0,
            actionResultCode: 0,
        }),
    );
    // The tested contract must have sent 1 message, with bounced flag set to false,
    // and destination the deployer
    ensure(testName, trans1.outMessagesCount).is(1);
    const outMessage = getOutMessageInfo(testName, trans1.outMessages.get(0));
    ensure(testName, outMessage.bounced).is(false);
    ensure(testName, outMessage.dest.toRawString()).is(
        deployer.address.toRawString(),
    );

    // The deployer must have received a message from the tested contract,
    // with bounced flag set to false
    ensureTransactionExists(
        testName,
        findTransaction(transactions, {
            from: contractToTest.address,
            to: deployer.address,
            inMessageBounced: false,
        }),
    );
}

function getDeployerStateInit(contractCodes: Map<string, Buffer>): StateInit {
    const deployerCode = contractCodes.get("Deployer");
    if (typeof deployerCode === "undefined") {
        throw new Error("Deployer was expected to exist in contracts boc map");
    }
    const data = beginCell().storeUint(0, 1).endCell();
    const code = Cell.fromBoc(deployerCode)[0];
    if (typeof code === "undefined") {
        throw new Error("Code cell expected");
    }
    return { code, data };
}

function getTestedContractStateInit(
    name: string,
    initialArg: bigint,
    contractCodes: Map<string, Buffer>,
): StateInit {
    const contractCode = contractCodes.get(name);
    if (typeof contractCode === "undefined") {
        throw new Error(
            `Boc for contract ${name} was expected to exist in contracts boc map`,
        );
    }
    const data = beginCell()
        .storeUint(0, 1)
        .storeInt(initialArg, 257)
        .endCell();
    const code = Cell.fromBoc(contractCode)[0];
    if (typeof code === "undefined") {
        throw new Error(`Code cell expected for contract ${name}`);
    }
    return { code, data };
}

// Create a collection of feature sets. The number of feature sets will be random in the closed interval [minNum, maxNum].
// Each feature set is randomly generated by throwing a coin at each feature.
function createFeatureSets(
    minNum: number,
    maxNum: number,
): Set<GeneratorFeatureType>[] {
    const numberOfSets = Math.floor(
        Math.random() * (maxNum - minNum + 1) + minNum,
    );
    const result: Set<GeneratorFeatureType>[] = [];

    for (let i = 1; i <= numberOfSets; i++) {
        result.push(
            new Set(
                Object.values(GeneratorFeature).filter(
                    (_) => Math.random() >= 0.5,
                ),
            ),
        );
    }

    return result;
}

async function main() {
    const args = process.argv.slice(2);

    if (args.includes("stats")) {
        statistics();
        return;
    }

    const astF = getAstFactory();

    // Parse the stdlib and filter it with the minimal definitions we need
    const stdlibModule = filterGlobalDeclarations(
        parseStandardLibrary(astF),
        astF,
        new Set([
            "Int",
            "Bool",
            "Address",
            "Cell",
            "Context",
            "Slice",
            "Builder",
            "String",
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
            "contractAddress",
            "contractAddressExt",
            "storeUint",
            "storeInt",
            "contractHash",
            "newAddress",
            "beginCell",
            "endCell",
            "send",
            "asSlice",
            "asAddressUnsafe",
            "beginParse",
        ]),
    );

    const customStdlibFc = loadCustomStdlibFc();

    // Create the custom stdlib, with the loaded custom FunC stdlib
    const customStdlib = {
        modules: [stdlibModule],
        stdlib_fc: customStdlibFc.stdlib_fc,
        stdlib_ex_fc: customStdlibFc.stdlib_ex_fc,
    };

    // Prepare the Deployer contract and Dummies necessary for tests.
    const parser = getParser(astF);
    const extraModule = parser.parse({
        path: ".",
        code: fs
            .readFileSync(path.join(__dirname, "contracts/deployer.tact"))
            .toString(),
        origin: "user",
    });

    const featureSets = createFeatureSets(10, 15);

    console.log(`Generated ${featureSets.length} feature sets.`);

    const compilationBatchSize = 20;
    const maxFunCallDepth = 10;

    await Promise.all(
        featureSets.map((featureSet, idx) =>
            executeTestsOnFeatures(
                featureSet,
                idx + 1,
                astF,
                compilationBatchSize,
                customStdlib,
                extraModule,
                maxFunCallDepth,
            ),
        ),
    );
}

async function executeTestsOnFeatures(
    featureSet: Set<GeneratorFeatureType>,
    idx: number,
    astF: FactoryAst,
    compilationBatchSize: number,
    customStdlib: CustomStdlib,
    extraModule: A.AstModule,
    maxFunCallDepth: number,
) {
    const errorFilename = `error-${idx}.log`;
    const fileDescriptor = fs.openSync(
        path.join(__dirname, errorFilename),
        "w",
    );

    const featureSetString = `{${Array.from(featureSet).join(", ")}}`;
    console.log(`#${idx}: Using feature set: ${featureSetString}`);

    const testFactory = getGeneratorFactory(astF, featureSet, maxFunCallDepth);

    await fc.assert(
        fc.asyncProperty(
            fc.array(testFactory.generator, {
                minLength: compilationBatchSize,
            }),
            async (allCases) => {
                const numberOfGeneratedContracts = allCases.length;
                const tests = testFactory.batchBuilder(
                    allCases,
                    extraModule,
                    compilationBatchSize,
                );

                console.log(
                    `#${idx}: Generated ${numberOfGeneratedContracts} contracts, grouped in ${tests.length} compilation batches.`,
                );

                for (const test of tests) {
                    console.log(`#${idx}: Compiling next batch...`);
                    try {
                        const contractCodes = await buildModule(
                            astF,
                            test.module,
                            customStdlib,
                            true,
                        );
                        for (const contractName of test.contractNames) {
                            try {
                                console.log(
                                    `#${idx}: Testing contract ${contractName}...`,
                                );
                                await testContracts(
                                    contractName,
                                    contractCodes,
                                );
                                console.log(`#${idx}: ${contractName} passed.`);
                            } catch (e) {
                                if (e instanceof Error) {
                                    console.log(
                                        `#${idx}: ${contractName} failed. See ${errorFilename}.`,
                                    );
                                    handleError(
                                        e,
                                        fileDescriptor,
                                        featureSetString,
                                        test.module,
                                    );
                                }
                                // Interrupt the entire process
                                throw e;
                            }
                        }
                    } catch (e) {
                        if (e instanceof Error) {
                            const batchString = `[${test.contractNames.join(", ")}]`;
                            console.log(
                                `#${idx}: Batch ${batchString} failed processing. See ${errorFilename}.`,
                            );
                            handleError(
                                e,
                                fileDescriptor,
                                featureSetString,
                                test.module,
                            );
                        }
                        // Interrupt the entire process
                        throw e;
                    }
                }
            },
        ),
    );
}

function handleError(
    e: Error,
    fileDescriptor: number,
    featureSetString: string,
    module: A.AstModule,
) {
    const tactCode = prettyPrint(module);
    fs.writeSync(
        fileDescriptor,
        `With features: ${featureSetString}, code:\n${tactCode}\nfailed with error:\n`,
    );
    fs.writeSync(fileDescriptor, e.stack ?? "");
    fs.writeSync(fileDescriptor, "\n----------------------------------\n\n");
}

function ensureTransactionExists(
    testName: string,
    tsx: BlockchainTransaction | undefined,
): BlockchainTransaction {
    if (typeof tsx === "undefined") {
        throw new Error(`Test ${testName}: Transaction was expected to exist`);
    }
    return tsx;
}

function getOutMessageInfo(
    testName: string,
    msg: Message | undefined,
): CommonMessageInfoInternal {
    if (typeof msg === "undefined") {
        throw new Error(`Test ${testName}: Message was expected to exist`);
    }
    if (msg.info.type !== "internal") {
        throw new Error(
            `Test ${testName}: Message kind was expected to be internal`,
        );
    }
    return msg.info;
}

function ensure(
    testName: string,
    data: string | number | boolean,
): {
    is: (expected: string | number | boolean) => void;
} {
    return {
        is: (expected: string | number | boolean) => {
            const res = data === expected;
            if (!res) {
                throw new Error(
                    `Test ${testName}: ${data} was expected to be ${expected}`,
                );
            }
        },
    };
}

function statistics() {
    const samplesNumber = 50000;
    const maxFunctionCallDepth = 10;

    const astF = getAstFactory();

    const featureSet = new Set(Object.values(GeneratorFeature));

    const testFactory = getGeneratorFactory(
        astF,
        featureSet,
        maxFunctionCallDepth,
    );

    const featureCount: Map<string, number> = new Map();
    const depthCount: Map<number, number> = new Map();

    console.log(
        `Generating a sample of ${samplesNumber} contracts, with maximum function call depth of ${maxFunctionCallDepth}...`,
    );

    const samples = fc.sample(testFactory.generator, samplesNumber);

    for (const sample of samples) {
        for (const feature of sample.featuresTrace) {
            const count = featureCount.get(feature);
            if (typeof count === "undefined") {
                featureCount.set(feature, 1);
            } else {
                featureCount.set(feature, count + 1);
            }
        }

        // Now count the function call depth
        const callDepth = sample.featuresTrace.filter(
            (feature) => feature === GeneratorFeature.STATIC_CALL_EXPRESSION,
        ).length;
        const count = depthCount.get(callDepth);
        if (typeof count === "undefined") {
            depthCount.set(callDepth, 1);
        } else {
            depthCount.set(callDepth, count + 1);
        }
    }

    const totalFeatureCount = featureCount
        .values()
        .reduce((prev, curr) => prev + curr, 0);
    const totalDepthCount = depthCount
        .values()
        .reduce((prev, curr) => prev + curr, 0);

    console.log("\nDistribution of features:");

    for (const [feature, count] of featureCount) {
        console.log(`${feature}: ${(count / totalFeatureCount) * 100}%`);
    }

    console.log("\nDistribution of function call depths:");

    for (const [depth, count] of depthCount) {
        console.log(`${depth}: ${(count / totalDepthCount) * 100}%`);
    }
}

void main();
