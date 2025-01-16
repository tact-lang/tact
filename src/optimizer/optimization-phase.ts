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
import { AstCondition, AstConditional, AstConstantDef, AstContract, AstContractDeclaration, AstContractInit, AstExpression, AstFieldAccess, AstFieldDecl, AstFunctionDef, AstInitOf, AstMessageDecl, AstMethodCall, AstModule, AstModuleItem, AstOpBinary, AstOpUnary, AstReceiver, AstStatement, AstStatementAssign, AstStatementAugmentedAssign, AstStatementBlock, AstStatementDestruct, AstStatementExpression, AstStatementForEach, AstStatementLet, AstStatementRepeat, AstStatementReturn, AstStatementTry, AstStatementTryCatch, AstStatementUntil, AstStatementWhile, AstStaticCall, AstStructDecl, AstStructFieldInitializer, AstStructFieldValue, AstStructInstance, AstTrait, AstTraitDeclaration, AstTypeDecl, FactoryAst, isAstExpression } from "../ast/ast";
import { CompilerContext } from "../context/context";
import { throwInternalCompilerError } from "../error/errors";

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

export type OptimizationContext = {
    originalAst: AstModule;
    modifiedAst: AstModule;
    nodeReplacements: Map<number, AstMutableNode>;
    ctx: CompilerContext;
    factoryAst: FactoryAst;
};

export function optimizeTact(ctx: OptimizationContext) {
    // Call the expression simplification phase
    simplifyAllExpressions(ctx);

    // Here, we will call the constant propagation analyzer
}

export function prepareAstForOptimization(
    ctx: CompilerContext,
    factoryAst: FactoryAst,
    doOptimizationFlag: boolean,
): OptimizationContext {

    const moduleAst = createTopLevelModule();
    const changedIds: Map<number, AstMutableNode> = new Map();

    if (doOptimizationFlag) {
        const newAst = makeUnfrozenCopyOfModule(moduleAst);
        return buildOptimizationContext(moduleAst, newAst);
    } else {
        return buildOptimizationContext(moduleAst, moduleAst);
    }


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
        moduleItems.push(t.ast);
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

function makeUnfrozenCopyOfModule(
    ast: AstModule
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
                    makeUnfrozenCopyOfConstantDef(moduleItem),
                );
                break;
            }
            case "function_def": {
                newItems.push(
                    makeUnfrozenCopyOfFunctionDef(moduleItem),
                );
                break;
            }
            case "message_decl": {
                newItems.push(
                    makeUnfrozenCopyOfMessageDecl(moduleItem),
                );
                break;
            }
            case "struct_decl": {
                newItems.push(
                    makeUnfrozenCopyOfStructDecl(moduleItem),
                );
                break;
            }
            case "trait": {
                newItems.push(
                    makeUnfrozenCopyOfTrait(moduleItem),
                );
                break;
            }
            case "contract": {
                newItems.push(
                    makeUnfrozenCopyOfContract(moduleItem),
                );
                break;
            }
            default:
                throwInternalCompilerError("Unrecognized AstMutable node");
        }
    }

    const newModuleNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newModuleNode.items = newItems;
    // Remember the ID of the new node
    changedIds.set(ast.id, newModuleNode);
    return newModuleNode;
}

function makeUnfrozenCopyOfConstantDef(
    ast: AstConstantDef
): AstConstantDef {
    const newInitializer = makeUnfrozenCopyOfExpression(
        ast.initializer
    );
    const newConstantDefNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newConstantDefNode.initializer = newInitializer;
    // Remember the ID of the new node
    changedIds.set(ast.id, newConstantDefNode);
    return newConstantDefNode;
}

