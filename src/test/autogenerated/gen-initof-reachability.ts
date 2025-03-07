import path from "path";
import type * as A from "../../ast/ast";
import { getAstFactory, idText } from "../../ast/ast-helpers";
import type { FactoryAst } from "../../ast/ast-helpers";
import { prettyPrint } from "../../ast/ast-printer";
import { getParser } from "../../grammar";
import * as fs from "fs";
import fc from "fast-check";
import { buildModule, ProxyContract } from "./util";
import { defaultParser } from "../../grammar/grammar";
import { getSrcInfo } from "../../grammar/src-info";
import { Blockchain } from "@ton/sandbox";
import type { BlockchainTransaction } from "@ton/sandbox";
import type { CommonMessageInfoInternal, Message, StateInit } from "@ton/core";
import { Cell, beginCell, toNano } from "@ton/core";
import { findTransaction } from "@ton/test-utils";

type ItemsWithDeclarations<T> = {
    items: T[];
    declarations: Declarations;
};

type Declarations = {
    globalDeclarations: Map<string, A.AstModuleItem>;
    contractDeclarations: Map<string, A.AstContractDeclaration>;
};

type ExpressionWithName = {
    name: string;
    expression: A.AstExpression;
};

type StatementsWithName = {
    name: string;
    statements: A.AstStatement[];
    assignedStateInit: boolean;
};

type GlobalConfig = {
    maxFunCallDepth: number;
};

type Test = {
    module: A.AstModule;
    testName: string;
};

