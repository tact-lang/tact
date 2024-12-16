import { CompilerContext } from "../context";
import { throwInternalCompilerError } from "../errors";
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
    AstStatementDestruct,
    AstStatementExpression,
    AstStatementForEach,
    AstStatementLet,
    AstStatementRepeat,
    AstStatementReturn,
    AstStatementTry,
    AstStatementTryCatch,
    AstStatementUntil,
    AstStatementWhile,
    AstStaticCall,
    AstStructDecl,
    AstStructFieldInitializer,
    AstStructInstance,
    AstTrait,
    AstTraitDeclaration,
    AstTypeDecl,
    cloneAstNode,
    createAstNode,
    isAstExpression,
} from "../grammar/ast";
import { prettyPrint } from "../prettyPrinter";
import {
    getAllStaticConstants,
    getAllStaticFunctions,
    getAllTypes,
} from "../types/resolveDescriptors";
import { writeFile } from "node:fs/promises";
import { simplifyAllExpressions } from "./expr-simplification";
import { TypeDescription } from "../types/types";
import { getExpTypeById, registerExpType } from "../types/resolveExpression";

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
    | AstStructFieldInitializer;

export type OptimizationContext = {
    originalAst: AstModule;
    modifiedAst: AstModule;
    nodeReplacements: Map<number, AstMutableNode>;
    originalIDs: Map<number, number>;
    ctx: CompilerContext;
};

export function optimizeTact(ctx: OptimizationContext) {
    // Call the expression simplification phase
    simplifyAllExpressions(ctx);

    // Here, we will call the constant propagation analyzer
}

export function prepareAstForOptimization(
    ctx: CompilerContext,
    doOptimizationFlag: boolean,
): OptimizationContext {
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
        moduleItems.push(t.ast);
    }

    // Uses an empty list of imports. AstModule nodes will be deleted at the end of the optimization phase anyway,
    // because everything needs to be put back into the format inside of CompilerContext
    const moduleAst = createAstNode({
        kind: "module",
        items: moduleItems,
        imports: [],
    }) as AstModule;

    if (doOptimizationFlag) {
        const changedIds: Map<number, AstMutableNode> = new Map();
        const newAst = makeUnfrozenCopyOfModule(moduleAst, changedIds);
        return buildOptimizationContext(moduleAst, newAst, changedIds, ctx);
    } else {
        return buildOptimizationContext(moduleAst, moduleAst, new Map(), ctx);
    }
}

function makeUnfrozenCopyOfModule(
    ast: AstModule,
    changedNodeIds: Map<number, AstMutableNode>,
): AstModule {
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
                newItems.push(
                    makeUnfrozenCopyOfConstantDef(moduleItem, changedNodeIds),
                );
                break;
            }
            case "function_def": {
                newItems.push(
                    makeUnfrozenCopyOfFunctionDef(moduleItem, changedNodeIds),
                );
                break;
            }
            case "message_decl": {
                newItems.push(
                    makeUnfrozenCopyOfMessageDecl(moduleItem, changedNodeIds),
                );
                break;
            }
            case "struct_decl": {
                newItems.push(
                    makeUnfrozenCopyOfStructDecl(moduleItem, changedNodeIds),
                );
                break;
            }
            case "trait": {
                newItems.push(
                    makeUnfrozenCopyOfTrait(moduleItem, changedNodeIds),
                );
                break;
            }
            case "contract": {
                newItems.push(
                    makeUnfrozenCopyOfContract(moduleItem, changedNodeIds),
                );
                break;
            }
            default:
                throwInternalCompilerError("Unrecognized AstMutable node");
        }
    }

    const newModuleNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newModuleNode.items = newItems;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newModuleNode);
    return newModuleNode;
}

function makeUnfrozenCopyOfConstantDef(
    ast: AstConstantDef,
    changedNodeIds: Map<number, AstMutableNode>,
): AstConstantDef {
    const newInitializer = makeUnfrozenCopyOfExpression(
        ast.initializer,
        changedNodeIds,
    );
    const newConstantDefNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newConstantDefNode.initializer = newInitializer;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newConstantDefNode);
    return newConstantDefNode;
}

function makeUnfrozenCopyOfFunctionDef(
    ast: AstFunctionDef,
    changedNodeIds: Map<number, AstMutableNode>,
): AstFunctionDef {
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
    );
    const newFunctionDefNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newFunctionDefNode.statements = newStatements;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newFunctionDefNode);
    return newFunctionDefNode;
}

