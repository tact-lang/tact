// DO NOT IMPORT ELEMENTS IN THIS FILE INTO YOUR FILES.
// This is a poor's man constant propagation implementation (without fix-point computation and no branch joining) to quickly solve issue #716.
// It is a simplified version of the constant propagation code in PR https://github.com/tact-lang/tact/pull/852.
// the simplification is: the analyzer stops when it reaches a join point of two or more branches.
// FIXME: Remove this entire file once constant propagation is implemented.

import * as A from "../../ast/ast";
import { FactoryAst, idText, tryExtractPath } from "../../ast/ast-helpers";
import { getAstUtil } from "../../ast/util";
import { CompilerContext } from "../../context/context";
import {
    TactConstEvalError,
    TactInternalCompilerError,
    throwInternalCompilerError,
} from "../../error/errors";
import {
    getAllStaticFunctions,
    getAllTypes,
    getType,
} from "../../types/resolveDescriptors";
import {
    ensureBoolean,
    ensureRepeatInt,
    EnvironmentStack,
    Interpreter,
    throwNonFatalErrorConstEval,
} from "../interpreter";
import { getExpType } from "../../types/resolveExpression";
import { cloneNode } from "../../ast/clone";
import { StructFunctions } from "../../abi/struct";
import { MapFunctions } from "../../abi/map";

/**
 * @deprecated FIXME: Remove this error class once constant propagation is implemented.
 */
class InterruptedAnalysis extends Error {}

const knownStructBuiltInNonMutationFunctions = [
    "toCell",
    "fromCell",
    "toSlice",
    "fromSlice",
];
const knownStructBuiltInMutationFunctions: string[] = [];
const knownMapBuiltInNonMutationFunctions = [
    "get",
    "asCell",
    "isEmpty",
    "exists",
    "deepEquals",
];
const knownMapBuiltInMutationFunctions = [
    "set",
    "del",
    "replace",
    "replaceGet",
];

/**
 * @deprecated FIXME: Remove this function once constant propagation is implemented.
 * WARNING: DO NOT IMPORT THIS FUNCTION INTO YOUR FILES.
 */
