import path from "path";
import type * as A from "../../ast/ast";
import { getAstFactory, idText } from "../../ast/ast-helpers";
import type { FactoryAst } from "../../ast/ast-helpers";
import { prettyPrint } from "../../ast/ast-printer";
import { dummySrcInfo } from "../../grammar";
import * as fs from "fs";

/*
    | AstFieldAccess
    | AstStaticCall
    | AstId
    | AstInitOf
    | AstCodeOf
    | AstString
    | AstLiteral;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
*/

type ExpressionWithName = {
    name: string;
    expression: A.AstExpression;
};

type StatementsWithName = {
    name: string;
    statements: A.AstStatement[];
    assignedStateInit: boolean;
};

type Test = {
    // Will add other stuff here for the spec file
    contract: A.AstContract;
};

interface Generator<T> {
    generate: () => T[];
}

interface GeneratorWithDeclarations<T> {
    generate: () => {
        globalDeclarations: Map<string, A.AstModuleItem>;
        contractDeclarations: Map<string, A.AstContractDeclaration>;
        items: T[];
    };
}

function createTests(astF: FactoryAst, filename: string) {
    let counter = 0;
    const maxFunCallDepth = 2;
    let currentFunDepth = 1;

    function generateInitOf(
        contract: A.AstId,
        args: A.AstExpression[],
    ): A.AstInitOf {
        return astF.createNode({
            kind: "init_of",
            args,
            contract,
            loc: dummySrcInfo,
        }) as A.AstInitOf;
    }

    function generateId(name: string): A.AstId {
        return astF.createNode({
            kind: "id",
            text: name,
            loc: dummySrcInfo,
        }) as A.AstId;
    }

    function generateTypeId(name: string): A.AstTypeId {
        return astF.createNode({
            kind: "type_id",
            text: name,
            loc: dummySrcInfo,
        }) as A.AstTypeId;
    }

    function generateTypedParameter(
        name: string,
        type: string,
    ): A.AstTypedParameter {
        return astF.createNode({
            kind: "typed_parameter",
            name: generateId(name),
            type: generateTypeId(type),
            loc: dummySrcInfo,
        }) as A.AstTypedParameter;
    }

    /*
    function generateFunctionAttribute(
        name: A.AstFunctionAttributeName,
    ): A.AstFunctionAttribute {
        return astF.createNode({
            kind: "function_attribute",
            type: name,
            loc: dummySrcInfo,
        }) as A.AstFunctionAttribute;
    }
    
    function generateBoolean(value: boolean): A.AstBoolean {
        return astF.createNode({ kind: "boolean", value, loc: dummySrcInfo }) as A.AstBoolean;
    }
    */

    function generateString(value: string): A.AstString {
        return astF.createNode({
            kind: "string",
            value,
            loc: dummySrcInfo,
        }) as A.AstString;
    }

    function generateInt(value: bigint): A.AstNumber {
        return astF.createNode({
            kind: "number",
            value,
            base: 10,
            loc: dummySrcInfo,
        }) as A.AstNumber;
    }

    /*
    function generateFreshFieldName(): A.AstId {
        const newName = `field_${counter++}`;
        return generateId(newName);
    }
    */

    function generateFreshFunctionName(): A.AstId {
        const newName = `fun_${counter++}`;
        return generateId(newName);
    }

    /*
    function generateFreshConstantName(): A.AstId {
        const newName = `CONS_${counter++}`;
        return generateId(newName);
    }
    */

    function generateFreshVarName(): A.AstId {
        const newName = `v_${counter++}`;
        return generateId(newName);
    }

    function generateBinaryExpression(
        op: A.AstBinaryOperation,
        operand1: A.AstExpression,
        operand2: A.AstExpression,
    ): A.AstOpBinary {
        return astF.createNode({
            kind: "op_binary",
            op,
            left: operand1,
            right: operand2,
            loc: dummySrcInfo,
        }) as A.AstOpBinary;
    }

    /*
    function generateConditional(boolValue: boolean, exprT: A.AstExpression, exprF: A.AstExpression): A.AstConditional {
        return astF.createNode({ kind: "conditional", condition: generateBoolean(boolValue), thenBranch: exprT, elseBranch: exprF, loc: dummySrcInfo }) as A.AstConditional;
    }
    */

    function generateMethodCall(
        name: A.AstId,
        self: A.AstExpression,
        args: A.AstExpression[],
    ): A.AstMethodCall {
        return astF.createNode({
            kind: "method_call",
            self,
            args,
            method: name,
            loc: dummySrcInfo,
        }) as A.AstMethodCall;
    }

    function generateStaticCall(
        name: A.AstId,
        args: A.AstExpression[],
    ): A.AstStaticCall {
        return astF.createNode({
            kind: "static_call",
            args,
            function: name,
            loc: dummySrcInfo,
        }) as A.AstStaticCall;
    }

    function generateStructInstance(
        type: A.AstId,
        args: A.AstStructFieldInitializer[],
    ): A.AstStructInstance {
        return astF.createNode({
            kind: "struct_instance",
            type,
            args,
            loc: dummySrcInfo,
        }) as A.AstStructInstance;
    }

    /*
    function generateContractConstant(type: A.AstTypeId, expr: A.AstExpression): { constant: A.AstId, decl: A.AstConstantDef } {
        const name = generateFreshConstantName();
        const decl = astF.createNode({ kind: "constant_def", name, type, initializer: expr, attributes: [], loc: dummySrcInfo }) as A.AstConstantDef;
        return { constant: name, decl };
    }
    
    function generateContractField(type: A.AstTypeId, expr: A.AstExpression): { field: A.AstId, decl: A.AstFieldDecl } {
        const name = generateFreshFieldName();
        const decl = astF.createNode({ kind: "field_decl", name, type, as: null, initializer: expr, loc: dummySrcInfo }) as A.AstFieldDecl;
        return { field: name, decl };
    }
    */

    function generateLetStatement(
        name: A.AstId,
        type: A.AstTypeId,
        expr: A.AstExpression,
    ): A.AstStatementLet {
        return astF.createNode({
            kind: "statement_let",
            name,
            type,
            expression: expr,
            loc: dummySrcInfo,
        }) as A.AstStatementLet;
    }

    function generateAssignStatement(
        name: A.AstId,
        expr: A.AstExpression,
    ): A.AstStatementAssign {
        return astF.createNode({
            kind: "statement_assign",
            path: name,
            expression: expr,
            loc: dummySrcInfo,
        }) as A.AstStatementAssign;
    }

    function generateStructFieldInitializer(
        name: A.AstId,
        initializer: A.AstExpression,
    ): A.AstStructFieldInitializer {
        return astF.createNode({
            kind: "struct_field_initializer",
            field: name,
            initializer,
            loc: dummySrcInfo,
        }) as A.AstStructFieldInitializer;
    }

    /*
    function generateFieldAccess(aggregate: A.AstExpression, field: A.AstId): A.AstFieldAccess {
        return astF.createNode({ kind: "field_access", aggregate, field, loc: dummySrcInfo }) as A.AstFieldAccess;
    }
    */

    function generateExpressionStatement(
        expr: A.AstExpression,
    ): A.AstStatementExpression {
        return astF.createNode({
            kind: "statement_expression",
            expression: expr,
            loc: dummySrcInfo,
        }) as A.AstStatementExpression;
    }

    function generateConditionStatement(
        cond: A.AstExpression,
        thenBranch: A.AstStatement[],
        elseBranch: A.AstStatement[] | null,
    ): A.AstStatementCondition {
        return astF.createNode({
            kind: "statement_condition",
            condition: cond,
            trueStatements: thenBranch,
            falseStatements: elseBranch,
            loc: dummySrcInfo,
        }) as A.AstStatementCondition;
    }

    function generateWhileStatement(
        cond: A.AstExpression,
        body: A.AstStatement[],
    ): A.AstStatementWhile {
        return astF.createNode({
            kind: "statement_while",
            condition: cond,
            statements: body,
            loc: dummySrcInfo,
        }) as A.AstStatementWhile;
    }

    function generateUntilStatement(
        cond: A.AstExpression,
        body: A.AstStatement[],
    ): A.AstStatementUntil {
        return astF.createNode({
            kind: "statement_until",
            condition: cond,
            statements: body,
            loc: dummySrcInfo,
        }) as A.AstStatementUntil;
    }

    function generateRepeatStatement(
        count: A.AstExpression,
        body: A.AstStatement[],
    ): A.AstStatementRepeat {
        return astF.createNode({
            kind: "statement_repeat",
            iterations: count,
            statements: body,
            loc: dummySrcInfo,
        }) as A.AstStatementRepeat;
    }

    function generateForEachStatement(
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
            loc: dummySrcInfo,
        }) as A.AstStatementForEach;
    }

    function generateDestructStatement(
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
            loc: dummySrcInfo,
        }) as A.AstStatementDestruct;
    }

    function generateBlockStatement(
        body: A.AstStatement[],
    ): A.AstStatementBlock {
        return astF.createNode({
            kind: "statement_block",
            statements: body,
            loc: dummySrcInfo,
        }) as A.AstStatementBlock;
    }

    function generateTryStatement(
        catchName: A.AstId,
        tryBody: A.AstStatement[],
        catchBody: A.AstStatement[] | undefined,
    ): A.AstStatementTry {
        const catchBlock =
            typeof catchBody !== "undefined"
                ? generateCatchBlock(catchName, catchBody)
                : undefined;
        return astF.createNode({
            kind: "statement_try",
            statements: tryBody,
            catchBlock,
            loc: dummySrcInfo,
        }) as A.AstStatementTry;
    }

    function generateCatchBlock(
        catchName: A.AstId,
        body: A.AstStatement[],
    ): A.AstCatchBlock {
        return { catchName, catchStatements: body };
    }

    function generateFunctionDefinition(
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
            loc: dummySrcInfo,
        }) as A.AstFunctionDef;
    }

    function generateReturnStatement(
        expression: A.AstExpression,
    ): A.AstStatementReturn {
        return astF.createNode({
            kind: "statement_return",
            expression,
            loc: dummySrcInfo,
        }) as A.AstStatementReturn;
    }

    function generateContractInit(stmts: A.AstStatement[]): A.AstContractInit {
        const addrExpr = generateStaticCall(generateId("contractAddress"), [
            generateId("stateInit"),
        ]);
        const addrVar = generateId("addr");
        const addrLet = generateLetStatement(
            addrVar,
            generateTypeId("Address"),
            addrExpr,
        );
        const tonExpr = generateStaticCall(generateId("ton"), [
            generateString("1"),
        ]);
        const sendParams = generateStructInstance(
            generateId("SendParameters"),
            [
                generateStructFieldInitializer(generateId("to"), addrVar),
                generateStructFieldInitializer(generateId("value"), tonExpr),
            ],
        );
        const sendExpr = generateStaticCall(generateId("send"), [sendParams]);
        const sendStmt = generateExpressionStatement(sendExpr);
        return astF.createNode({
            kind: "contract_init",
            params: [generateTypedParameter("arg", "Int")],
            statements: [...stmts, addrLet, sendStmt],
            loc: dummySrcInfo,
        }) as A.AstContractInit;
    }

    function generateContractInitNoSend(
        stmts: A.AstStatement[],
    ): A.AstContractInit {
        return astF.createNode({
            kind: "contract_init",
            params: [generateTypedParameter("arg", "Int")],
            statements: stmts,
            loc: dummySrcInfo,
        }) as A.AstContractInit;
    }

    function generateEmptyInternalReceiver(): A.AstReceiver {
        const receiverKind = astF.createNode({
            kind: "fallback",
        }) as A.AstReceiverFallback;
        const internalSelector = astF.createNode({
            kind: "internal",
            subKind: receiverKind,
            loc: dummySrcInfo,
        }) as A.AstReceiverInternal;
        return astF.createNode({
            kind: "receiver",
            selector: internalSelector,
            statements: [],
            loc: dummySrcInfo,
        }) as A.AstReceiver;
    }

    function generateContract(
        name: A.AstId,
        stmts: A.AstStatement[],
        decls: A.AstContractDeclaration[],
    ): A.AstContract {
        const init = generateContractInit(stmts);
        const receiver = generateEmptyInternalReceiver();
        const finalDecls = [...decls, init, receiver];
        return astF.createNode({
            kind: "contract",
            name,
            traits: [],
            attributes: [],
            params: [],
            declarations: finalDecls,
            loc: dummySrcInfo,
        }) as A.AstContract;
    }

    function generateContractNoSend(
        name: A.AstId,
        stmts: A.AstStatement[],
        decls: A.AstContractDeclaration[],
    ): A.AstContract {
        const init = generateContractInitNoSend(stmts);
        const receiver = generateEmptyInternalReceiver();
        const finalDecls = [...decls, init, receiver];
        return astF.createNode({
            kind: "contract",
            name,
            traits: [],
            attributes: [],
            params: [],
            declarations: finalDecls,
            loc: dummySrcInfo,
        }) as A.AstContract;
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

    function identityGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): GeneratorWithDeclarations<ExpressionWithName> {
        return {
            generate: () => {
                return {
                    globalDeclarations: new Map(),
                    contractDeclarations: new Map(),
                    items: [{ name, expression: baseExpr }],
                };
            },
        };
    }

    function staticCallGenerator(): GeneratorWithDeclarations<ExpressionWithName> {
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
                        [generateTypedParameter("arg", "Int")],
                        [returnStmt],
                        [],
                        generateTypeId("StateInit"),
                    );
                    const call = generateStaticCall(funName, [
                        generateId("arg"),
                    ]);
                    const testName = `StaticCall`;
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
                            [generateTypedParameter("arg", "Int")],
                            [...stmtWithDecls.statements, returnStmt],
                            [],
                            generateTypeId("StateInit"),
                        );
                        const call = generateStaticCall(funName, [
                            generateId("arg"),
                        ]);
                        const testName = `StaticCall_${stmtWithDecls.name}`;
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
    ): Generator<StatementsWithName> {
        return {
            generate: () => {
                const varName = generateId("stateInit");
                const varType = generateTypeId("StateInit");
                const stmtLet = generateLetStatement(
                    varName,
                    varType,
                    baseExpr,
                );
                const newName = `Let_${name}`;
                return [
                    {
                        name: newName,
                        statements: [stmtLet],
                        assignedStateInit: true,
                    },
                ];
            },
        };
    }

    function expressionStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): Generator<StatementsWithName> {
        return {
            generate: () => {
                const stmtExpr = generateExpressionStatement(baseExpr);
                const newName = `Expr_${name}`;
                return [
                    {
                        name: newName,
                        statements: [stmtExpr],
                        assignedStateInit: false,
                    },
                ];
            },
        };
    }

    function conditionStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): Generator<StatementsWithName> {
        return {
            generate: () => {
                const initVarStmt = generateLetStatement(
                    generateId("stateInit"),
                    generateTypeId("StateInit"),
                    generateInitOf(generateId("Dummy1"), []),
                );
                const cond1Expr = generateBinaryExpression(
                    "==",
                    generateBinaryExpression(
                        "-",
                        generateId("arg"),
                        generateId("arg"),
                    ),
                    generateInt(0n),
                );
                const cond2Expr = generateBinaryExpression(
                    "==",
                    generateBinaryExpression(
                        "+",
                        generateBinaryExpression(
                            "-",
                            generateId("arg"),
                            generateId("arg"),
                        ),
                        generateInt(1n),
                    ),
                    generateInt(0n),
                );

                const expr = generateAssignStatement(
                    generateId("stateInit"),
                    baseExpr,
                );
                const dummy2 = generateAssignStatement(
                    generateId("stateInit"),
                    generateInitOf(generateId("Dummy2"), []),
                );
                const case1 = generateConditionStatement(
                    cond1Expr,
                    [expr],
                    null,
                );
                const case2 = generateConditionStatement(
                    cond1Expr,
                    [expr],
                    [dummy2],
                );
                const case3 = generateConditionStatement(
                    cond2Expr,
                    [dummy2],
                    [expr],
                );

                const case1Name = `IfNoElse_${name}`;
                const case2Name = `IfThen_${name}`;
                const case3Name = `IfElse_${name}`;

                return [
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
                ];
            },
        };
    }

    function whileStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): Generator<StatementsWithName> {
        return {
            generate: () => {
                const initVarStmt = generateLetStatement(
                    generateId("stateInit"),
                    generateTypeId("StateInit"),
                    generateInitOf(generateId("Dummy1"), []),
                );
                const countVarStmt = generateLetStatement(
                    generateId("counter"),
                    generateTypeId("Int"),
                    generateBinaryExpression(
                        "-",
                        generateId("arg"),
                        generateId("arg"),
                    ),
                );
                const expr = generateAssignStatement(
                    generateId("stateInit"),
                    baseExpr,
                );
                const counterIncr = generateAssignStatement(
                    generateId("counter"),
                    generateBinaryExpression(
                        "+",
                        generateId("counter"),
                        generateInt(1n),
                    ),
                );
                const cond = generateBinaryExpression(
                    "<=",
                    generateId("counter"),
                    generateInt(2n),
                );
                const loop = generateWhileStatement(cond, [expr, counterIncr]);

                const newName = `While_${name}`;

                return [
                    {
                        name: newName,
                        statements: [initVarStmt, countVarStmt, loop],
                        assignedStateInit: true,
                    },
                ];
            },
        };
    }

    function untilStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): Generator<StatementsWithName> {
        return {
            generate: () => {
                const initVarStmt = generateLetStatement(
                    generateId("stateInit"),
                    generateTypeId("StateInit"),
                    generateInitOf(generateId("Dummy1"), []),
                );
                const countVarStmt = generateLetStatement(
                    generateId("counter"),
                    generateTypeId("Int"),
                    generateBinaryExpression(
                        "-",
                        generateId("arg"),
                        generateId("arg"),
                    ),
                );
                const expr = generateAssignStatement(
                    generateId("stateInit"),
                    baseExpr,
                );
                const counterIncr = generateAssignStatement(
                    generateId("counter"),
                    generateBinaryExpression(
                        "+",
                        generateId("counter"),
                        generateInt(1n),
                    ),
                );
                const cond = generateBinaryExpression(
                    ">=",
                    generateId("counter"),
                    generateInt(2n),
                );
                const loop = generateUntilStatement(cond, [expr, counterIncr]);

                const newName = `Until_${name}`;

                return [
                    {
                        name: newName,
                        statements: [initVarStmt, countVarStmt, loop],
                        assignedStateInit: true,
                    },
                ];
            },
        };
    }

    function repeatStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): Generator<StatementsWithName> {
        return {
            generate: () => {
                const initVarStmt = generateLetStatement(
                    generateId("stateInit"),
                    generateTypeId("StateInit"),
                    generateInitOf(generateId("Dummy1"), []),
                );
                const countVarStmt = generateLetStatement(
                    generateId("counter"),
                    generateTypeId("Int"),
                    generateStaticCall(generateId("random"), [
                        generateInt(1n),
                        generateInt(3n),
                    ]),
                );
                const expr = generateAssignStatement(
                    generateId("stateInit"),
                    baseExpr,
                );
                const loop = generateRepeatStatement(generateId("counter"), [
                    expr,
                ]);

                const newName = `Repeat_${name}`;

                return [
                    {
                        name: newName,
                        statements: [initVarStmt, countVarStmt, loop],
                        assignedStateInit: true,
                    },
                ];
            },
        };
    }

    function forEachStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): Generator<StatementsWithName> {
        return {
            generate: () => {
                const initVarStmt = generateLetStatement(
                    generateId("stateInit"),
                    generateTypeId("StateInit"),
                    generateInitOf(generateId("Dummy1"), []),
                );
                const mapVar = generateId("intMap");
                const mapVarStmt = generateLetStatement(
                    mapVar,
                    generateTypeId("map<Int,Int>"),
                    generateId("null"),
                );
                const mutateMap = generateExpressionStatement(
                    generateMethodCall(generateId("set"), mapVar, [
                        generateInt(1n),
                        generateInt(3n),
                    ]),
                );

                const expr = generateAssignStatement(
                    generateId("stateInit"),
                    baseExpr,
                );
                const loop = generateForEachStatement(
                    mapVar,
                    generateFreshVarName(),
                    generateFreshVarName(),
                    [expr],
                );

                const newName = `ForEach_${name}`;

                return [
                    {
                        name: newName,
                        statements: [initVarStmt, mapVarStmt, mutateMap, loop],
                        assignedStateInit: true,
                    },
                ];
            },
        };
    }

    function destructStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): Generator<StatementsWithName> {
        return {
            generate: () => {
                const identifiers: Map<string, [A.AstId, A.AstId]> = new Map();
                identifiers.set("init", [
                    generateId("init"),
                    generateId("stateInit"),
                ]);

                const wrapped = generateStructInstance(
                    generateId("StateInitWrapper"),
                    [
                        generateStructFieldInitializer(
                            generateId("init"),
                            baseExpr,
                        ),
                    ],
                );

                const unwrapped = generateDestructStatement(
                    wrapped,
                    identifiers,
                    generateTypeId("StateInitWrapper"),
                );

                const newName = `Destruct_${name}`;

                return [
                    {
                        name: newName,
                        statements: [unwrapped],
                        assignedStateInit: true,
                    },
                ];
            },
        };
    }

    function blockStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): Generator<StatementsWithName> {
        return {
            generate: () => {
                const initVarStmt = generateLetStatement(
                    generateId("stateInit"),
                    generateTypeId("StateInit"),
                    generateInitOf(generateId("Dummy1"), []),
                );

                const exprStmt = generateAssignStatement(
                    generateId("stateInit"),
                    baseExpr,
                );

                const stmt = generateBlockStatement([exprStmt]);

                const newName = `Block_${name}`;

                return [
                    {
                        name: newName,
                        statements: [initVarStmt, stmt],
                        assignedStateInit: true,
                    },
                ];
            },
        };
    }

    function tryStatementGenerator(
        baseExpr: A.AstExpression,
        name: string,
    ): Generator<StatementsWithName> {
        return {
            generate: () => {
                const initVarStmt = generateLetStatement(
                    generateId("stateInit"),
                    generateTypeId("StateInit"),
                    generateInitOf(generateId("Dummy1"), []),
                );

                const exprStmt = generateAssignStatement(
                    generateId("stateInit"),
                    baseExpr,
                );
                const divByZeroStmt = generateExpressionStatement(
                    generateBinaryExpression(
                        "/",
                        generateInt(1n),
                        generateBinaryExpression(
                            "-",
                            generateId("arg"),
                            generateId("arg"),
                        ),
                    ),
                );

                const case1 = generateTryStatement(
                    generateFreshVarName(),
                    [exprStmt],
                    undefined,
                );
                const case2 = generateTryStatement(
                    generateFreshVarName(),
                    [divByZeroStmt],
                    [exprStmt],
                );

                const case1Name = `Try_${name}`;
                const case2Name = `Catch_${name}`;

                return [
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
                ];
            },
        };
    }

    function expressionGenerator(): GeneratorWithDeclarations<ExpressionWithName> {
        return {
            generate: () => {
                const initOf = generateInitOf(generateId("Deployer"), []);

                const exprGens = [
                    identityGenerator(initOf, "InitOf"),
                    staticCallGenerator(),
                    //methodCallGenerator(),
                    //contractConstantGenerator(initOf),
                    //contractFieldGenerator(initOf)
                ];

                const finalGlobalDecls: Map<string, A.AstModuleItem> =
                    new Map();
                const finalContractDecls: Map<
                    string,
                    A.AstContractDeclaration
                > = new Map();
                const finalItems: ExpressionWithName[] = [];

                for (const gen of exprGens) {
                    const genResult = gen.generate();
                    genResult.globalDeclarations.forEach((value, key) => {
                        finalGlobalDecls.set(key, value);
                    });
                    genResult.contractDeclarations.forEach((value, key) => {
                        finalContractDecls.set(key, value);
                    });
                    finalItems.push(...genResult.items);
                }

                return {
                    globalDeclarations: finalGlobalDecls,
                    contractDeclarations: finalContractDecls,
                    items: finalItems,
                };
            },
        };
    }

    function statementGenerator(): GeneratorWithDeclarations<StatementsWithName> {
        return {
            generate: () => {
                const finalItems: StatementsWithName[] = [];

                const exprGenResult = expressionGenerator().generate();

                for (const exprWithName of exprGenResult.items) {
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
                        ),
                        forEachStatementGenerator(
                            exprWithName.expression,
                            exprWithName.name,
                        ),
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

                    for (const gen of stmtGens) {
                        for (const genResult of gen.generate()) {
                            finalItems.push({
                                name: genResult.name,
                                statements: genResult.statements,
                                assignedStateInit: genResult.assignedStateInit,
                            });
                        }
                    }
                }

                return {
                    globalDeclarations: exprGenResult.globalDeclarations,
                    contractDeclarations: exprGenResult.contractDeclarations,
                    items: finalItems,
                };
            },
        };
    }

    function contractGenerator(): GeneratorWithDeclarations<A.AstContract> {
        return {
            generate: () => {
                const finalContracts: A.AstContract[] = [];

                const stmtGenResult = statementGenerator().generate();
                const contractDecls = Array.from(
                    stmtGenResult.contractDeclarations.values(),
                );

                for (const stmtWithDecls of stmtGenResult.items) {
                    if (stmtWithDecls.assignedStateInit) {
                        const contract1 = generateContract(
                            generateId(stmtWithDecls.name),
                            stmtWithDecls.statements,
                            contractDecls,
                        );
                        finalContracts.push(contract1);
                    }
                    const contract2 = generateContractNoSend(
                        generateId(stmtWithDecls.name + "_NoSend"),
                        stmtWithDecls.statements,
                        contractDecls,
                    );
                    finalContracts.push(contract2);
                }

                return {
                    globalDeclarations: stmtGenResult.globalDeclarations,
                    contractDeclarations: new Map(),
                    items: finalContracts,
                };
            },
        };
    }

    function createTest(res: A.AstContract): Test {
        return { contract: res };
    }

    function serializeTests(tests: Test[], globalDecls: A.AstModuleItem[]) {
        const allDecls: A.AstModuleItem[] = [...globalDecls];

        for (const test of tests) {
            allDecls.push(test.contract);
        }

        const tactCode = prettyPrint(
            astF.createNode({ kind: "module", imports: [], items: allDecls }),
        );

        // Attach Dummies and Deployer contracts, plus structs and messages for tests
        const finalTactCode = `
${tactCode}

message DeployMessage {
    addr: Address;
    data: Cell;
    code: Cell;
}

struct StateInitWrapper {
    init: StateInit;
}

contract Dummy1 { }

contract Dummy2 { }

contract Deployer {
    receive(msg: DeployMessage) {
        let addr = msg.addr;
        let data = msg.data;
        let code = msg.code;
        send(SendParameters{to: addr, bounce: false, value: ton("10"), data: data, code: code});
    }
}
`;

        fs.writeFileSync(
            path.join(__dirname, "contracts", filename),
            finalTactCode,
        );
    }

    const tests: Test[] = [];

    const genResult = contractGenerator().generate();

    for (const contract of genResult.items) {
        tests.push(createTest(contract));
    }

    serializeTests(tests, Array.from(genResult.globalDeclarations.values()));
}

createTests(getAstFactory(), "initof-reachability.tact");
