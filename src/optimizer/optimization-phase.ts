import {
    getAllStaticConstants,
    getAllStaticFunctions,
    getAllTypes,
} from "../types/resolveDescriptors";
import { writeFile } from "node:fs/promises";
import { simplifyAllExpressions } from "./expr-simplification";
import { TypeDescription } from "../types/types";
import {
    expHasType,
    getExpType,
    registerExpType,
} from "../types/resolveExpression";
import {
    AstCondition,
    AstConditional,
    AstConstantDef,
    AstContract,
    AstContractDeclaration,
    AstContractInit,
    AstExpression,
    AstFieldAccess,
    AstFieldDecl,
    AstFunctionDef,
    AstInitOf,
    AstMessageDecl,
    AstMethodCall,
    AstModule,
    AstModuleItem,
    AstOpBinary,
    AstOpUnary,
    AstReceiver,
    AstStatement,
    AstStatementAssign,
    AstStatementAugmentedAssign,
    AstStatementBlock,
    AstStatementDestruct,
    AstStatementExpression,
    AstStatementForEach,
    AstStatementLet,
    AstStatementRepeat,
    AstStatementReturn,
    AstStatementTry,
    AstStatementUntil,
    AstStatementWhile,
    AstStaticCall,
    AstStructDecl,
    AstStructFieldInitializer,
    AstStructFieldValue,
    AstStructInstance,
    AstTrait,
    AstTraitDeclaration,
    AstTypeDecl,
    FactoryAst,
    isAstExpression,
} from "../ast/ast";
import { CompilerContext } from "../context/context";
import { throwInternalCompilerError } from "../error/errors";
import { prettyPrint } from "../ast/ast-printer";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";

/* These are the node types that the optimization phase is allowed to modify */
type AstMutableNode =
    | AstExpression
    | AstStatement
    | AstTypeDecl
    | AstFieldDecl
    | AstFunctionDef
    | AstModule
    | AstContractInit
    | AstReceiver
    | AstConstantDef
    | AstStructFieldInitializer
    | AstStructFieldValue;

// Other events will be added in the future.
type ChangeEvent = NodeReplacementEvent;

type NodeReplacementEvent = {
    kind: "node_replacement";
    timestamp: number;
    nodeToReplace: AstMutableNode;
    newNode: AstMutableNode;
};

type OptimizerChangeLog = {
    changeEvents: ChangeEvent[];
};

export type OptimizationContext = {
    originalAst: AstModule;
    modifiedAst: AstModule;
    log: OptimizerChangeLog;
    ctx: CompilerContext;
    factoryAst: FactoryAst;
};

export function optimizeTact(ctx: OptimizationContext) {
    // Call the expression simplification phase
    simplifyAllExpressions(ctx);

    // Here, we will call constant propagation
}

function getInitialOptimizationContext(
    ast: AstModule,
    ctx: CompilerContext,
    factoryAst: FactoryAst,
): OptimizationContext {
    return {
        originalAst: ast,
        // Initially, the modified tree is just the initial tree
        modifiedAst: ast,
        log: { changeEvents: [] },
        ctx: ctx,
        factoryAst: factoryAst,
    };
}