function makeUnfrozenCopyOfFunctionDef(
    ast: AstFunctionDef
): AstFunctionDef {
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt),
    );
    const newFunctionDefNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newFunctionDefNode.statements = newStatements;
    // Remember the ID of the new node
    changedIds.set(ast.id, newFunctionDefNode);
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
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfStructDecl(
    ast: AstStructDecl,
): AstStructDecl {
    const newFields = ast.fields.map((field) =>
        makeUnfrozenCopyOfFieldDecl(field),
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.fields = newFields;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfTrait(
    ast: AstTrait,
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
                    makeUnfrozenCopyOfFieldDecl(decl),
                );
                break;
            }
            case "constant_def": {
                newDeclarations.push(
                    makeUnfrozenCopyOfConstantDef(decl),
                );
                break;
            }
            case "function_def": {
                newDeclarations.push(
                    makeUnfrozenCopyOfFunctionDef(decl),
                );
                break;
            }
            case "receiver": {
                newDeclarations.push(
                    makeUnfrozenCopyOfReceiver(decl),
                );
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
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfContract(
    ast: AstContract,
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
                    makeUnfrozenCopyOfFieldDecl(decl),
                );
                break;
            }
            case "constant_def": {
                newDeclarations.push(
                    makeUnfrozenCopyOfConstantDef(decl),
                );
                break;
            }
            case "function_def": {
                newDeclarations.push(
                    makeUnfrozenCopyOfFunctionDef(decl),
                );
                break;
            }
            case "receiver": {
                newDeclarations.push(
                    makeUnfrozenCopyOfReceiver(decl),
                );
                break;
            }
            case "contract_init": {
                newDeclarations.push(
                    makeUnfrozenCopyOfContractInit(decl),
                );
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
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfFieldDecl(
    ast: AstFieldDecl,
): AstFieldDecl {
    if (ast.initializer === null) {
        // If there is no initializer expression,
        // just use the original node because there is nothing to change
        return ast;
    }

    const newInitializer = makeUnfrozenCopyOfExpression(
        ast.initializer
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.initializer = newInitializer;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfReceiver(
    ast: AstReceiver,
): AstReceiver {
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt),
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
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
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfStatement(
    ast: AstStatement,
): AstStatement {
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
        case "statement_try_catch": {
            return makeUnfrozenCopyOfTryCatch(ast);
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
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression,
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfAugmentedAssign(
    ast: AstStatementAugmentedAssign,
): AstStatementAugmentedAssign {
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression,
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfStatementExpression(
    ast: AstStatementExpression,
): AstStatementExpression {
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfLet(
    ast: AstStatementLet,
): AstStatementLet {
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression,
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfDestruct(
    ast: AstStatementDestruct,
): AstStatementDestruct {
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression,
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfReturn(
    ast: AstStatementReturn,
): AstStatementReturn {
    if (ast.expression === null) {
        return ast;
    }
    const newExpr = makeUnfrozenCopyOfExpression(
        ast.expression,
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.expression = newExpr;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfUntil(
    ast: AstStatementUntil,
): AstStatementUntil {
    const newCondition = makeUnfrozenCopyOfExpression(
        ast.condition,
    );
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt),
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.condition = newCondition;
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfWhile(
    ast: AstStatementWhile,
): AstStatementWhile {
    const newCondition = makeUnfrozenCopyOfExpression(
        ast.condition
    );
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt),
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.condition = newCondition;
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfRepeat(
    ast: AstStatementRepeat,
): AstStatementRepeat {
    const newIterations = makeUnfrozenCopyOfExpression(
        ast.iterations
    );
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt),
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.iterations = newIterations;
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
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
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfCondition(
    ast: AstCondition,
): AstCondition {
    const newCondition = makeUnfrozenCopyOfExpression(
        ast.condition
    );
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
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfTry(
    ast: AstStatementTry,
): AstStatementTry {
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt),
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.statements = newStatements;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfTryCatch(
    ast: AstStatementTryCatch,
): AstStatementTryCatch {
    const newStatements = ast.statements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt),
    );
    const newCatchStatements = ast.catchStatements.map((stmt) =>
        makeUnfrozenCopyOfStatement(stmt),
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.statements = newStatements;
    newNode.catchStatements = newCatchStatements;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
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
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfExpression(
    ast: AstExpression,
): AstExpression {
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
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfFieldAccess(
    ast: AstFieldAccess,
): AstFieldAccess {
    const newAggregate = makeUnfrozenCopyOfExpression(
        ast.aggregate
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.aggregate = newAggregate;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfMethodCall(
    ast: AstMethodCall,
): AstMethodCall {
    const newArgs = ast.args.map((expr) =>
        makeUnfrozenCopyOfExpression(expr),
    );
    const newSelf = makeUnfrozenCopyOfExpression(ast.self);
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.args = newArgs;
    newNode.self = newSelf;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfStaticCall(
    ast: AstStaticCall,
): AstStaticCall {
    const newArgs = ast.args.map((expr) =>
        makeUnfrozenCopyOfExpression(expr),
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.args = newArgs;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfUnaryOp(
    ast: AstOpUnary,
): AstOpUnary {
    const newOperand = makeUnfrozenCopyOfExpression(
        ast.operand
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.operand = newOperand;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfBinaryOp(
    ast: AstOpBinary,
): AstOpBinary {
    const newLeft = makeUnfrozenCopyOfExpression(ast.left);
    const newRight = makeUnfrozenCopyOfExpression(ast.right);
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.left = newLeft;
    newNode.right = newRight;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfInitOf(
    ast: AstInitOf,
): AstInitOf {
    const newArgs = ast.args.map((expr) =>
        makeUnfrozenCopyOfExpression(expr),
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.args = newArgs;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfConditional(
    ast: AstConditional,
): AstConditional {
    const newCondition = makeUnfrozenCopyOfExpression(
        ast.condition
    );
    const newThen = makeUnfrozenCopyOfExpression(
        ast.thenBranch
    );
    const newElse = makeUnfrozenCopyOfExpression(
        ast.elseBranch
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.condition = newCondition;
    newNode.thenBranch = newThen;
    newNode.elseBranch = newElse;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function makeUnfrozenCopyOfFieldInitializer(
    ast: AstStructFieldInitializer,
): AstStructFieldInitializer {
    const newInitializer = makeUnfrozenCopyOfExpression(
        ast.initializer
    );
    const newNode = factoryAst.cloneNode(ast);
    // The rest of properties will not be touched by the optimizer.
    newNode.initializer = newInitializer;
    // Remember the ID of the new node
    changedIds.set(ast.id, newNode);
    return newNode;
}

function buildOptimizationContext(
    ast: AstModule,
    newAst: AstModule
): OptimizationContext {
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
        ctx: ctx,
        factoryAst: factoryAst
    };
}
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

export function registerAstNodeChange(
    optCtx: OptimizationContext,
    nodeToReplace: AstMutableNode,
    newNode: AstMutableNode,
) {
    const idToReplace = nodeToReplace.id;
    optCtx.nodeReplacements.set(idToReplace, newNode);    
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