function createTestModules(astF: FactoryAst): Test[] {
    let idCounter = 0;
    const emptySrcInfo = getSrcInfo(" ", 0, 0, null, "user");

    const config: GlobalConfig = {
        maxFunCallDepth: 2,
    };

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
        items: T[],
    ): fc.Arbitrary<ItemsWithDeclarations<T>> {
        return fc.constant({
            items: items,
            declarations: {
                globalDeclarations: new Map(),
                contractDeclarations: new Map(),
            },
        });
    }

    function chainGenerators<T>(
        gens: fc.Arbitrary<ItemsWithDeclarations<T>>[],
        initialDecls: Declarations,
    ): fc.Arbitrary<ItemsWithDeclarations<T>> {
        const join: (
            d1: ItemsWithDeclarations<T>,
            d2: ItemsWithDeclarations<T>,
        ) => ItemsWithDeclarations<T> = (d1, d2) => {
            const finalGlobalDecls: Map<string, A.AstModuleItem> = new Map(
                d1.declarations.globalDeclarations,
            );
            const finalContractDecls: Map<string, A.AstContractDeclaration> =
                new Map(d1.declarations.contractDeclarations);
            const finalItems: T[] = [...d1.items, ...d2.items];
            d2.declarations.globalDeclarations.forEach((value, key) => {
                finalGlobalDecls.set(key, value);
            });
            d2.declarations.contractDeclarations.forEach((value, key) => {
                finalContractDecls.set(key, value);
            });
            return {
                items: finalItems,
                declarations: {
                    globalDeclarations: finalGlobalDecls,
                    contractDeclarations: finalContractDecls,
                },
            };
        };
        return chainGeneratorsAux(
            {
                items: [],
                declarations: initialDecls,
            },
            gens,
            join,
        );
    }

    function chainGeneratorsAux<T>(
        accumulator: T,
        gens: fc.Arbitrary<T>[],
        join: (d1: T, d2: T) => T,
    ): fc.Arbitrary<T> {
        if (gens.length === 0) {
            return fc.constant(accumulator);
        }
        // First element is ensured to exist
        const gen = gens[0]!;
        return gen.chain((currData) => {
            return chainGeneratorsAux(
                join(accumulator, currData),
                gens.slice(1),
                join,
            );
        });
    }

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

    function initOfGenerator(): fc.Arbitrary<
        ItemsWithDeclarations<ExpressionWithName>
    > {
        return withEmptyDeclarations([
            {
                name: "InitOf",
                expression: makeInitOf(makeId("Deployer"), []),
            },
        ]);
    }

    function staticCallGenerator(
        currentFunCallDepth: number,
    ): fc.Arbitrary<ItemsWithDeclarations<ExpressionWithName>> {
        if (currentFunCallDepth >= config.maxFunCallDepth) {
            return withEmptyDeclarations([]);
        }

        return statementGenerator(currentFunCallDepth + 1).chain((genStmts) => {
            const finalGlobalDecls: Map<string, A.AstModuleItem> = new Map(
                genStmts.declarations.globalDeclarations,
            );
            const finalItems: ExpressionWithName[] = [];

            for (const stmtsWithName of genStmts.items) {
                if (stmtsWithName.assignedStateInit) {
                    const funName = makeFreshFunctionName();
                    const returnStmt = makeReturnStatement(makeId("stateInit"));
                    const funDef = makeFunctionDefinition(
                        funName,
                        [makeTypedParameter("arg", "Int")],
                        [...stmtsWithName.statements, returnStmt],
                        [],
                        makeTypeId("StateInit"),
                    );
                    const call = makeStaticCall(funName, [makeId("arg")]);
                    const testName = `StaticCall_${stmtsWithName.name}`;
                    finalGlobalDecls.set(idText(funName), funDef);
                    finalItems.push({ name: testName, expression: call });
                }
            }

            return fc.constant({
                items: finalItems,
                declarations: {
                    globalDeclarations: finalGlobalDecls,
                    contractDeclarations: new Map(),
                },
            });
        });
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
        baseExpr: A.AstExpression,
        name: string,
    ): fc.Arbitrary<ItemsWithDeclarations<StatementsWithName>> {
        const varName = makeId("stateInit");
        const varType = makeTypeId("StateInit");
        const stmtLet = makeLetStatement(varName, varType, baseExpr);
        const newName = `Let_${name}`;

        return withEmptyDeclarations([
            {
                name: newName,
                statements: [stmtLet],
                assignedStateInit: true,
            },
        ]);
    }

    function expressionStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): fc.Arbitrary<ItemsWithDeclarations<StatementsWithName>> {
        const stmtExpr = makeExpressionStatement(baseExpr);
        const newName = `Expr_${name}`;
        return withEmptyDeclarations([
            {
                name: newName,
                statements: [stmtExpr],
                assignedStateInit: false,
            },
        ]);
    }

    function conditionStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): fc.Arbitrary<ItemsWithDeclarations<StatementsWithName>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );
        const cond1Expr = makeBinaryExpression(
            "==",
            makeBinaryExpression("-", makeId("arg"), makeId("arg")),
            makeInt(0n),
        );
        const cond2Expr = makeBinaryExpression(
            "==",
            makeBinaryExpression(
                "+",
                makeBinaryExpression("-", makeId("arg"), makeId("arg")),
                makeInt(1n),
            ),
            makeInt(0n),
        );

        const expr = makeAssignStatement(makeId("stateInit"), baseExpr);
        const dummy2 = makeAssignStatement(
            makeId("stateInit"),
            makeInitOf(makeId("Dummy2"), []),
        );
        const case1 = makeConditionStatement(cond1Expr, [expr], undefined);
        const case2 = makeConditionStatement(cond1Expr, [expr], [dummy2]);
        const case3 = makeConditionStatement(cond2Expr, [dummy2], [expr]);

        const case1Name = `IfNoElse_${name}`;
        const case2Name = `IfThen_${name}`;
        const case3Name = `IfElse_${name}`;

        return withEmptyDeclarations([
            {
                name: case1Name,
                statements: [initVarStmt, case1],
                assignedStateInit: true,
            },
            {
                name: case2Name,
                statements: [initVarStmt, case2],
                assignedStateInit: true,
            },
            {
                name: case3Name,
                statements: [initVarStmt, case3],
                assignedStateInit: true,
            },
        ]);
    }

    function whileStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): fc.Arbitrary<ItemsWithDeclarations<StatementsWithName>> {
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
        const expr = makeAssignStatement(makeId("stateInit"), baseExpr);
        const counterIncr = makeAssignStatement(
            makeId("counter"),
            makeBinaryExpression("+", makeId("counter"), makeInt(1n)),
        );
        const cond = makeBinaryExpression("<=", makeId("counter"), makeInt(2n));
        const loop = makeWhileStatement(cond, [expr, counterIncr]);

        const newName = `While_${name}`;

        return withEmptyDeclarations([
            {
                name: newName,
                statements: [initVarStmt, countVarStmt, loop],
                assignedStateInit: true,
            },
        ]);
    }

    function untilStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): fc.Arbitrary<ItemsWithDeclarations<StatementsWithName>> {
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
        const expr = makeAssignStatement(makeId("stateInit"), baseExpr);
        const counterIncr = makeAssignStatement(
            makeId("counter"),
            makeBinaryExpression("+", makeId("counter"), makeInt(1n)),
        );
        const cond = makeBinaryExpression(">=", makeId("counter"), makeInt(2n));
        const loop = makeUntilStatement(cond, [expr, counterIncr]);

        const newName = `Until_${name}`;

        return withEmptyDeclarations([
            {
                name: newName,
                statements: [initVarStmt, countVarStmt, loop],
                assignedStateInit: true,
            },
        ]);
    }

    function repeatStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): fc.Arbitrary<ItemsWithDeclarations<StatementsWithName>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );
        const countVarStmt = makeLetStatement(
            makeId("counter"),
            makeTypeId("Int"),
            makeStaticCall(makeId("random"), [makeInt(1n), makeInt(3n)]),
        );
        const expr = makeAssignStatement(makeId("stateInit"), baseExpr);
        const loop = makeRepeatStatement(makeId("counter"), [expr]);

        const newName = `Repeat_${name}`;

        return withEmptyDeclarations([
            {
                name: newName,
                statements: [initVarStmt, countVarStmt, loop],
                assignedStateInit: true,
            },
        ]);
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
        baseExpr: A.AstExpression,
        name: string,
    ): fc.Arbitrary<ItemsWithDeclarations<StatementsWithName>> {
        const identifiers: Map<string, [A.AstId, A.AstId]> = new Map();
        identifiers.set("init", [makeId("init"), makeId("stateInit")]);

        const wrapped = makeStructInstance(makeId("StateInitWrapper"), [
            makeStructFieldInitializer(makeId("init"), baseExpr),
        ]);

        const unwrapped = makeDestructStatement(
            wrapped,
            identifiers,
            makeTypeId("StateInitWrapper"),
        );

        const newName = `Destruct_${name}`;

        return withEmptyDeclarations([
            {
                name: newName,
                statements: [unwrapped],
                assignedStateInit: true,
            },
        ]);
    }

    function blockStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): fc.Arbitrary<ItemsWithDeclarations<StatementsWithName>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );

        const exprStmt = makeAssignStatement(makeId("stateInit"), baseExpr);

        const stmt = makeBlockStatement([exprStmt]);

        const newName = `Block_${name}`;

        return withEmptyDeclarations([
            {
                name: newName,
                statements: [initVarStmt, stmt],
                assignedStateInit: true,
            },
        ]);
    }

    function tryStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): fc.Arbitrary<ItemsWithDeclarations<StatementsWithName>> {
        const initVarStmt = makeLetStatement(
            makeId("stateInit"),
            makeTypeId("StateInit"),
            makeInitOf(makeId("Dummy1"), []),
        );

        const exprStmt = makeAssignStatement(makeId("stateInit"), baseExpr);
        const divByZeroStmt = makeExpressionStatement(
            makeBinaryExpression(
                "/",
                makeInt(1n),
                makeBinaryExpression("-", makeId("arg"), makeId("arg")),
            ),
        );

        const case1 = makeTryStatement(
            makeFreshVarName(),
            [exprStmt],
            undefined,
        );
        const case2 = makeTryStatement(
            makeFreshVarName(),
            [divByZeroStmt],
            [exprStmt],
        );

        const case1Name = `Try_${name}`;
        const case2Name = `Catch_${name}`;

        return withEmptyDeclarations([
            {
                name: case1Name,
                statements: [initVarStmt, case1],
                assignedStateInit: true,
            },
            {
                name: case2Name,
                statements: [initVarStmt, case2],
                assignedStateInit: true,
            },
        ]);
    }

    function expressionGenerator(
        currentFunCallDepth: number,
    ): fc.Arbitrary<ItemsWithDeclarations<ExpressionWithName>> {
        const exprGens = [
            initOfGenerator(),
            staticCallGenerator(currentFunCallDepth),
            //methodCallGenerator(),
            //contractConstantGenerator(initOf),
            //contractFieldGenerator(initOf)
        ];

        // Chain all the above generators
        return chainGenerators(exprGens, {
            globalDeclarations: new Map(),
            contractDeclarations: new Map(),
        });
    }

    function statementGenerator(
        currentFunCallDepth: number,
    ): fc.Arbitrary<ItemsWithDeclarations<StatementsWithName>> {
        return expressionGenerator(currentFunCallDepth).chain((genExprs) => {
            const generators: fc.Arbitrary<
                ItemsWithDeclarations<StatementsWithName>
            >[] = [];

            for (const exprWithName of genExprs.items) {
                const stmtGens = [
                    letStatementGenerator(
                        exprWithName.expression,
                        exprWithName.name,
                    ),
                    expressionStatementGenerator(
                        exprWithName.expression,
                        exprWithName.name,
                    ),
                    conditionStatementGenerator(
                        exprWithName.expression,
                        exprWithName.name,
                    ),
                    whileStatementGenerator(
                        exprWithName.expression,
                        exprWithName.name,
                    ),
                    untilStatementGenerator(
                        exprWithName.expression,
                        exprWithName.name,
                    ),
                    repeatStatementGenerator(
                        exprWithName.expression,
                        exprWithName.name,
                    ) /*
                    forEachStatementGenerator(
                        exprWithName.expression,
                        exprWithName.name,
                    ),*/,
                    destructStatementGenerator(
                        exprWithName.expression,
                        exprWithName.name,
                    ),
                    blockStatementGenerator(
                        exprWithName.expression,
                        exprWithName.name,
                    ),
                    tryStatementGenerator(
                        exprWithName.expression,
                        exprWithName.name,
                    ),
                ];

                generators.push(...stmtGens);
            }

            return chainGenerators(generators, genExprs.declarations);
        });
    }

    function contractWithInitGenerator(
        stmtsData: StatementsWithName,
        contractDecls: A.AstContractDeclaration[],
    ): fc.Arbitrary<ItemsWithDeclarations<A.AstContract>> {
        const finalContracts: A.AstContract[] = [];

        if (stmtsData.assignedStateInit) {
            finalContracts.push(
                makeContract(
                    makeId(stmtsData.name),
                    stmtsData.statements,
                    contractDecls,
                ),
            );
        }
        /*finalContracts.push(
            makeContractNoSend(
                makeId(stmtsData.name + "_NoSend"),
                stmtsData.statements,
                contractDecls,
            )
        );*/
        return withEmptyDeclarations(finalContracts);
    }

    function contractGenerator(
        currentFunCallDepth: number,
    ): fc.Arbitrary<ItemsWithDeclarations<A.AstContract>> {
        return statementGenerator(currentFunCallDepth).chain((genStmts) => {
            const generators: fc.Arbitrary<
                ItemsWithDeclarations<A.AstContract>
            >[] = [];

            for (const stmtsWithName of genStmts.items) {
                const contractGens = [
                    contractWithInitGenerator(
                        stmtsWithName,
                        Array.from(
                            genStmts.declarations.contractDeclarations.values(),
                        ),
                    ),
                ];

                generators.push(...contractGens);
            }

            return chainGenerators(generators, {
                globalDeclarations: genStmts.declarations.globalDeclarations,
                contractDeclarations: new Map(),
            });
        });
    }

    /*
    function makeImport(path: string): A.AstImport {
        return astF.createNode({kind: "import", importPath: {path: fromString(path), type: "relative", language: "tact"}, loc: emptySrcInfo}) as A.AstImport;
    }*/

    function makeModule(
        contract: A.AstContract,
        globalDecls: A.AstModuleItem[],
    ): A.AstModule {
        return astF.createNode({
            kind: "module",
            imports: [],
            items: [...globalDecls, contract],
        }) as A.AstModule;
    }

    const genResult = fc.sample(contractGenerator(0), 1);
    if (genResult.length !== 1) {
        throw new Error(
            "Generator should return exactly one element, which is an array containing all the test cases.",
        );
    }
    // The unique element in the array is ensured to exist
    const allCases = genResult[0]!;
    const tests: Test[] = [];

    // Add the Deployer contract and Dummies necessary for tests.
    const parser = getParser(astF, defaultParser);
    const extraModule = parser.parse({
        path: ".",
        code: fs
            .readFileSync(path.join(__dirname, "contracts/deployer.tact"))
            .toString(),
        origin: "user",
    });
    const finalGlobalDecls = [
        ...allCases.declarations.globalDeclarations.values(),
        ...extraModule.items,
    ];

    for (const contract of allCases.items) {
        tests.push({
            module: makeModule(contract, finalGlobalDecls),
            testName: idText(contract.name),
        });
    }

    return tests;
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
    ensure(trans1.outMessagesCount).is(1);
    const outMessage = getOutMessageInfo(trans1.outMessages.get(0));
    ensure(outMessage.bounced).is(false);
    ensure(outMessage.dest.toRawString()).is(deployer.address.toRawString());

    // The deployer must have received a message from the tested contract,
    // with bounced flag set to false
    ensureTransactionExists(
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
        throw new Error("Code cell expected");
    }
    return { code, data };
}