export function constantPropagationAnalysis(
    ctx: CompilerContext,
    astF: FactoryAst,
) {
    // Check that the builtin Functions known by the analyzer are still the ones in StructFunctions and MapFunctions
    const knownStructBuiltInFunctions = [
        ...knownStructBuiltInNonMutationFunctions,
        ...knownStructBuiltInMutationFunctions,
    ];

    if (
        StructFunctions.size !== knownStructBuiltInFunctions.length ||
        knownStructBuiltInFunctions.some((name) => !StructFunctions.has(name))
    ) {
        throwInternalCompilerError(
            "There are new Struct builtin functions unknown to the Constant Propagation Analyzer. Please add them to the Constant Propagation Analyzer.",
        );
    }

    const knownMapBuiltInFunctions = [
        ...knownMapBuiltInNonMutationFunctions,
        ...knownMapBuiltInMutationFunctions,
    ];

    if (
        MapFunctions.size !== knownMapBuiltInFunctions.length ||
        knownMapBuiltInFunctions.some((name) => !MapFunctions.has(name))
    ) {
        throwInternalCompilerError(
            "There are new Map builtin functions unknown to the Constant Propagation Analyzer. Please add them to the Constant Propagation Analyzer.",
        );
    }

    const envStack = new EnvironmentStack((expr: A.AstLiteral) =>
        cloneNode(expr, astF),
    );
    const interpreter = new Interpreter(astF, ctx);
    const util = getAstUtil(astF);
    interpreter.setEnvironmentStack(envStack);

    // Process all functions
    for (const f of getAllStaticFunctions(ctx)) {
        switch (f.ast.kind) {
            case "function_def": {
                interpretProcedure(f.ast);
                break;
            }
            case "native_function_decl":
            case "asm_function_def":
            case "function_decl":
                // Do nothing
                break;
            default:
                throwInternalCompilerError("Unrecognized function kind.");
        }
    }

    // Process all types
    for (const t of getAllTypes(ctx)) {
        if (t.kind === "trait") {
            // Ignore traits, their code is already inside the contracts
            continue;
        }

        // Process init
        if (t.init) {
            // Prepare the self struct
            const fields: A.AstStructFieldValue[] = [];
            for (const f of t.fields) {
                if (typeof f.default !== "undefined") {
                    fields.push(
                        util.makeStructFieldValue(f.name, f.default, f.loc),
                    );
                }
            }

            // Include also the constants (as if they were fields)
            for (const c of t.constants) {
                if (typeof c.value !== "undefined") {
                    fields.push(
                        util.makeStructFieldValue(c.name, c.value, c.loc),
                    );
                }
            }

            envStack.setNewBinding(
                "self",
                util.makeStructValue(fields, t.ast.name, t.ast.loc),
            );

            interpretProcedure(t.init.ast);

            envStack.clear();
        }

        // Update again the self variable for all the following
        // receivers and functions. They will all need a fresh self
        // that includes all the constants.

        // Process receivers
        for (const r of t.receivers) {
            interpretProcedure(r.ast);
        }

        // Process methods
        for (const m of t.functions.values()) {
            switch (m.ast.kind) {
                case "function_def": {
                    interpretProcedure(m.ast);
                    break;
                }
                case "native_function_decl":
                case "asm_function_def":
                case "function_decl":
                    // Do nothing
                    break;
                default:
                    throwInternalCompilerError("Unrecognized function kind.");
            }
        }
    }

    function interpretProcedure(
        ast: A.AstFunctionDef | A.AstReceiver | A.AstContractInit,
    ) {
        try {
            envStack.executeInNewEnvironment(() => {
                executeStatements(ast.statements);
            });
        } catch (e) {
            if (!(e instanceof InterruptedAnalysis)) {
                throw e;
            }
        }
    }

    function executeStatements(statements: A.AstStatement[]) {
        statements.forEach((currStmt) => {
            interpretStatement(currStmt);
        });
    }

    function interpretStatement(ast: A.AstStatement) {
        switch (ast.kind) {
            case "statement_let":
                interpretLetStatement(ast);
                break;
            case "statement_destruct":
                interpretDestructStatement(ast);
                break;
            case "statement_assign":
                interpretAssignStatement(ast);
                break;
            case "statement_augmentedassign":
                interpretAugmentedAssignStatement(ast);
                break;
            case "statement_condition":
                interpretConditionStatement(ast);
                break;
            case "statement_expression":
                interpretExpressionStatement(ast);
                break;
            case "statement_foreach":
                interpretForEachStatement(ast);
                break;
            case "statement_repeat":
                interpretRepeatStatement(ast);
                break;
            case "statement_return":
                interpretReturnStatement(ast);
                break;
            case "statement_try":
                interpretTryStatement(ast);
                break;
            case "statement_until":
                interpretUntilStatement(ast);
                break;
            case "statement_while":
                interpretWhileStatement(ast);
                break;
            case "statement_block":
                interpretBlock(ast);
                break;
            default:
                throwInternalCompilerError("unrecognized statement kind");
        }
    }

    function interpretLetStatement(ast: A.AstStatementLet) {
        const val = tryExpressionEvaluation(ast.expression);
        if (typeof val !== "undefined") {
            envStack.setNewBinding(idText(ast.name), val);
        }
        // Do nothing if the expression did not evaluate to a literal
    }

    function interpretDestructStatement(ast: A.AstStatementDestruct): void {
        const rawVal = tryExpressionEvaluation(ast.expression);

        if (typeof rawVal !== "undefined" && rawVal.kind === "struct_value") {
            const valStruct: Map<string, A.AstLiteral> = new Map();

            for (const { field, initializer } of rawVal.args) {
                valStruct.set(idText(field), initializer);
            }

            for (const [field, name] of ast.identifiers.values()) {
                const val = valStruct.get(idText(field));
                if (val) {
                    envStack.setNewBinding(idText(name), val);
                }
                // Do nothing if the struct does not have field "field"
            }
        }
        // Do nothing if the expression did not evaluate to a Struct value
    }

    function interpretAssignStatement(ast: A.AstStatementAssign) {
        if (ast.path.kind === "id") {
            const val = tryExpressionEvaluation(ast.expression);
            if (typeof val !== "undefined") {
                envStack.updateBinding(idText(ast.path), val);
            } else {
                envStack.deactivateBinding(idText(ast.path));
            }
        } else {
            const fullPath = tryExtractPath(ast.path);
            if (fullPath !== null) {
                const baseName = fullPath[0];
                if (typeof baseName !== "undefined") {
                    envStack.deactivateBinding(idText(baseName));
                } else {
                    throwInternalCompilerError(
                        "assignments allow non-empty path expressions only",
                        ast.path.loc,
                    );
                }
            } else {
                throwInternalCompilerError(
                    "assignments allow path expressions only",
                    ast.path.loc,
                );
            }
        }
    }

    function interpretAugmentedAssignStatement(
        ast: A.AstStatementAugmentedAssign,
    ) {
        // Interpret it as if it was a simple assignment
        interpretAssignStatement(
            util.makeAssignStatement(
                ast.path,
                util.makeBinaryExpressionLoc(
                    ast.op,
                    ast.path,
                    ast.expression,
                    ast.expression.loc,
                ),
                ast.loc,
            ),
        );
    }

    function interpretConditionStatement(ast: A.AstStatementCondition) {
        const conditionValue = tryExpressionEvaluation(ast.condition);

        if (typeof conditionValue !== "undefined") {
            // Take the corresponding branch, according to the condition
            const condition = ensureBoolean(conditionValue).value;

            if (condition) {
                envStack.executeInNewEnvironment(() => {
                    executeStatements(ast.trueStatements);
                });
            } else {
                if (ast.falseStatements !== null) {
                    const falseStmts = ast.falseStatements;
                    envStack.executeInNewEnvironment(() => {
                        executeStatements(falseStmts);
                    });
                }
                if (ast.elseif !== null) {
                    interpretConditionStatement(ast.elseif);
                }
            }
        } else {
            // Branching point detected. Check all branches, but then stop, since we cannot join branches.
            simulateBranch(() => {
                executeStatements(ast.trueStatements);
            });

            if (ast.falseStatements !== null && ast.elseif !== null) {
                throwInternalCompilerError(
                    "Incorrect AST: 'else' and `else if' cannot occur simultaneously in an AstStatementCondition",
                );
            }

            if (ast.falseStatements !== null) {
                const falseStmts = ast.falseStatements;
                simulateBranch(() => {
                    executeStatements(falseStmts);
                });
            }

            if (ast.elseif !== null) {
                const elseif = ast.elseif;
                simulateBranch(() => {
                    interpretConditionStatement(elseif);
                });
            }

            throw new InterruptedAnalysis();
        }
    }

    function interpretExpressionStatement(ast: A.AstStatementExpression) {
        // Keep executing if a non-fatal error occurs.
        tryExpressionEvaluation(ast.expression);
    }

    function interpretForEachStatement(ast: A.AstStatementForEach) {
        const mapValue = tryExpressionEvaluation(ast.map);

        if (typeof mapValue !== "undefined") {
            if (mapValue.kind !== "null") {
                // FIXME: In theory, it could be possible to actually iterate the map here, but I still do not know how to do such thing :)
                // For the moment, execute the loop once and halt, since it is still not supported.

                simulateBranch(() => {
                    executeStatements(ast.statements);
                });

                throw new InterruptedAnalysis();
            } else {
                // Map is empty, do nothing
            }
        } else {
            // Branching point detected. Execute loop once and halt.
            simulateBranch(() => {
                executeStatements(ast.statements);
            });

            throw new InterruptedAnalysis();
        }
    }

    function interpretRepeatStatement(ast: A.AstStatementRepeat) {
        const iterationsValue = tryExpressionEvaluation(ast.iterations);

        if (typeof iterationsValue !== "undefined") {
            const iterations = ensureRepeatInt(iterationsValue).value;

            if (iterations > 0) {
                if (iterations <= interpreter.getConfig().maxLoopIterations) {
                    // Actually execute the loop
                    envStack.executeInNewEnvironment(() => {
                        for (let i = 1n; i <= iterations; i++) {
                            executeStatements(ast.statements);
                        }
                    });
                } else {
                    // Not possible to evaluate. Halt computation
                    throw new InterruptedAnalysis();
                }
            } else {
                // Do nothing
            }
        } else {
            // Branching point detected. Halt computation after executing body once.
            simulateBranch(() => {
                executeStatements(ast.statements);
            });
            throw new InterruptedAnalysis();
        }
    }

    function interpretReturnStatement(ast: A.AstStatementReturn) {
        // Interpret the expression, but do nothing with it
        if (ast.expression !== null) {
            tryExpressionEvaluation(ast.expression);
        }
        // Interrupt the current computation
        throw new InterruptedAnalysis();
    }

    function interpretTryStatement(ast: A.AstStatementTry) {
        // try-catch is always a branching point. Simulate both branches
        simulateBranch(() => {
            executeStatements(ast.statements);
        });
        if (ast.catchBlock) {
            const stmts = ast.catchBlock.catchStatements;
            simulateBranch(() => {
                executeStatements(stmts);
            });
        }

        throw new InterruptedAnalysis();
    }

    function interpretUntilStatement(ast: A.AstStatementUntil) {
        envStack.executeInNewEnvironment(() => {
            let condition: boolean;
            let iterCount = 0;
            do {
                executeStatements(ast.statements);

                iterCount++;
                if (iterCount >= interpreter.getConfig().maxLoopIterations) {
                    // Interrupt the computation
                    throw new InterruptedAnalysis();
                }
                const conditionValue = tryExpressionEvaluation(ast.condition);
                if (typeof conditionValue !== "undefined") {
                    condition = ensureBoolean(conditionValue).value;
                } else {
                    // Branching point detected. Halt computation after executing body once.
                    simulateBranch(() => {
                        executeStatements(ast.statements);
                    });
                    throw new InterruptedAnalysis();
                }
            } while (!condition);
        });
    }

    function interpretWhileStatement(ast: A.AstStatementWhile) {
        envStack.executeInNewEnvironment(() => {
            let condition: boolean;
            let iterCount = 0;
            do {
                const conditionValue = tryExpressionEvaluation(ast.condition);
                if (typeof conditionValue !== "undefined") {
                    condition = ensureBoolean(conditionValue).value;
                } else {
                    // Branching point detected. Halt computation after executing body once.
                    simulateBranch(() => {
                        executeStatements(ast.statements);
                    });
                    throw new InterruptedAnalysis();
                }
                if (condition) {
                    executeStatements(ast.statements);

                    iterCount++;
                    if (
                        iterCount >= interpreter.getConfig().maxLoopIterations
                    ) {
                        // Interrupt the computation
                        throw new InterruptedAnalysis();
                    }
                }
            } while (condition);
        });
    }

    function interpretBlock(ast: A.AstStatementBlock) {
        envStack.executeInNewEnvironment(() => {
            executeStatements(ast.statements);
        });
    }

    function tryExpressionEvaluation(
        expr: A.AstExpression,
    ): A.AstLiteral | undefined {
        try {
            return interpretExpression(expr);
        } catch (e) {
            if (e instanceof TactConstEvalError) {
                if (!e.fatal) {
                    return undefined;
                }
            }
            throw e;
        }
    }

    function catchNonFatalErrors(
        code: () => A.AstLiteral | undefined,
    ): A.AstLiteral | undefined {
        try {
            return code();
        } catch (e) {
            if (e instanceof TactConstEvalError) {
                if (!e.fatal) {
                    return undefined;
                }
            }
            throw e;
        }
    }

    function interpretExpression(
        expr: A.AstExpression,
    ): A.AstLiteral | undefined {
        switch (expr.kind) {
            case "address":
            case "boolean":
            case "cell":
            case "comment_value":
            case "number":
            case "simplified_string":
            case "slice":
            case "string":
            case "struct_value":
            case "null":
            case "id":
                // Pass it directly to the interpreter
                return interpreter.interpretExpression(expr);

            case "field_access":
                return interpretFieldAccess(expr);

            case "conditional":
                return interpretConditional(expr);

            case "method_call":
                return interpretMethodCall(expr);

            case "static_call":
                return interpretStaticCall(expr);

            case "struct_instance":
                return interpretStructInstance(expr);

            case "op_binary":
                return interpretBinaryOp(expr);

            case "op_unary":
                return interpretUnaryOp(expr);

            case "init_of":
                return interpretInitOf(expr);

            default:
                throwInternalCompilerError("Unrecognized expression kind");
        }
    }

    function interpretFieldAccess(expr: A.AstFieldAccess): A.AstLiteral {
        /* Pass it to the interpreter, but we do the following HACK:
           if the interpreter returns an internal compiler error describing that a struct does not
           have a field, treat it as a non-fatal error. 
           This is necessary to handle fields in a contract, which some of them
           are missing (their values are not all known during analysis).
        */
        try {
            return interpreter.interpretFieldAccess(expr);
        } catch (e) {
            if (e instanceof TactInternalCompilerError) {
                const regexp = new RegExp('struct field ".+" is missing');
                if (regexp.test(e.message)) {
                    throwNonFatalErrorConstEval(e.message, expr.loc);
                }
            }
            throw e;
        }
    }

    function interpretConditional(
        expr: A.AstConditional,
    ): A.AstLiteral | undefined {
        const cond = tryExpressionEvaluation(expr.condition);
        if (typeof cond !== "undefined") {
            const condValue = ensureBoolean(cond).value;
            if (condValue) {
                return tryExpressionEvaluation(expr.thenBranch);
            } else {
                return tryExpressionEvaluation(expr.elseBranch);
            }
        } else {
            // Branch point detected.

            simulateBranch(() => {
                tryExpressionEvaluation(expr.thenBranch);
            });

            simulateBranch(() => {
                tryExpressionEvaluation(expr.elseBranch);
            });

            throw new InterruptedAnalysis();
        }
    }

    function interpretMethodCall(
        expr: A.AstMethodCall,
    ): A.AstLiteral | undefined {
        const self = tryExpressionEvaluation(expr.self);
        const argValues = expr.args.map((e) => tryExpressionEvaluation(e));

        const result =
            typeof self !== "undefined" &&
            argValues.every((v) => typeof v !== "undefined")
                ? catchNonFatalErrors(() =>
                      interpreter.interpretMethodCall(
                          util.makeMethodCall(
                              self,
                              expr.method,
                              argValues,
                              expr.loc,
                          ),
                      ),
                  )
                : undefined;

        // If the method is a mutates function, then the expression acts as an implicit assignment statement
        // into expr.self.
        // We need to delete the binding for the path expression in expr.self, because
        // currently, method calls in the interpreter do not modify self and they do not return the new value for self.

        const fullPath = tryExtractPath(expr.self);
        if (fullPath === null) {
            // ast.self is not a path expression, i.e., it has the form: a.f()...
            // then there is nothing to update in the environment stack because a.f()... is not a full path to a variable.

            return result;
        }

        const baseName = fullPath[0];
        if (typeof baseName === "undefined") {
            throwInternalCompilerError(
                "path expressions must be non-empty",
                expr.self.loc,
            );
        }

        // Check that the method is a mutates function
        const selfTypeRef = getExpType(ctx, expr.self);

        if (selfTypeRef.kind === "ref") {
            const selfT = getType(ctx, selfTypeRef.name);
            const f = selfT.functions.get(idText(expr.method));
            if (typeof f !== "undefined") {
                if (
                    f.isMutating ||
                    knownStructBuiltInMutationFunctions.includes(
                        idText(expr.method),
                    )
                ) {
                    envStack.deactivateBinding(idText(baseName));
                }
                // Not a mutates function, do nothing
            }
            // Not a registered function in the reference type. Do nothing
        }

        if (selfTypeRef.kind === "map") {
            if (
                knownMapBuiltInMutationFunctions.includes(idText(expr.method))
            ) {
                envStack.deactivateBinding(idText(baseName));
            }
            // Not a mutates function, do nothing
        }

        // Not a reference or map type, so, it cannot have mutates functions
        // Do nothing

        return result;
    }

    function interpretStaticCall(
        expr: A.AstStaticCall,
    ): A.AstLiteral | undefined {
        const argValues = expr.args.map((e) => tryExpressionEvaluation(e));
        if (argValues.every((v) => typeof v !== "undefined")) {
            // Pass the call to the interpreter
            return interpreter.interpretStaticCall(
                util.makeStaticCall(expr.function, argValues, expr.loc),
            );
        } else {
            return undefined;
        }
    }

    function interpretStructInstance(
        expr: A.AstStructInstance,
    ): A.AstLiteral | undefined {
        const structTy = getType(ctx, expr.type);

        // initialize the resulting struct value with
        // the default values for fields with initializers
        // or null for uninitialized optional fields
        const resultMap: Map<string, A.AstLiteral> = new Map();

        for (const field of structTy.fields) {
            if (typeof field.default !== "undefined") {
                resultMap.set(field.name, field.default);
            } else {
                if (field.type.kind === "ref" && field.type.optional) {
                    resultMap.set(field.name, util.makeNullLiteral(field.loc));
                }
            }
        }

        // this will override default fields set above
        for (const fieldWithInit of expr.args) {
            const v = tryExpressionEvaluation(fieldWithInit.initializer);
            if (typeof v !== "undefined") {
                resultMap.set(idText(fieldWithInit.field), v);
            } else {
                resultMap.delete(idText(fieldWithInit.field));
            }
        }

        // Create the field entries for the StructValue
        const structValueFields: A.AstStructFieldValue[] = [];
        for (const [fieldName, fieldValue] of resultMap) {
            // Find the source code declaration, if existent
            const sourceField = expr.args.find(
                (f) => idText(f.field) === fieldName,
            );
            if (typeof sourceField !== "undefined") {
                structValueFields.push(
                    util.makeStructFieldValue(
                        fieldName,
                        fieldValue,
                        sourceField.loc,
                    ),
                );
            } else {
                // Use as source code location the entire struct
                structValueFields.push(
                    util.makeStructFieldValue(fieldName, fieldValue, expr.loc),
                );
            }
        }

        return util.makeStructValue(structValueFields, expr.type, expr.loc);
    }

    function interpretBinaryOp(expr: A.AstOpBinary): A.AstLiteral | undefined {
        // Boolean operators are a source of branching due to short-circuiting

        if (expr.op === "&&") {
            const leftV = tryExpressionEvaluation(expr.left);
            if (typeof leftV !== "undefined") {
                const v = ensureBoolean(leftV).value;
                if (v) {
                    return tryExpressionEvaluation(expr.right);
                } else {
                    return util.makeBooleanLiteral(false, expr.left.loc);
                }
            } else {
                // Branching point detected. Analyze right branch and halt.
                simulateBranch(() => {
                    tryExpressionEvaluation(expr.right);
                });
                throw new InterruptedAnalysis();
            }
        }
        if (expr.op === "||") {
            const leftV = tryExpressionEvaluation(expr.left);
            if (typeof leftV !== "undefined") {
                const v = ensureBoolean(leftV).value;
                if (v) {
                    return util.makeBooleanLiteral(true, expr.left.loc);
                } else {
                    return tryExpressionEvaluation(expr.right);
                }
            } else {
                // Branching point detected. Analyze right branch and halt.
                simulateBranch(() => {
                    tryExpressionEvaluation(expr.right);
                });
                throw new InterruptedAnalysis();
            }
        }

        // Non short-circuiting operators
        const leftV = tryExpressionEvaluation(expr.left);
        const rightV = tryExpressionEvaluation(expr.right);
        if (typeof leftV !== "undefined" && typeof rightV !== "undefined") {
            // Pass it to the interpreter
            return interpreter.interpretBinaryOp(
                util.makeBinaryExpressionLoc(expr.op, leftV, rightV, expr.loc),
            );
        } else {
            return undefined;
        }
    }

    function interpretUnaryOp(expr: A.AstOpUnary): A.AstLiteral | undefined {
        // Special case when expression is of the form "-numberLiteral"
        if (expr.op === "-" && expr.operand.kind === "number") {
            return interpreter.interpretUnaryOp(expr);
        }
        const operand = tryExpressionEvaluation(expr.operand);
        if (typeof operand !== "undefined") {
            return interpreter.interpretUnaryOp(
                util.makeUnaryExpressionLoc(expr.op, operand, expr.loc),
            );
        } else {
            return undefined;
        }
    }

    function interpretInitOf(expr: A.AstInitOf): A.AstLiteral | undefined {
        const argValues = expr.args.map((e) => tryExpressionEvaluation(e));
        if (argValues.every((v) => typeof v !== "undefined")) {
            // Pass the call to the interpreter
            return interpreter.interpretInitOf(
                util.makeInitOf(expr.contract, argValues, expr.loc),
            );
        } else {
            return undefined;
        }
    }

    function simulateBranch(code: () => void) {
        try {
            envStack.simulateInNewEnvironment(code);
        } catch (e) {
            if (e instanceof InterruptedAnalysis) {
                return;
            }
            throw e;
        }
    }
}