export function prepareAstForOptimization(
    ctx: CompilerContext,
    factoryAst: FactoryAst,
    doOptimizationFlag: boolean,
): OptimizationContext {
    const moduleAst = createTopLevelModule();
    const optCtx = getInitialOptimizationContext(moduleAst, ctx, factoryAst);

    if (doOptimizationFlag) {
        optCtx.modifiedAst = makeUnfrozenCopyOfModule(moduleAst);
    }

    return optCtx;

    function createTopLevelModule(): AstModule {
        // Create a module AST that stores the entire program.
        const moduleItems: AstModuleItem[] = [];

        // Extract constants
        for (const c of getAllStaticConstants(ctx)) {
            if (c.ast.kind === "constant_decl") {
                throwInternalCompilerError(
                    "Constant declarations cannot be top level module declarations.",
                );
            }
            moduleItems.push(c.ast);
        }

        // Extract functions
        for (const f of getAllStaticFunctions(ctx)) {
            if (f.ast.kind === "function_decl") {
                throwInternalCompilerError(
                    "Function declarations cannot be top level module declarations.",
                );
            }
            moduleItems.push(f.ast);
        }

        // Extract type declarations
        for (const t of getAllTypes(ctx)) {
            // There is no need to optimize traits because they get coalesced into the contracts.
            if (t.kind !== "trait") {
                loadTypeDeclarations(t, moduleItems);
            }
        }

        // Uses an empty list of imports. AstModule nodes will be deleted at the end of the optimization phase anyway,
        // because everything needs to be put back into the format used by CompilerContext
        const moduleAst = factoryAst.createNode({
            kind: "module",
            items: moduleItems,
            imports: [],
        }) as AstModule;

        return moduleAst;
    }

    function loadTypeDeclarations(
        t: TypeDescription,
        moduleItems: AstModuleItem[],
    ) {
        switch (t.ast.kind) {
            case "primitive_type_decl":
            case "struct_decl":
            case "message_decl": {
                // These types do not have declarations beyond what is inside the struct, message or primitive type.
                moduleItems.push(t.ast);

                // But any extension functions declared for them should be added as module items.
                for (const [_, f] of t.functions) {
                    if (f.ast.kind === "function_decl") {
                        throwInternalCompilerError(
                            "Function declarations cannot be top level module declarations.",
                        );
                    }
                    moduleItems.push(f.ast);
                }
                break;
            }
            case "contract": {
                moduleItems.push(loadContractDeclarations(t, t.ast));
                break;
            }
            case "trait": {
                throwInternalCompilerError(
                    "Trait kind should not be reachable",
                );
                break;
            }
            default:
                throwInternalCompilerError(
                    "Unrecognized kind of type declaration",
                );
        }
    }

    function loadContractDeclarations(
        t: TypeDescription,
        ast: AstContract,
    ): AstContract {
        const contractDecls: AstContractDeclaration[] = [];

        if (t.init) {
            contractDecls.push(t.init.ast);
        }

        for (const c of t.constants) {
            if (c.ast.kind === "constant_decl") {
                throwInternalCompilerError(
                    "Constant declarations (i.e., without initializer) cannot be contract members",
                );
            }
            contractDecls.push(c.ast);
        }

        for (const f of t.fields) {
            contractDecls.push(f.ast);
        }

        for (const [_, f] of t.functions) {
            if (
                f.ast.kind === "function_decl" ||
                f.ast.kind === "native_function_decl"
            ) {
                throwInternalCompilerError(
                    "Functions without a body cannot be contract members",
                );
            }
            contractDecls.push(f.ast);
        }

        for (const r of t.receivers) {
            contractDecls.push(r.ast);
        }

        const contractDecl = factoryAst.cloneNode(ast);
        contractDecl.declarations = contractDecls;
        return contractDecl;
    }

    function makeUnfrozenCopyOfModule(ast: AstModule): AstModule {
        const newItems: AstModuleItem[] = [];

        for (const moduleItem of ast.items) {
            switch (moduleItem.kind) {
                case "asm_function_def":
                case "native_function_decl":
                case "primitive_type_decl": {
                    // These kinds are not modified by the optimizer at this moment.
                    // So, just pass the [frozen] node.
                    newItems.push(moduleItem);
                    break;
                }
                case "constant_def": {
                    newItems.push(makeUnfrozenCopyOfConstantDef(moduleItem));
                    break;
                }
                case "function_def": {
                    newItems.push(makeUnfrozenCopyOfFunctionDef(moduleItem));
                    break;
                }
                case "message_decl": {
                    newItems.push(makeUnfrozenCopyOfMessageDecl(moduleItem));
                    break;
                }
                case "struct_decl": {
                    newItems.push(makeUnfrozenCopyOfStructDecl(moduleItem));
                    break;
                }
                case "trait": {
                    // In theory, this case will not happen. But added for completeness.
                    newItems.push(makeUnfrozenCopyOfTrait(moduleItem));
                    break;
                }
                case "contract": {
                    newItems.push(makeUnfrozenCopyOfContract(moduleItem));
                    break;
                }
                default:
                    throwInternalCompilerError("Unrecognized AstMutable node");
            }
        }

        const newModuleNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newModuleNode.items = newItems;

        registerAstNodeChange(optCtx, ast, newModuleNode);
        return newModuleNode;
    }

    function makeUnfrozenCopyOfConstantDef(
        ast: AstConstantDef,
    ): AstConstantDef {
        const newInitializer = makeUnfrozenCopyOfExpression(ast.initializer);
        const newConstantDefNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newConstantDefNode.initializer = newInitializer;

        registerAstNodeChange(optCtx, ast, newConstantDefNode);
        return newConstantDefNode;
    }

    function makeUnfrozenCopyOfFunctionDef(
        ast: AstFunctionDef,
    ): AstFunctionDef {
        const newStatements = ast.statements.map((stmt) =>
            makeUnfrozenCopyOfStatement(stmt),
        );
        const newFunctionDefNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newFunctionDefNode.statements = newStatements;

        registerAstNodeChange(optCtx, ast, newFunctionDefNode);
        return newFunctionDefNode;
    }

    function makeUnfrozenCopyOfMessageDecl(
        ast: AstMessageDecl,
    ): AstMessageDecl {
        const newFields = ast.fields.map((field) =>
            makeUnfrozenCopyOfFieldDecl(field),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.fields = newFields;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfStructDecl(ast: AstStructDecl): AstStructDecl {
        const newFields = ast.fields.map((field) =>
            makeUnfrozenCopyOfFieldDecl(field),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.fields = newFields;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfTrait(ast: AstTrait): AstTrait {
        const newDeclarations: AstTraitDeclaration[] = [];

        for (const decl of ast.declarations) {
            switch (decl.kind) {
                case "asm_function_def":
                case "constant_decl":
                case "function_decl": {
                    // These kinds are not changed by the optimizer
                    newDeclarations.push(decl);
                    break;
                }
                case "field_decl": {
                    newDeclarations.push(makeUnfrozenCopyOfFieldDecl(decl));
                    break;
                }
                case "constant_def": {
                    newDeclarations.push(makeUnfrozenCopyOfConstantDef(decl));
                    break;
                }
                case "function_def": {
                    newDeclarations.push(makeUnfrozenCopyOfFunctionDef(decl));
                    break;
                }
                case "receiver": {
                    newDeclarations.push(makeUnfrozenCopyOfReceiver(decl));
                    break;
                }
                default:
                    throwInternalCompilerError(
                        "Unrecognized AstTrait declaration kind",
                    );
            }
        }

        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.declarations = newDeclarations;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfContract(ast: AstContract): AstContract {
        const newDeclarations: AstContractDeclaration[] = [];

        for (const decl of ast.declarations) {
            switch (decl.kind) {
                case "asm_function_def": {
                    // This kind is not changed by the optimizer
                    newDeclarations.push(decl);
                    break;
                }
                case "field_decl": {
                    newDeclarations.push(makeUnfrozenCopyOfFieldDecl(decl));
                    break;
                }
                case "constant_def": {
                    newDeclarations.push(makeUnfrozenCopyOfConstantDef(decl));
                    break;
                }
                case "function_def": {
                    newDeclarations.push(makeUnfrozenCopyOfFunctionDef(decl));
                    break;
                }
                case "receiver": {
                    newDeclarations.push(makeUnfrozenCopyOfReceiver(decl));
                    break;
                }
                case "contract_init": {
                    newDeclarations.push(makeUnfrozenCopyOfContractInit(decl));
                    break;
                }
                default:
                    throwInternalCompilerError(
                        "Unrecognized AstContract declaration kind",
                    );
            }
        }

        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.declarations = newDeclarations;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfFieldDecl(ast: AstFieldDecl): AstFieldDecl {
        if (ast.initializer === null) {
            // If there is no initializer expression,
            // just use the original node because there is nothing to change
            return ast;
        }

        const newInitializer = makeUnfrozenCopyOfExpression(ast.initializer);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.initializer = newInitializer;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfReceiver(ast: AstReceiver): AstReceiver {
        const newStatements = ast.statements.map((stmt) =>
            makeUnfrozenCopyOfStatement(stmt),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.statements = newStatements;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfContractInit(
        ast: AstContractInit,
    ): AstContractInit {
        const newStatements = ast.statements.map((stmt) =>
            makeUnfrozenCopyOfStatement(stmt),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.statements = newStatements;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfStatement(ast: AstStatement): AstStatement {
        switch (ast.kind) {
            case "statement_assign": {
                return makeUnfrozenCopyOfAssign(ast);
            }
            case "statement_augmentedassign": {
                return makeUnfrozenCopyOfAugmentedAssign(ast);
            }
            case "statement_expression": {
                return makeUnfrozenCopyOfStatementExpression(ast);
            }
            case "statement_let": {
                return makeUnfrozenCopyOfLet(ast);
            }
            case "statement_destruct": {
                return makeUnfrozenCopyOfDestruct(ast);
            }
            case "statement_return": {
                return makeUnfrozenCopyOfReturn(ast);
            }
            case "statement_until": {
                return makeUnfrozenCopyOfUntil(ast);
            }
            case "statement_while": {
                return makeUnfrozenCopyOfWhile(ast);
            }
            case "statement_repeat": {
                return makeUnfrozenCopyOfRepeat(ast);
            }
            case "statement_foreach": {
                return makeUnfrozenCopyOfForEach(ast);
            }
            case "statement_condition": {
                return makeUnfrozenCopyOfCondition(ast);
            }
            case "statement_try": {
                return makeUnfrozenCopyOfTry(ast);
            }
            case "statement_block": {
                return makeUnfrozenCopyOfBlock(ast);
            }
            default:
                throwInternalCompilerError("Unrecognized AstStatement kind");
        }
    }

    function makeUnfrozenCopyOfAssign(
        ast: AstStatementAssign,
    ): AstStatementAssign {
        const newExpr = makeUnfrozenCopyOfExpression(ast.expression);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.expression = newExpr;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfAugmentedAssign(
        ast: AstStatementAugmentedAssign,
    ): AstStatementAugmentedAssign {
        const newExpr = makeUnfrozenCopyOfExpression(ast.expression);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.expression = newExpr;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfStatementExpression(
        ast: AstStatementExpression,
    ): AstStatementExpression {
        const newExpr = makeUnfrozenCopyOfExpression(ast.expression);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.expression = newExpr;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfLet(ast: AstStatementLet): AstStatementLet {
        const newExpr = makeUnfrozenCopyOfExpression(ast.expression);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.expression = newExpr;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfDestruct(
        ast: AstStatementDestruct,
    ): AstStatementDestruct {
        const newExpr = makeUnfrozenCopyOfExpression(ast.expression);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.expression = newExpr;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfReturn(
        ast: AstStatementReturn,
    ): AstStatementReturn {
        if (ast.expression === null) {
            return ast;
        }
        const newExpr = makeUnfrozenCopyOfExpression(ast.expression);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.expression = newExpr;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfUntil(
        ast: AstStatementUntil,
    ): AstStatementUntil {
        const newCondition = makeUnfrozenCopyOfExpression(ast.condition);
        const newStatements = ast.statements.map((stmt) =>
            makeUnfrozenCopyOfStatement(stmt),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.condition = newCondition;
        newNode.statements = newStatements;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfWhile(
        ast: AstStatementWhile,
    ): AstStatementWhile {
        const newCondition = makeUnfrozenCopyOfExpression(ast.condition);
        const newStatements = ast.statements.map((stmt) =>
            makeUnfrozenCopyOfStatement(stmt),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.condition = newCondition;
        newNode.statements = newStatements;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfRepeat(
        ast: AstStatementRepeat,
    ): AstStatementRepeat {
        const newIterations = makeUnfrozenCopyOfExpression(ast.iterations);
        const newStatements = ast.statements.map((stmt) =>
            makeUnfrozenCopyOfStatement(stmt),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.iterations = newIterations;
        newNode.statements = newStatements;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfForEach(
        ast: AstStatementForEach,
    ): AstStatementForEach {
        const newMap = makeUnfrozenCopyOfExpression(ast.map);
        const newStatements = ast.statements.map((stmt) =>
            makeUnfrozenCopyOfStatement(stmt),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.map = newMap;
        newNode.statements = newStatements;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfCondition(ast: AstCondition): AstCondition {
        const newCondition = makeUnfrozenCopyOfExpression(ast.condition);
        const newTrueStatements = ast.trueStatements.map((stmt) =>
            makeUnfrozenCopyOfStatement(stmt),
        );
        const newFalseStatements =
            ast.falseStatements !== null
                ? ast.falseStatements.map((stmt) =>
                      makeUnfrozenCopyOfStatement(stmt),
                  )
                : null;
        const newElseIf =
            ast.elseif !== null
                ? makeUnfrozenCopyOfCondition(ast.elseif)
                : null;
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.condition = newCondition;
        newNode.trueStatements = newTrueStatements;
        newNode.falseStatements = newFalseStatements;
        newNode.elseif = newElseIf;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfTry(ast: AstStatementTry): AstStatementTry {
        const newStatements = ast.statements.map((stmt) =>
            makeUnfrozenCopyOfStatement(stmt),
        );
        if (ast.catchBlock) {
            const catchStatements = ast.catchBlock.catchStatements.map((stmt) =>
                makeUnfrozenCopyOfStatement(stmt),
            );
            const newNode = factoryAst.cloneNode(ast);
            // The rest of properties will not be touched by the optimizer.
            newNode.statements = newStatements;
            newNode.catchBlock = {
                catchName: ast.catchBlock.catchName,
                catchStatements: catchStatements,
            };

            registerAstNodeChange(optCtx, ast, newNode);
            return newNode;
        } else {
            const newNode = factoryAst.cloneNode(ast);
            // The rest of properties will not be touched by the optimizer.
            newNode.statements = newStatements;
            newNode.catchBlock = undefined;

            registerAstNodeChange(optCtx, ast, newNode);
            return newNode;
        }
    }

    function makeUnfrozenCopyOfBlock(
        ast: AstStatementBlock,
    ): AstStatementBlock {
        const newStatements = ast.statements.map((stmt) =>
            makeUnfrozenCopyOfStatement(stmt),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.statements = newStatements;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfExpression(ast: AstExpression): AstExpression {
        switch (ast.kind) {
            case "id":
            case "null":
            case "boolean":
            case "number":
            case "string":
            case "address":
            case "cell":
            case "slice":
            case "comment_value":
            case "simplified_string":
            case "struct_value":
                // These leaf nodes are never changed inside because they represent values or freshly generated names (in the case of ids).
                return ast;
            case "struct_instance":
                return makeUnfrozenCopyOfStructInstance(ast);
            case "field_access":
                return makeUnfrozenCopyOfFieldAccess(ast);
            case "method_call":
                return makeUnfrozenCopyOfMethodCall(ast);
            case "static_call":
                return makeUnfrozenCopyOfStaticCall(ast);
            case "op_unary":
                return makeUnfrozenCopyOfUnaryOp(ast);
            case "op_binary":
                return makeUnfrozenCopyOfBinaryOp(ast);
            case "init_of":
                return makeUnfrozenCopyOfInitOf(ast);
            case "conditional":
                return makeUnfrozenCopyOfConditional(ast);
            default:
                throwInternalCompilerError("Unrecognized AstExpression kind");
        }
    }

    function makeUnfrozenCopyOfStructInstance(
        ast: AstStructInstance,
    ): AstStructInstance {
        const newArgs = ast.args.map((initializer) =>
            makeUnfrozenCopyOfFieldInitializer(initializer),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.args = newArgs;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfFieldAccess(
        ast: AstFieldAccess,
    ): AstFieldAccess {
        const newAggregate = makeUnfrozenCopyOfExpression(ast.aggregate);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.aggregate = newAggregate;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfMethodCall(ast: AstMethodCall): AstMethodCall {
        const newArgs = ast.args.map((expr) =>
            makeUnfrozenCopyOfExpression(expr),
        );
        const newSelf = makeUnfrozenCopyOfExpression(ast.self);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.args = newArgs;
        newNode.self = newSelf;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfStaticCall(ast: AstStaticCall): AstStaticCall {
        const newArgs = ast.args.map((expr) =>
            makeUnfrozenCopyOfExpression(expr),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.args = newArgs;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfUnaryOp(ast: AstOpUnary): AstOpUnary {
        const newOperand = makeUnfrozenCopyOfExpression(ast.operand);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.operand = newOperand;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfBinaryOp(ast: AstOpBinary): AstOpBinary {
        const newLeft = makeUnfrozenCopyOfExpression(ast.left);
        const newRight = makeUnfrozenCopyOfExpression(ast.right);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.left = newLeft;
        newNode.right = newRight;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfInitOf(ast: AstInitOf): AstInitOf {
        const newArgs = ast.args.map((expr) =>
            makeUnfrozenCopyOfExpression(expr),
        );
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.args = newArgs;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfConditional(
        ast: AstConditional,
    ): AstConditional {
        const newCondition = makeUnfrozenCopyOfExpression(ast.condition);
        const newThen = makeUnfrozenCopyOfExpression(ast.thenBranch);
        const newElse = makeUnfrozenCopyOfExpression(ast.elseBranch);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.condition = newCondition;
        newNode.thenBranch = newThen;
        newNode.elseBranch = newElse;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }

    function makeUnfrozenCopyOfFieldInitializer(
        ast: AstStructFieldInitializer,
    ): AstStructFieldInitializer {
        const newInitializer = makeUnfrozenCopyOfExpression(ast.initializer);
        const newNode = factoryAst.cloneNode(ast);
        // The rest of properties will not be touched by the optimizer.
        newNode.initializer = newInitializer;

        registerAstNodeChange(optCtx, ast, newNode);
        return newNode;
    }
}

export function updateCompilerContext(optCtx: OptimizationContext) {
    const nodeReplacements = extractFinalNodeReplacementsFromLog(optCtx.log);

    processStaticFunctions(optCtx.ctx, nodeReplacements);

    processStaticConstants(optCtx.ctx, nodeReplacements);

    processTypes(optCtx.ctx, nodeReplacements);
}

export function dumpTactCode(vfs: VirtualFileSystem, file: string, ast: AstModule,) {
    const program = prettyPrint(ast);

    vfs.writeFile(file, program);
}

export function registerAstNodeChange(
    optCtx: OptimizationContext,
    nodeToReplace: AstMutableNode,
    newNode: AstMutableNode,
) {
    optCtx.log.changeEvents.push({
        kind: "node_replacement",
        timestamp: Date.now(),
        nodeToReplace: nodeToReplace,
        newNode: newNode,
    });

    // To maintain consistency with the CompilerContext, register the
    // type of the new expression (in case the nodes are expressions).
    if (isAstExpression(nodeToReplace) && isAstExpression(newNode)) {
        if (!expHasType(optCtx.ctx, newNode)) {
            optCtx.ctx = registerExpType(
                optCtx.ctx,
                newNode,
                getExpType(optCtx.ctx, nodeToReplace),
            );
        }
    }
}

function extractFinalNodeReplacementsFromLog(
    log: OptimizerChangeLog,
): Map<number, AstMutableNode> {
    const allChanges: Map<number, NodeReplacementEvent> = new Map();
    const result: Map<number, AstMutableNode> = new Map();

    // First, extract all node replacements into a map
    for (const event of log.changeEvents) {
        if (allChanges.has(event.newNode.id)) {
            console.log("Panic!");
        }
        allChanges.set(event.nodeToReplace.id, event);
    }

    // Compute the nodes that were in the original ast: they are those
    // that are not target of a change in allChanges. Index them by their IDs.
    const initialNodes = new Map(allChanges);
    for (const [_, event] of allChanges) {
        initialNodes.delete(event.newNode.id);
    }

    // Compute the transitive closure of all initial nodes.
    // The final map will have the final nodes into which the original nodes were replaced to.
    for (const [id, event] of initialNodes) {
        result.set(id, getFinalNode(event.nodeToReplace));
    }

    return result;

    function getFinalNode(initialNode: AstMutableNode): AstMutableNode {
        const event = allChanges.get(initialNode.id);
        if (typeof event !== "undefined") {
            return getFinalNode(event.newNode);
        } else {
            return initialNode;
        }
    }
}

function processStaticFunctions(
    ctx: CompilerContext,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const f of getAllStaticFunctions(ctx)) {
        const node = nodeReplacements.get(f.ast.id);
        if (typeof node !== "undefined") {
            f.ast = ensureFunction(node);
        }
    }
}

function processStaticConstants(
    ctx: CompilerContext,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const c of getAllStaticConstants(ctx)) {
        const node = nodeReplacements.get(c.ast.id);
        if (typeof node !== "undefined") {
            c.ast = ensureConstant(node);
        }
    }
}

function processTypeInitDescription(
    t: TypeDescription,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    if (t.init === null) {
        return;
    }

    const node = nodeReplacements.get(t.init.ast.id);
    if (typeof node !== "undefined") {
        t.init.ast = ensureContractInit(node);
    }
}

function processTypeConstantDescriptions(
    t: TypeDescription,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const c of t.constants) {
        const node = nodeReplacements.get(c.ast.id);
        if (typeof node !== "undefined") {
            c.ast = ensureConstant(node);
        }
    }
}

function processTypeFieldDescriptions(
    t: TypeDescription,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const f of t.fields) {
        const node = nodeReplacements.get(f.ast.id);
        if (typeof node !== "undefined") {
            f.ast = ensureFieldDecl(node);
        }
    }
}

function processTypeReceiverDescriptions(
    t: TypeDescription,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const r of t.receivers) {
        const node = nodeReplacements.get(r.ast.id);
        if (typeof node !== "undefined") {
            r.ast = ensureReceiver(node);
        }
    }
}

function processTypeFunctionDescriptions(
    t: TypeDescription,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const [_, m] of t.functions) {
        const node = nodeReplacements.get(m.ast.id);
        if (typeof node !== "undefined") {
            m.ast = ensureFunction(node);
        }
    }
}

function processTypes(
    ctx: CompilerContext,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const t of getAllTypes(ctx)) {
        processTypeInitDescription(t, nodeReplacements);

        processTypeConstantDescriptions(t, nodeReplacements);

        processTypeFieldDescriptions(t, nodeReplacements);

        processTypeReceiverDescriptions(t, nodeReplacements);

        processTypeFunctionDescriptions(t, nodeReplacements);
    }
}

function ensureFunction(ast: AstMutableNode): AstFunctionDef {
    // Type AstMutableNode restricts the possibilities of the
    // function type to AstFunctionDef
    if (ast.kind === "function_def") {
        return ast;
    } else {
        throwInternalCompilerError(`kind ${ast.kind} is not a function kind`);
    }
}

function ensureConstant(ast: AstMutableNode): AstConstantDef {
    // Type AstMutableNode restricts the possibilities of the
    // constant type to AstConstantDef
    if (ast.kind === "constant_def") {
        return ast;
    } else {
        throwInternalCompilerError(`kind ${ast.kind} is not a constant kind`);
    }
}

function ensureContractInit(ast: AstMutableNode): AstContractInit {
    if (ast.kind === "contract_init") {
        return ast;
    } else {
        throwInternalCompilerError(
            `kind ${ast.kind} is not a contract initialization method`,
        );
    }
}

function ensureFieldDecl(ast: AstMutableNode): AstFieldDecl {
    if (ast.kind === "field_decl") {
        return ast;
    } else {
        throwInternalCompilerError(
            `kind ${ast.kind} is not a field declaration`,
        );
    }
}

function ensureReceiver(ast: AstMutableNode): AstReceiver {
    if (ast.kind === "receiver") {
        return ast;
    } else {
        throwInternalCompilerError(`kind ${ast.kind} is not a receiver`);
    }
}