function makeUnfrozenCopyOfMessageDecl(
    ast: AstMessageDecl,
    changedNodeIds: Map<number, AstMutableNode>,
): AstMessageDecl {
    const newFields = ast.fields.map((field) =>
        makeUnfrozenCopyOfFieldDecl(field, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.fields = newFields;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfStructDecl(
    ast: AstStructDecl,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStructDecl {
    const newFields = ast.fields.map((field) =>
        makeUnfrozenCopyOfFieldDecl(field, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.fields = newFields;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfTrait(
    ast: AstTrait,
    changedNodeIds: Map<number, AstMutableNode>,
): AstTrait {
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
                newDeclarations.push(
                    makeUnfrozenCopyOfFieldDecl(decl, changedNodeIds),
                );
                break;
            }
            case "constant_def": {
                newDeclarations.push(
                    makeUnfrozenCopyOfConstantDef(decl, changedNodeIds),
                );
                break;
            }
            case "function_def": {
                newDeclarations.push(
                    makeUnfrozenCopyOfFunctionDef(decl, changedNodeIds),
                );
                break;
            }
            case "receiver": {
                newDeclarations.push(
                    makeUnfrozenCopyOfReceiver(decl, changedNodeIds),
                );
                break;
            }
            default:
                throwInternalCompilerError(
                    "Unrecognized AstTrait declaration kind",
                );
        }
    }

    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.declarations = newDeclarations;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfContract(
    ast: AstContract,
    changedNodeIds: Map<number, AstMutableNode>,
): AstContract {
    const newDeclarations: AstContractDeclaration[] = [];

    for (const decl of ast.declarations) {
        switch (decl.kind) {
            case "asm_function_def": {
                // This kind is not changed by the optimizer
                newDeclarations.push(decl);
                break;
            }
            case "field_decl": {
                newDeclarations.push(
                    makeUnfrozenCopyOfFieldDecl(decl, changedNodeIds),
                );
                break;
            }
            case "constant_def": {
                newDeclarations.push(
                    makeUnfrozenCopyOfConstantDef(decl, changedNodeIds),
                );
                break;
            }
            case "function_def": {
                newDeclarations.push(
                    makeUnfrozenCopyOfFunctionDef(decl, changedNodeIds),
                );
                break;
            }
            case "receiver": {
                newDeclarations.push(
                    makeUnfrozenCopyOfReceiver(decl, changedNodeIds),
                );
                break;
            }
            case "contract_init": {
                newDeclarations.push(
                    makeUnfrozenCopyOfContractInit(decl, changedNodeIds),
                );
                break;
            }
            default:
                throwInternalCompilerError(
                    "Unrecognized AstContract declaration kind",
                );
        }
    }

    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.declarations = newDeclarations;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfFieldDecl(
    ast: AstFieldDecl,
    changedNodeIds: Map<number, AstMutableNode>,
): AstFieldDecl {
    if (ast.initializer === null) {
        // If there is no initializer expression,
        // just use the original node because there is nothing to change
        return ast;
    }

    const newInitializer = makeUnfrozenCopyOfExpression(
        ast.initializer,
        changedNodeIds,
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.initializer = newInitializer;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfReceiver(
    ast: AstReceiver,
    changedNodeIds: Map<number, AstMutableNode>,
): AstReceiver {
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfContractInit(
    ast: AstContractInit,
    changedNodeIds: Map<number, AstMutableNode>,
): AstContractInit {
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfStatement(
    ast: AstStatement,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatement {
    switch (ast.kind) {
        case "statement_assign": {
            return makeUnfrozenCopyOfAssign(ast, changedNodeIds);
        }
        case "statement_augmentedassign": {
            return makeUnfrozenCopyOfAugmentedAssign(ast, changedNodeIds);
        }
        case "statement_expression": {
            return makeUnfrozenCopyOfStatementExpression(ast, changedNodeIds);
        }
        case "statement_let": {
            return makeUnfrozenCopyOfLet(ast, changedNodeIds);
        }
        case "statement_destruct": {
            return makeUnfrozenCopyOfDestruct(ast, changedNodeIds);
        }
        case "statement_return": {
            return makeUnfrozenCopyOfReturn(ast, changedNodeIds);
        }
        case "statement_until": {
            return makeUnfrozenCopyOfUntil(ast, changedNodeIds);
        }
        case "statement_while": {
            return makeUnfrozenCopyOfWhile(ast, changedNodeIds);
        }
        case "statement_repeat": {
            return makeUnfrozenCopyOfRepeat(ast, changedNodeIds);
        }
        case "statement_foreach": {
            return makeUnfrozenCopyOfForEach(ast, changedNodeIds);
        }
        case "statement_condition": {
            return makeUnfrozenCopyOfCondition(ast, changedNodeIds);
        }
        case "statement_try": {
            return makeUnfrozenCopyOfTry(ast, changedNodeIds);
        }
        case "statement_try_catch": {
            return makeUnfrozenCopyOfTryCatch(ast, changedNodeIds);
        }
        default:
            throwInternalCompilerError("Unrecognized AstStatement kind");
    }
}

function makeUnfrozenCopyOfAssign(
    ast: AstStatementAssign,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementAssign {
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression,
        changedNodeIds,
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfAugmentedAssign(
    ast: AstStatementAugmentedAssign,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementAugmentedAssign {
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression,
        changedNodeIds,
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfStatementExpression(
    ast: AstStatementExpression,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementExpression {
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression,
        changedNodeIds,
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfLet(
    ast: AstStatementLet,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementLet {
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression,
        changedNodeIds,
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfDestruct(
    ast: AstStatementDestruct,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementDestruct {
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression,
        changedNodeIds,
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfReturn(
    ast: AstStatementReturn,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementReturn {
    if (ast.expression === null) {
        return ast;
    }
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression,
        changedNodeIds,
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfUntil(
    ast: AstStatementUntil,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementUntil {
    const newCondition = makeUnfrozenCopyOfExpression(
        ast.condition,
        changedNodeIds,
    );
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.condition = newCondition;
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfWhile(
    ast: AstStatementWhile,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementWhile {
    const newCondition = makeUnfrozenCopyOfExpression(
        ast.condition,
        changedNodeIds,
    );
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.condition = newCondition;
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfRepeat(
    ast: AstStatementRepeat,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementRepeat {
    const newIterations = makeUnfrozenCopyOfExpression(
        ast.iterations,
        changedNodeIds,
    );
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.iterations = newIterations;
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfForEach(
    ast: AstStatementForEach,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementForEach {
    const newMap = makeUnfrozenCopyOfExpression(ast.map, changedNodeIds);
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.map = newMap;
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfCondition(
    ast: AstCondition,
    changedNodeIds: Map<number, AstMutableNode>,
): AstCondition {
    const newCondition = makeUnfrozenCopyOfExpression(
        ast.condition,
        changedNodeIds,
    );
    const newTrueStatements = ast.trueStatements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
    );
    const newFalseStatements =
        ast.falseStatements !== null
            ? ast.falseStatements.map((stmt) =>
                  makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
              )
            : null;
    const newElseIf =
        ast.elseif !== null
            ? makeUnfrozenCopyOfCondition(ast.elseif, changedNodeIds)
            : null;
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.condition = newCondition;
    newNode.trueStatements = newTrueStatements;
    newNode.falseStatements = newFalseStatements;
    newNode.elseif = newElseIf;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfTry(
    ast: AstStatementTry,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementTry {
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfTryCatch(
    ast: AstStatementTryCatch,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStatementTryCatch {
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
    );
    const newCatchStatements = ast.catchStatements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.statements = newStatements;
    newNode.catchStatements = newCatchStatements;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfExpression(
    ast: AstExpression,
    changedNodeIds: Map<number, AstMutableNode>,
): AstExpression {
    switch (ast.kind) {
        case "id":
        case "null":
        case "boolean":
        case "number":
        case "string":
            // These leaf nodes are never changed.
            return ast;
        case "struct_instance":
            return makeUnfrozenCopyOfStructInstance(ast, changedNodeIds);
        case "field_access":
            return makeUnfrozenCopyOfFieldAccess(ast, changedNodeIds);
        case "method_call":
            return makeUnfrozenCopyOfMethodCall(ast, changedNodeIds);
        case "static_call":
            return makeUnfrozenCopyOfStaticCall(ast, changedNodeIds);
        case "op_unary":
            return makeUnfrozenCopyOfUnaryOp(ast, changedNodeIds);
        case "op_binary":
            return makeUnfrozenCopyOfBinaryOp(ast, changedNodeIds);
        case "init_of":
            return makeUnfrozenCopyOfInitOf(ast, changedNodeIds);
        case "conditional":
            return makeUnfrozenCopyOfConditional(ast, changedNodeIds);
        default:
            throwInternalCompilerError("Unrecognized AstExpression kind");
    }
}

function makeUnfrozenCopyOfStructInstance(
    ast: AstStructInstance,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStructInstance {
    const newArgs = ast.args.map((initializer) =>
        makeUnfrozenCopyOfFieldInitializer(initializer, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.args = newArgs;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfFieldAccess(
    ast: AstFieldAccess,
    changedNodeIds: Map<number, AstMutableNode>,
): AstFieldAccess {
    const newAggregate = makeUnfrozenCopyOfExpression(
        ast.aggregate,
        changedNodeIds,
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.aggregate = newAggregate;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfMethodCall(
    ast: AstMethodCall,
    changedNodeIds: Map<number, AstMutableNode>,
): AstMethodCall {
    const newArgs = ast.args.map((expr) =>
        makeUnfrozenCopyOfExpression(expr, changedNodeIds),
    );
    const newSelf = makeUnfrozenCopyOfExpression(ast.self, changedNodeIds);
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.args = newArgs;
    newNode.self = newSelf;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfStaticCall(
    ast: AstStaticCall,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStaticCall {
    const newArgs = ast.args.map((expr) =>
        makeUnfrozenCopyOfExpression(expr, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.args = newArgs;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfUnaryOp(
    ast: AstOpUnary,
    changedNodeIds: Map<number, AstMutableNode>,
): AstOpUnary {
    const newOperand = makeUnfrozenCopyOfExpression(
        ast.operand,
        changedNodeIds,
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.operand = newOperand;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfBinaryOp(
    ast: AstOpBinary,
    changedNodeIds: Map<number, AstMutableNode>,
): AstOpBinary {
    const newLeft = makeUnfrozenCopyOfExpression(ast.left, changedNodeIds);
    const newRight = makeUnfrozenCopyOfExpression(ast.right, changedNodeIds);
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.left = newLeft;
    newNode.right = newRight;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfInitOf(
    ast: AstInitOf,
    changedNodeIds: Map<number, AstMutableNode>,
): AstInitOf {
    const newArgs = ast.args.map((expr) =>
        makeUnfrozenCopyOfExpression(expr, changedNodeIds),
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.args = newArgs;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfConditional(
    ast: AstConditional,
    changedNodeIds: Map<number, AstMutableNode>,
): AstConditional {
    const newCondition = makeUnfrozenCopyOfExpression(
        ast.condition,
        changedNodeIds,
    );
    const newThen = makeUnfrozenCopyOfExpression(
        ast.thenBranch,
        changedNodeIds,
    );
    const newElse = makeUnfrozenCopyOfExpression(
        ast.elseBranch,
        changedNodeIds,
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.condition = newCondition;
    newNode.thenBranch = newThen;
    newNode.elseBranch = newElse;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfFieldInitializer(
    ast: AstStructFieldInitializer,
    changedNodeIds: Map<number, AstMutableNode>,
): AstStructFieldInitializer {
    const newInitializer = makeUnfrozenCopyOfExpression(
        ast.initializer,
        changedNodeIds,
    );
    const newNode = cloneAstNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.initializer = newInitializer;
    // Remember the ID of the new node
    changedNodeIds.set(ast.id, newNode);
    return newNode;
}

export function updateCompilerContext(
    optCtx: OptimizationContext,
): CompilerContext {
    processStaticFunctions(optCtx.ctx, optCtx.nodeReplacements);

    processStaticConstants(optCtx.ctx, optCtx.nodeReplacements);

    processTypes(optCtx.ctx, optCtx.nodeReplacements);

    return optCtx.ctx;
}

export function dumpTactCode(ast: AstModule, file: string) {
    const program = prettyPrint(ast);

    void writeFile(file, program);
}

function buildOptimizationContext(
    ast: AstModule,
    newAst: AstModule,
    changedIds: Map<number, AstMutableNode>,
    ctx: CompilerContext,
): OptimizationContext {
    // Build inverse map
    const originalIDs: Map<number, number> = new Map();

    for (const [id, node] of changedIds) {
        originalIDs.set(node.id, id);
    }

    // To maintain consistency with types in the CompilerContext, register the
    // types of all newly created expressions in changedIds.
    for (const [id, node] of changedIds) {
        if (isAstExpression(node)) {
            ctx = registerExpType(ctx, node, getExpTypeById(ctx, id));
        }
    }

    return {
        originalAst: ast,
        modifiedAst: newAst,
        nodeReplacements: changedIds,
        originalIDs: originalIDs,
        ctx: ctx,
    };
}

export function registerAstNodeChange(
    optCtx: OptimizationContext,
    nodeToReplace: AstMutableNode,
    newNode: AstMutableNode,
) {
    const idToReplace = nodeToReplace.id;

    // Is the idToReplace already a replacement of an original ID?
    if (optCtx.originalIDs.has(idToReplace)) {
        // Obtain the original ID
        const originalID = optCtx.originalIDs.get(idToReplace)!;
        // Now replace the original node
        optCtx.nodeReplacements.set(originalID, newNode);
        // Update the inverse map
        optCtx.originalIDs.set(newNode.id, originalID);
    } else {
        // idToReplace is an original node
        optCtx.nodeReplacements.set(idToReplace, newNode);
        // Update the inverse map
        optCtx.originalIDs.set(newNode.id, idToReplace);
    }
}

function processStaticFunctions(
    ctx: CompilerContext,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const f of getAllStaticFunctions(ctx)) {
        if (nodeReplacements.has(f.ast.id)) {
            f.ast = ensureFunction(nodeReplacements.get(f.ast.id)!);
        }
    }
}

function processStaticConstants(
    ctx: CompilerContext,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const c of getAllStaticConstants(ctx)) {
        if (nodeReplacements.has(c.ast.id)) {
            c.ast = ensureConstant(nodeReplacements.get(c.ast.id)!);
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

    if (nodeReplacements.has(t.init.ast.id)) {
        t.init.ast = ensureContractInit(nodeReplacements.get(t.init.ast.id)!);
    }
}

function processTypeConstantDescriptions(
    t: TypeDescription,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const c of t.constants) {
        if (nodeReplacements.has(c.ast.id)) {
            c.ast = ensureConstant(nodeReplacements.get(c.ast.id)!);
        }
    }
}

function processTypeFieldDescriptions(
    t: TypeDescription,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const f of t.fields) {
        if (nodeReplacements.has(f.ast.id)) {
            f.ast = ensureFieldDecl(nodeReplacements.get(f.ast.id)!);
        }
    }
}

function processTypeReceiverDescriptions(
    t: TypeDescription,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const r of t.receivers) {
        if (nodeReplacements.has(r.ast.id)) {
            r.ast = ensureReceiver(nodeReplacements.get(r.ast.id)!);
        }
    }
}

function processTypeFunctionDescriptions(
    t: TypeDescription,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    for (const [_, m] of t.functions) {
        if (nodeReplacements.has(m.ast.id)) {
            m.ast = ensureFunction(nodeReplacements.get(m.ast.id)!);
        }
    }
}

function processTypes(
    ctx: CompilerContext,
    nodeReplacements: Map<number, AstMutableNode>,
) {
    /**
     * By calling the function getAllTypes on the context object "ctx", one gets an array of TypeDescriptions.
     * Each TypeDescription stores the type declarations in two different ways:
     * - Directly in the TypeDescription object there are fields, constants, and method
     *   declarations. However, these declarations are "coalesced" in the following sense:
     *     If the TypeDescription is a contract, it will contain copies of methods, constants and fields of traits that the
     *     contract inherits from. Similarly, each trait will have declarations of other traits
     *     that the trait inherits from.
     *
     *   For example, if we look into the "functions" property of the TypeDescription object of a contract
     *   we will find functions defined in BaseTrait.
     *
     * - Indirectly in the "ast" property of the TypeDescription. Contrary to the previous case,
     *   the fields, constants and methods in the ast property are NOT coalesced. This means, for example,
     *   that the methods in a TypeDescription's ast of a contract will be methods that are actually
     *   declared in the contract and not in some trait that the contract inherits from.
     */

    for (const t of getAllTypes(ctx)) {
        // First, process all the coalesced data

        processTypeInitDescription(t, nodeReplacements);

        processTypeConstantDescriptions(t, nodeReplacements);

        processTypeFieldDescriptions(t, nodeReplacements);

        processTypeReceiverDescriptions(t, nodeReplacements);

        processTypeFunctionDescriptions(t, nodeReplacements);

        // Now, the non-coalesced data, which is simply the changed node in nodeReplacements
        if (nodeReplacements.has(t.ast.id)) {
            t.ast = ensureTypeDecl(nodeReplacements.get(t.ast.id)!);
        }
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

function ensureTypeDecl(ast: AstMutableNode): AstTypeDecl {
    switch (ast.kind) {
        case "contract":
        case "message_decl":
        case "primitive_type_decl":
        case "struct_decl":
        case "trait":
            return ast;
        default:
            throwInternalCompilerError(
                `kind ${ast.kind} is not a type declaration`,
            );
    }
}