async function main() {
    const astF = getAstFactory();

    const tests = createTestModules(astF);

    console.log(`Generated ${tests.length} tests.`);

    for (const test of tests) {
        console.log(`Compiling test ${test.testName}`);

        try {
            // Compile the module
            const contractCodes = await buildModule(astF, test.module);
            console.log("Testing...");
            await testContracts(test.testName, contractCodes);
            console.log("Passed.");
        } catch (e) {
            console.log("Test:");
            console.log(prettyPrint(test.module));
            console.log("failed with error:");
            console.log(e);
        }
    }
}

function ensureTransactionExists(
    tsx: BlockchainTransaction | undefined,
): BlockchainTransaction {
    if (typeof tsx === "undefined") {
        throw new Error("Transaction was expected to exist");
    }
    return tsx;
}

function getOutMessageInfo(
    msg: Message | undefined,
): CommonMessageInfoInternal {
    if (typeof msg === "undefined") {
        throw new Error("Message was expected to exist");
    }
    if (msg.info.type !== "internal") {
        throw new Error("Message kind was expected to be internal");
    }
    return msg.info;
}

function ensure(data: string | number | boolean): {
    is: (expected: string | number | boolean) => void;
} {
    return {
        is: (expected: string | number | boolean) => {
            const res = data === expected;
            if (!res) {
                throw new Error(`${data} was expected to be ${expected}`);
            }
        },
    };
}

void main();
