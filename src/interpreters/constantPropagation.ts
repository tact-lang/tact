import { MapFunctions } from "../abi/map";
import { StructFunctions } from "../abi/struct";
import { partiallyEvalExpression } from "../constEval";
import { CompilerContext } from "../context";
import { TactConstEvalError, throwInternalCompilerError } from "../errors";
import {
    AstId,
    AstMethodCall,
    AstNull,
    AstBoolean,
    AstNumber,
    AstString,
    AstOpUnary,
    AstOpBinary,
    AstStructInstance,
    AstFieldAccess,
    AstStaticCall,
    AstFunctionDef,
    AstStatementAugmentedAssign,
    AstStatementLet,
    AstStatement,
    AstStatementAssign,
    tryExtractPath,
    AstCondition,
    AstStatementExpression,
    AstStatementForEach,
    AstStatementRepeat,
    AstStatementReturn,
    AstStatementTry,
    AstStatementTryCatch,
    AstStatementUntil,
    AstStatementWhile,
    AstExpression,
    idText,
    AstAsmFunctionDef,
    AstConstantDef,
    AstContract,
    AstMessageDecl,
    AstNativeFunctionDecl,
    AstPrimitiveTypeDecl,
    AstStructDecl,
    AstTrait,
    SrcInfo,
    AstFunctionDecl,
    AstContractInit,
    AstReceiver,
    AstConditional,
    AstInitOf,
    isValue,
    AstValue,
} from "../grammar/ast";
import { InterpreterInterface } from "../interpreter";
import { extractValue } from "../optimizer/util";
import {
    getAllStaticFunctions,
    getAllTypes,
    getType,
} from "../types/resolveDescriptors";
import { getExpType } from "../types/resolveExpression";
import {
    copyValue,
    eqValues,
    StructValue,
    TypeRef,
    Value,
} from "../types/types";
import {
    defaultInterpreterConfig,
    ensureBoolean,
    ensureRepeatInt,
    Environment,
    EnvironmentStack,
    InterpreterConfig,
    TactInterpreter,
} from "./standard";

class UndefinedValueSignal extends Error {}

type ValueWithStatus = {
    value: Value;
    deleted: boolean;
};

function markAsUndeleted(val: Value): ValueWithStatus {
    return { value: val, deleted: false };
}

const defaultDeletedStatus: ValueWithStatus = { value: null, deleted: true };

export class ConstantPropagationAnalyzer extends InterpreterInterface<
    Value | undefined
> {
    protected cancel_assignments = false;
    protected interpreter: TactInterpreter;
    protected envStack: EnvironmentStack<ValueWithStatus>;
    protected context: CompilerContext;
    protected config: InterpreterConfig;

    constructor(
        context: CompilerContext = new CompilerContext(),
        config: InterpreterConfig = defaultInterpreterConfig,
    ) {
        super();
        this.context = context;
        this.config = config;
        this.envStack = new EnvironmentStack(this.copyValueAndStatus);
        this.interpreter = new TactInterpreter(context, config);
    }

    protected copyValueAndStatus(val: ValueWithStatus): ValueWithStatus {
        return { value: copyValue(val.value), deleted: val.deleted };
    }

    public startAnalysis() {
        this.envStack = new EnvironmentStack(this.copyValueAndStatus);

        // Process all functions
        for (const f of getAllStaticFunctions(this.context)) {
            if (f.ast.kind === "function_def") {
                this.interpretFunctionDef(f.ast);
            } else if (f.ast.kind === "native_function_decl") {
                this.interpretNativeFunctionDecl(f.ast);
            } else if (f.ast.kind === "asm_function_def") {
                this.interpretAsmFunctionDef(f.ast);
            } else {
                this.interpretFunctionDecl(f.ast);
            }
        }

        // Process all types
        for (const t of getAllTypes(this.context)) {
            // Process init
            if (t.init) {
                // Prepare the self struct (contracts are treated as structs by the analyzer)
                const selfStruct: StructValue = { $tactStruct: t.name };
                for (const f of t.fields) {
                    if (f.default !== undefined) {
                        selfStruct[f.name] = f.default;
                    }
                }

                // Include also the constants
                for (const c of t.constants) {
                    if (c.value !== undefined) {
                        selfStruct[c.name] = c.value;
                    }
                }

                this.envStack.setNewBinding(
                    "self",
                    markAsUndeleted(selfStruct),
                );

                this.interpretInitDef(t.init.ast);
            }

            // Update again the self variable for all the following
            // receivers and functions. They will all need a fresh self
            // that includes all the constants.

            // Process receivers
            for (const r of t.receivers) {
                const selfStruct: StructValue = { $tactStruct: t.name };
                for (const c of t.constants) {
                    if (c.value !== undefined) {
                        selfStruct[c.name] = c.value;
                    }
                }

                this.envStack.setNewBinding(
                    "self",
                    markAsUndeleted(selfStruct),
                );

                this.interpretReceiver(r.ast);
            }

            // Process methods
            for (const m of t.functions.values()) {
                if (t.kind === "contract" || t.kind === "trait") {
                    // Attach a self variable
                    const selfStruct: StructValue = { $tactStruct: t.name };
                    for (const c of t.constants) {
                        if (c.value !== undefined) {
                            selfStruct[c.name] = c.value;
                        }
                    }

                    this.envStack.setNewBinding(
                        "self",
                        markAsUndeleted(selfStruct),
                    );
                } else {
                    // reset the self variable
                    this.envStack.setNewBinding("self", defaultDeletedStatus);
                }

                if (m.ast.kind === "function_def") {
                    this.interpretFunctionDef(m.ast);
                } else if (m.ast.kind === "native_function_decl") {
                    this.interpretNativeFunctionDecl(m.ast);
                } else if (m.ast.kind === "asm_function_def") {
                    this.interpretAsmFunctionDef(m.ast);
                } else {
                    this.interpretFunctionDecl(m.ast);
                }
            }
        }
    }

    public interpretFunctionDef(ast: AstFunctionDef) {
        // The arguments are all undetermined.
        const argNames = ast.params.map((param) => idText(param.name));
        const argValues = ast.params.map((_) => defaultDeletedStatus);

        this.envStack.executeInNewEnvironment(
            () => {
                this.executeStatements(ast.statements);
            },
            { names: argNames, values: argValues },
        );
    }

    public interpretAsmFunctionDef(_ast: AstAsmFunctionDef) {
        // Currently not supported. Do nothing
    }

    public interpretInitDef(ast: AstContractInit) {
        // The arguments are all undetermined.
        const argNames = ast.params.map((param) => idText(param.name));
        const argValues = ast.params.map((_) => defaultDeletedStatus);

        this.envStack.executeInNewEnvironment(
            () => {
                this.executeStatements(ast.statements);
            },
            { names: argNames, values: argValues },
        );
    }

    public interpretNativeFunctionDecl(_ast: AstNativeFunctionDecl) {
        // Currently not supported. Do nothing
    }

    public interpretFunctionDecl(_ast: AstFunctionDecl) {
        // Do nothing
    }

    public interpretReceiver(ast: AstReceiver) {
        switch (ast.selector.kind) {
            case "internal-simple":
            case "bounce":
            case "external-simple": {
                // The only argument is undetermined.
                const argName = idText(ast.selector.param.name);
                this.envStack.executeInNewEnvironment(
                    () => {
                        this.executeStatements(ast.statements);
                    },
                    { names: [argName], values: [defaultDeletedStatus] },
                );

                break;
            }
            case "external-comment":
            case "external-fallback":
            case "internal-comment":
            case "internal-fallback":
                // These do not have a named argument
                this.envStack.executeInNewEnvironment(() => {
                    this.executeStatements(ast.statements);
                });
                break;
        }
    }

    /* These methods are required by the interpreter interface, but are not used by the analyzer.
       They are already subsumed by the startAnalysis method. */

    public interpretConstantDef(_ast: AstConstantDef) {}

    public interpretStructDecl(_ast: AstStructDecl) {}

    public interpretMessageDecl(_ast: AstMessageDecl) {}

    public interpretPrimitiveTypeDecl(_ast: AstPrimitiveTypeDecl) {}

    public interpretContract(_ast: AstContract) {}

    public interpretTrait(_ast: AstTrait) {}

    /* Required but not used methods end here */

    public interpretName(ast: AstId): Value | undefined {
        return this.prepareForStandardInterpreter(() =>
            this.interpreter.interpretName(ast),
        );
    }

    public interpretMethodCall(ast: AstMethodCall): Value | undefined {
        // For the moment do not analyze.

        // Just evaluate all the arguments
        this.interpretExpression(ast.self);
        ast.args.forEach((expr) => this.interpretExpression(expr), this);

        // Also, if the method is a mutates function, the assigned path should be undetermined.
        const path = tryExtractPath(ast.self);
        if (path !== null) {
            const src = getExpType(this.context, ast.self);

            if (src.kind === "ref") {
                const srcT = getType(this.context, src.name);
                if (srcT.kind === "struct") {
                    if (StructFunctions.has(idText(ast.method))) {
                        // Treat all API functions as black boxes
                        // Hence, their self parameter could be mutated
                        this.updateBinding(
                            path,
                            ast.self,
                            undefined,
                            ast.self.loc,
                        );
                    }
                }

                const f = srcT.functions.get(idText(ast.method))?.isMutating;
                if (f) {
                    this.updateBinding(path, ast.self, undefined, ast.self.loc);
                }
            }

            if (src.kind === "map") {
                if (MapFunctions.has(idText(ast.method))) {
                    // Treat all API functions as black boxes
                    // Hence, their self parameter could be mutated
                    this.updateBinding(path, ast.self, undefined, ast.self.loc);
                }
            }
        }
        // If the ast.self is not a path expression, i.e., it has the form: a.b.f().g()...
        // then there is nothing to update in the environment because a.b.f().g() is not a full path to a variable.

        // Since we are not analyzing the function, just return undefined.
        return undefined;
    }

    public interpretInitOf(ast: AstInitOf): Value | undefined {
        // Currently not supported.

        // Just evaluate the arguments, but do nothing else
        ast.args.forEach((expr) => this.interpretExpression(expr), this);

        return undefined;
    }

    public interpretNull(ast: AstNull): Value | undefined {
        return this.prepareForStandardInterpreter(() =>
            this.interpreter.interpretNull(ast),
        );
    }

    public interpretBoolean(ast: AstBoolean): Value | undefined {
        return this.prepareForStandardInterpreter(() =>
            this.interpreter.interpretBoolean(ast),
        );
    }

    public interpretNumber(ast: AstNumber): Value | undefined {
        return this.prepareForStandardInterpreter(() =>
            this.interpreter.interpretNumber(ast),
        );
    }

    public interpretString(ast: AstString): Value | undefined {
        return this.prepareForStandardInterpreter(() =>
            this.interpreter.interpretString(ast),
        );
    }

    public interpretUnaryOp(ast: AstOpUnary): Value | undefined {
        const operandEvaluator = () => {
            const result = this.interpretExpression(ast.operand);
            if (result === undefined) {
                throw new UndefinedValueSignal();
            }
            return result;
        };

        return this.prepareForStandardInterpreter(() =>
            this.interpreter.evalUnaryOp(ast, operandEvaluator),
        );
    }

    public interpretBinaryOp(ast: AstOpBinary): Value | undefined {
        const leftValue = this.interpretExpression(ast.left);

        if (leftValue !== undefined) {
            const rightEvaluator = () => {
                const result = this.interpretExpression(ast.right);
                if (result === undefined) {
                    throw new UndefinedValueSignal();
                }
                return result;
            };

            return this.prepareForStandardInterpreter(() =>
                this.interpreter.evalBinaryOp(ast, leftValue, rightEvaluator),
            );
        } else {
            // Keep going executing the right operand
            this.interpretExpression(ast.right);
            // But return undefined
            return undefined;
        }
    }

    public interpretConditional(ast: AstConditional): Value | undefined {
        // Collect the true and false branches.
        const trueBranch = () => this.interpretExpression(ast.thenBranch);
        const falseBranch = () => this.interpretExpression(ast.elseBranch);

        // Attempt to evaluate the condition
        let condition = this.interpretExpression(ast.condition);

        // If the condition produced a value, transform it to boolean.
        if (condition !== undefined) {
            condition = ensureBoolean(condition, ast.condition.loc);
        }

        return this.processConditionalExpressionBranches(
            trueBranch,
            falseBranch,
            condition,
        );
    }

    public interpretStructInstance(ast: AstStructInstance): Value | undefined {
        // This is just a copy of the standard interpreter
        const structTy = getType(this.context, ast.type);

        // Since linter does not like removing dynamic keys from objects using the "delete" operator
        // we will work with maps. The final map will be transformed into an object at the end.

        const initialMap: Map<string, Value> = new Map();
        initialMap.set("$tactStruct", idText(ast.type));

        const resultWithDefaultFields = structTy.fields.reduce(
            (resObj, field) => {
                if (field.default !== undefined) {
                    resObj.set(field.name, field.default);
                } else {
                    if (field.type.kind === "ref" && field.type.optional) {
                        resObj.set(field.name, null);
                    }
                }
                return resObj;
            },
            initialMap,
        );

        // this will override default fields set above
        // This is the only part that differs from the standard interpreter:
        // if an initializer produces an undefined expression, remove such
        // field because it is now undetermined.
        const finalMap = ast.args.reduce((resObj, fieldWithInit) => {
            const val = this.interpretExpression(fieldWithInit.initializer);
            if (val !== undefined) {
                resObj.set(idText(fieldWithInit.field), val);
            } else {
                // Delete it, just in case a default value was added
                resObj.delete(idText(fieldWithInit.field));
            }
            return resObj;
        }, resultWithDefaultFields);

        return Object.fromEntries(finalMap);
    }

    public interpretFieldAccess(ast: AstFieldAccess): Value | undefined {
        const val = this.interpretExpression(ast.aggregate);
        if (val !== undefined) {
            // The typechecker already made all the checks,
            // so, val is ensured to be struct-like.
            const structValue = val as StructValue;

            if (idText(ast.field) in structValue) {
                return structValue[idText(ast.field)];
            } else {
                // The analyzer works with partially constructed structs, so,
                // simply return undefined
                return undefined;
            }
        }
        return undefined;
    }

    public interpretStaticCall(ast: AstStaticCall): Value | undefined {
        // For the moment, do not analyze. I need to find a way to handle recursive calls,
        // it is tricky.

        // Just evaluate the arguments
        ast.args.forEach((expr) => this.interpretExpression(expr), this);
        return undefined;
    }

    public interpretLetStatement(ast: AstStatementLet) {
        // Need to try evaluation of expression. If this fails,
        // "undefined" is the final value

        const val = this.analyzeTopLevelExpression(ast.expression);
        // In case the cancel_assignments flag is active, treat the expression
        // as failed, since the assigned variable will be treated as undetermined.
        this.storeNewBinding(
            ast.name,
            this.cancel_assignments ? undefined : val,
        );
    }

    public interpretAssignStatement(ast: AstStatementAssign) {
        const fullPath = tryExtractPath(ast.path);

        if (fullPath !== null && fullPath.length > 0) {
            // Need to try evaluation of expression. If this fails,
            // "undefined" is the final value

            const val = this.analyzeTopLevelExpression(ast.expression);

            // In case the cancel_assignments flag is active, treat the expression
            // as failed, since the assigned variable will be treated as undetermined.
            this.updateBinding(
                fullPath,
                ast.path,
                this.cancel_assignments ? undefined : val,
                ast.loc,
            );
        } else {
            throwInternalCompilerError(
                "assignments allow path expressions only",
                ast.path.loc,
            );
        }
    }

    public interpretAugmentedAssignStatement(ast: AstStatementAugmentedAssign) {
        const fullPath = tryExtractPath(ast.path);

        if (fullPath !== null && fullPath.length > 0) {
            // Need to try evaluation of expressions. If at any point this fails,
            // "undefined" is the final value

            let currentPathValue: Value | undefined = undefined;

            // In an assignment, the path is either a field access or an id
            if (ast.path.kind === "field_access") {
                currentPathValue = this.interpretFieldAccess(ast.path);
            } else if (ast.path.kind === "id") {
                currentPathValue = this.interpretName(ast.path);
            } else {
                throwInternalCompilerError(
                    "assignments allow path expressions only",
                    ast.path.loc,
                );
            }

            if (currentPathValue !== undefined) {
                const updateExprEvaluator = () => {
                    const result = this.interpretExpression(ast.expression);
                    if (result === undefined) {
                        throw new UndefinedValueSignal();
                    }
                    return result;
                };

                const newVal = this.prepareForStandardInterpreter(() =>
                    this.interpreter.evalBinaryOpInAugmentedAssign(
                        ast,
                        currentPathValue,
                        updateExprEvaluator,
                    ),
                );
                // In case the cancel_assignments flag is active, treat the expression
                // as failed, since the assigned variable will be treated as undetermined.
                this.updateBinding(
                    fullPath,
                    ast.path,
                    this.cancel_assignments ? undefined : newVal,
                    ast.loc,
                );
            } else {
                // Keep going executing the update expression operand
                this.interpretExpression(ast.expression);
                // But assign undefined
                this.updateBinding(fullPath, ast.path, undefined, ast.loc);
            }
        } else {
            throwInternalCompilerError(
                "assignments allow path expressions only",
                ast.path.loc,
            );
        }
    }

    public interpretConditionStatement(ast: AstCondition) {
        // Collect the true and false branches.
        const trueBranch = () => {
            this.executeStatements(ast.trueStatements);
        };
        let falseBranch: () => void;

        if (ast.falseStatements !== null) {
            // The typechecker ensures that there is no elseif branch
            falseBranch = () => {
                this.executeStatements(ast.falseStatements!);
            };
        } else if (ast.elseif !== null) {
            falseBranch = () => {
                this.interpretConditionStatement(ast.elseif!);
            };
        } else {
            // The "do nothing" branch
            falseBranch = () => {};
        }

        // Attempt to evaluate the condition
        const conditionValue = this.analyzeTopLevelExpression(ast.condition);
        let condition: boolean | undefined = undefined;

        // If the condition produced a value, transform it to boolean.
        if (conditionValue !== undefined) {
            condition = ensureBoolean(conditionValue, ast.condition.loc);
        }

        this.processConditionBranches(trueBranch, falseBranch, condition);
    }

    public interpretExpressionStatement(ast: AstStatementExpression) {
        // Keep executing if a non-fatal error occurs.
        this.analyzeTopLevelExpression(ast.expression);
    }

    public interpretForEachStatement(ast: AstStatementForEach) {
        // Attempt to evaluate the map expression.
        // Currently, the analyzer does not trace the
        // set method for maps. Therefore, it is not safe
        // to attempt to determine if the map expression is empty or not.
        this.analyzeTopLevelExpression(ast.map);

        const loopBodyBranch = () => {
            this.executeStatements(ast.statements);
        };

        // Simulate the loop body as if it executes once
        // This is necessary to emulate the behavior of FunC analyzer
        this.envStack.simulate(loopBodyBranch);

        // Since it is not known if the map expression is empty or not,
        // it is required to take both branches.

        // We need to do a worst case analysis:

        // Make assigned variables undetermined
        const cancelledVarsEnv = this.envStack.simulate(() => {
            const prevAssignment = this.cancel_assignments;
            try {
                this.cancel_assignments = true;
                loopBodyBranch();
            } finally {
                this.cancel_assignments = prevAssignment;
            }
        });

        // Starting with the environment in the previous step, run the loop branch again
        // but this time not making variables undetermined
        const loopEnv = this.envStack.simulate(
            loopBodyBranch,
            cancelledVarsEnv.env,
        );

        // Join the two environments: the "do nothing" branch is represented
        // by the current environment.
        this.joinIntoCurrentStack([
            loopEnv.env,
            this.envStack.getCurrentEnvironment(),
        ]);
    }

    public interpretRepeatStatement(ast: AstStatementRepeat) {
        // Attempt to evaluate the iterations
        const iterationsValue = this.analyzeTopLevelExpression(ast.iterations);

        let iterations: bigint | undefined = undefined;

        // If it produced a value, transform it to integer
        // and execute the loop body
        if (iterationsValue !== undefined) {
            iterations = ensureRepeatInt(iterationsValue, ast.iterations.loc);
        }

        this.processRepeatBranches(ast.statements, iterations);
    }

    public interpretReturnStatement(ast: AstStatementReturn) {
        // Interpret the expression, but do nothing with it
        if (ast.expression !== null) {
            this.analyzeTopLevelExpression(ast.expression);
        }
    }

    public interpretTryStatement(ast: AstStatementTry) {
        // Simulate the try branch
        const tryEnv = this.envStack.simulate(() => {
            this.executeStatements(ast.statements);
        });

        // Join the try branch and the "empty catch" branch.
        // The later is represented by the current environment
        this.joinIntoCurrentStack([
            tryEnv.env,
            this.envStack.getCurrentEnvironment(),
        ]);
    }

    public interpretTryCatchStatement(ast: AstStatementTryCatch) {
        // Simulate the try and catch branches
        const tryEnv = this.envStack.simulate(() => {
            this.executeStatements(ast.statements);
        });
        const catchEnv = this.envStack.simulate(() => {
            this.executeStatements(ast.catchStatements);
        });

        // Join the try and catch branches
        this.joinIntoCurrentStack([tryEnv.env, catchEnv.env]);
    }

    public interpretUntilStatement(ast: AstStatementUntil): void {
        // The loop body always executes at least once
        this.executeStatements(ast.statements);

        // Attempt to evaluate the condition
        const conditionValue = this.analyzeTopLevelExpression(ast.condition);

        let condition: boolean | undefined = undefined;

        // If it produced a value, transform it to boolean
        if (conditionValue !== undefined) {
            condition = ensureBoolean(conditionValue, ast.condition.loc);
        }

        this.processUntilBranches(ast.statements, condition);
    }

    public interpretWhileStatement(ast: AstStatementWhile) {
        // Attempt to evaluate the condition
        const conditionValue = this.analyzeTopLevelExpression(ast.condition);

        let condition: boolean | undefined = undefined;

        // If it produced a value, transform it to boolean
        // and execute the loop body.
        if (conditionValue !== undefined) {
            condition = ensureBoolean(conditionValue, ast.condition.loc);
        }

        this.processWhileBranches(ast.statements, condition);
    }

    public storeNewBinding(id: AstId, exprValue: Value | undefined) {
        // If exprValue is undefined, then the variable is undetermined.
        if (exprValue !== undefined) {
            // Make a copy of exprValue, because everything is assigned by value
            this.envStack.setNewBinding(
                idText(id),
                markAsUndeleted(copyValue(exprValue)),
            );
        } else {
            this.envStack.setNewBinding(idText(id), defaultDeletedStatus);
        }
    }

    public updateBinding(
        path: AstId[],
        pathExpr: AstExpression,
        exprValue: Value | undefined,
        src: SrcInfo,
    ) {
        if (exprValue !== undefined) {
            // Typechecking ensures that there is at least one element in path
            if (path.length === 1) {
                // Make a copy of exprValue, because everything is assigned by value
                this.envStack.updateBinding(
                    idText(path[0]!),
                    markAsUndeleted(copyValue(exprValue)),
                );
            } else {
                const baseVal = this.interpretName(path[0]!);
                let currentStruct: StructValue = {};
                const pathTypes = this.extractPathTypes(pathExpr);

                if (baseVal !== undefined) {
                    // Typechecking ensures that path[0] is a struct-like object (contract/traits are treated as structs by the analyzer).
                    currentStruct = baseVal as StructValue;
                } else {
                    // Create a partially constructed struct-like object.
                    currentStruct["$tactStruct"] = pathTypes[0]!;
                }

                const baseStruct = currentStruct;

                // Fill fields in the path from 1 to path.length-2 (if they are not filled already)
                for (let i = 1; i <= path.length - 2; i++) {
                    const field = idText(path[i]!);
                    if (field in currentStruct) {
                        // Since we are not accessing the last field, the typechecker
                        // ensures that the field stores a struct-like object
                        currentStruct = currentStruct[field] as StructValue;
                    } else {
                        // Create a dummy struct at the field
                        const tempStruct: StructValue = {
                            $tactStruct: pathTypes[i]!,
                        };
                        currentStruct[field] = tempStruct;
                        currentStruct = tempStruct;
                    }
                }

                // Store the constructed struct
                this.storeNewBinding(path[0]!, baseStruct);
                // And now proceed as in the standard interpreter
                this.prepareForStandardInterpreter(() => {
                    this.interpreter.updateBinding(path, exprValue, src);
                });
            }
        } else {
            // Because the value is undefined, the full path is undetermined

            if (path.length === 1) {
                // Remove the binding
                this.envStack.updateBinding(
                    idText(path[0]!),
                    defaultDeletedStatus,
                );
            } else {
                // We will need to delete the last field of the last struct in the path[0..length-2] in case path[0..length-2] is defined.
                // Since the linter does not allow deleting dynamic keys from objects using the "delete" operator,
                // we do the following workaround:

                // Keep track of the current struct of the path AND the parent struct of the current struct.
                // Once you arrive to the final struct, extract its entries, remove the entry corresponding to the field
                // you want to remove, and transform the list of entries back to an object.
                // Finally, assign the modified struct back into the parent to simulate the "delete" operator.

                // Complication: the parent struct is only defined when the path has at least length 3. Hence, we need
                // to treat the case of path length 2 separately.

                // Now the rant: the above logic would be much easier if "delete" operator was allowed because in such case
                // there is no need to keep track of the parent struct. Suggestions to improve this logic are welcomed.

                // If while looking up the path, it fails to resolve to a value, there is no need to continue, because
                // the full path is going to be undetermined anyway.
                const baseVal = this.interpretName(path[0]!);

                if (baseVal === undefined) {
                    return;
                }

                // Typechecking ensures that path[0] is a struct-like object (contract/traits are treated as structs by the analyzer).
                let currentStruct = baseVal as StructValue;
                const pathNames = path.map(idText);

                if (!(pathNames[1]! in currentStruct)) {
                    return;
                }

                // So, at this moment, "currentStruct" is the struct at path[0], and it has
                // the field at path[1].

                // Handle the special case.
                if (path.length === 2) {
                    // Field at path[1] needs to be removed
                    const filteredEntries = new Map(
                        Object.entries(currentStruct),
                    );
                    filteredEntries.delete(pathNames[1]!);
                    const finalStruct = Object.fromEntries(filteredEntries);
                    this.envStack.updateBinding(
                        pathNames[0]!,
                        markAsUndeleted(finalStruct),
                    );
                    return;
                }

                // Now the case when the path has at least length 3.
                // Initially, the parent struct is the one at path[0] and current struct is the struct after
                // accessing field at path[1];
                let parentStruct = currentStruct;
                currentStruct = currentStruct[pathNames[1]!] as StructValue; // Since the path has length at least 3, this is not
                // the last field in the path. Hence, the typechecker
                // ensures this is a struct-like object.
                // Also, at this moment, we know field path[1] exists
                // in currentStruct.

                for (let i = 2; i <= path.length - 2; i++) {
                    const field = pathNames[i]!;
                    if (field in currentStruct) {
                        // Since we are not accessing the last field, the typechecker
                        // ensures that the field stores a struct-like object
                        parentStruct = currentStruct;
                        currentStruct = currentStruct[field] as StructValue;
                    } else {
                        // Field is not in the struct. This means that the full path
                        // failed to resolve to a value.
                        // Hence, stop here, since the full path is already undetermined.
                        return;
                    }
                }

                // Now, remove the last field from the current struct
                const filteredEntries = new Map(Object.entries(currentStruct));
                filteredEntries.delete(pathNames[path.length - 1]!);
                const finalStruct = Object.fromEntries(filteredEntries);
                // Assign it back into the parent
                parentStruct[pathNames[path.length - 2]!] = finalStruct;
            }
        }
    }

    protected analyzeTopLevelExpression(
        expr: AstExpression,
    ): Value | undefined {
        try {
            this.interpreter.setEnvironmentStack(
                new WrapperStack(this.envStack),
            );
            const result = this.envStack.simulate(() => {
                const result = partiallyEvalExpression(
                    expr,
                    this.context,
                    this.interpreter,
                );
                if (isValue(result)) {
                    return extractValue(result as AstValue);
                }
                throw new UndefinedValueSignal();
            });
            this.envStack.setCurrentEnvironment(result.env);
            return result.val;
        } catch (e) {
            if (e instanceof TactConstEvalError) {
                if (!e.fatal) {
                    return this.interpretExpression(expr);
                }
            }
            if (e instanceof UndefinedValueSignal) {
                return this.interpretExpression(expr);
            }
            throw e;
        }
    }

    protected prepareForStandardInterpreter<T>(code: () => T): T | undefined {
        try {
            this.interpreter.setEnvironmentStack(
                new WrapperStack(this.envStack),
            );
            const result = code();
            return result;
        } catch (e) {
            if (e instanceof TactConstEvalError) {
                if (!e.fatal) {
                    return undefined;
                }
            }
            if (e instanceof UndefinedValueSignal) {
                return undefined;
            }
            throw e;
        }
    }

    protected processConditionalExpressionBranches(
        trueBranch: () => Value | undefined,
        falseBranch: () => Value | undefined,
        condition?: boolean,
    ): Value | undefined {
        // Simulate the true and false branches
        const trueEnv = this.envStack.simulate(trueBranch);
        const falseEnv = this.envStack.simulate(falseBranch);

        // If the condition is actually defined, take the corresponding environment.
        // If not, join the two environments with respect to the current environment.
        if (condition !== undefined) {
            if (condition) {
                this.updateCurrentStack(trueEnv.env);
                return trueEnv.val;
            } else {
                this.updateCurrentStack(falseEnv.env);
                return falseEnv.val;
            }
        } else {
            this.joinIntoCurrentStack([trueEnv.env, falseEnv.env]);
            // We return undefined if the values from each branch are different
            if (trueEnv.val === undefined || falseEnv.val === undefined) {
                // Independently of the value of the branches, if at least one is undefined,
                // the final result will be undefined
                return undefined;
            } else if (eqValues(trueEnv.val, falseEnv.val)) {
                return trueEnv.val;
            } else {
                return undefined;
            }
        }
    }

    protected processConditionBranches(
        trueBranch: () => void,
        falseBranch: () => void,
        condition?: boolean,
    ): void {
        // Simulate the true and false branches
        const trueEnv = this.envStack.simulate(trueBranch);
        const falseEnv = this.envStack.simulate(falseBranch);

        // If the condition is actually defined, take the corresponding environment.
        // If not, join the two environments with respect to the current environment.
        if (condition !== undefined) {
            if (condition) {
                this.updateCurrentStack(trueEnv.env);
            } else {
                this.updateCurrentStack(falseEnv.env);
            }
        } else {
            this.joinIntoCurrentStack([trueEnv.env, falseEnv.env]);
        }
    }

    protected processRepeatBranches(
        statements: AstStatement[],
        iterations?: bigint,
    ) {
        const repeatBodyBranch = () => {
            this.executeStatements(statements);
        };

        // Simulate the loop body as if it executes once
        // This is necessary to emulate the behavior of FunC analyzer
        this.envStack.simulate(repeatBodyBranch);

        if (iterations !== undefined) {
            if (iterations > 0) {
                if (iterations <= this.config.maxLoopIterations) {
                    // Actually execute the loop and set the resulting environment
                    const finalEnv = this.envStack.simulate(() => {
                        for (let i = 1n; i <= iterations; i++) {
                            repeatBodyBranch();
                        }
                    });
                    this.updateCurrentStack(finalEnv.env);
                } else {
                    // Take the loop body branch, but do it using a worst case analysis
                    // because it is not possible to execute all the iterations

                    // First, run the loop branch but making undetermined any variable that gets assigned
                    const cancelledVarsEnv = this.envStack.simulate(() => {
                        const prevAssignment = this.cancel_assignments;
                        try {
                            this.cancel_assignments = true;
                            repeatBodyBranch();
                        } finally {
                            this.cancel_assignments = prevAssignment;
                        }
                    });

                    // Starting with the environment in the previous step, run the loop branch again
                    // but this time not making variables undetermined
                    const finalEnv = this.envStack.simulate(
                        repeatBodyBranch,
                        cancelledVarsEnv.env,
                    );

                    this.updateCurrentStack(finalEnv.env);
                }
            }
            // Take the "do nothing" branch. In other words, leave the environment as currently is
        } else {
            // Take both branches

            // For the loop branch, we need to do a worst case analysis:

            // Make assigned variables undetermined
            const cancelledVarsEnv = this.envStack.simulate(() => {
                const prevAssignment = this.cancel_assignments;
                try {
                    this.cancel_assignments = true;
                    repeatBodyBranch();
                } finally {
                    this.cancel_assignments = prevAssignment;
                }
            });

            // Starting with the environment in the previous step, run the loop branch again
            // but this time not making variables undetermined
            const loopEnv = this.envStack.simulate(
                repeatBodyBranch,
                cancelledVarsEnv.env,
            );

            // Join the two environments: the "do nothing" branch is represented
            // by the current environment.
            this.joinIntoCurrentStack([
                loopEnv.env,
                this.envStack.getCurrentEnvironment(),
            ]);
        }
    }

    protected processUntilBranches(
        statements: AstStatement[],
        condition?: boolean,
    ) {
        const loopBodyBranch = () => {
            this.executeStatements(statements);
        };

        if (condition !== undefined) {
            if (!condition) {
                // Take the loop body branch, but do it using a worst case analysis
                // because the number of iterations is unknown

                // First, run the loop branch but making undetermined any variable that gets assigned
                const cancelledVarsEnv = this.envStack.simulate(() => {
                    const prevAssignment = this.cancel_assignments;
                    try {
                        this.cancel_assignments = true;
                        loopBodyBranch();
                    } finally {
                        this.cancel_assignments = prevAssignment;
                    }
                });

                // Starting with the environment in the previous step, run the loop branch again
                // but this time not making variables undetermined
                const finalEnv = this.envStack.simulate(
                    loopBodyBranch,
                    cancelledVarsEnv.env,
                );

                this.updateCurrentStack(finalEnv.env);
            }
            // Take the "do nothing" branch. In other words, leave the environment as currently is
        } else {
            // Take both branches

            // For the loop branch, we need to do a worst case analysis:

            // Make assigned variables undetermined
            const cancelledVarsEnv = this.envStack.simulate(() => {
                const prevAssignment = this.cancel_assignments;
                try {
                    this.cancel_assignments = true;
                    loopBodyBranch();
                } finally {
                    this.cancel_assignments = prevAssignment;
                }
            });

            // Starting with the environment in the previous step, run the loop branch again
            // but this time not making variables undetermined
            const loopEnv = this.envStack.simulate(
                loopBodyBranch,
                cancelledVarsEnv.env,
            );

            // Join the two environments: the "do nothing" branch is represented
            // by the current environment.
            this.joinIntoCurrentStack([
                loopEnv.env,
                this.envStack.getCurrentEnvironment(),
            ]);
        }
    }

    protected processWhileBranches(
        statements: AstStatement[],
        condition?: boolean,
    ) {
        const loopBodyBranch = () => {
            this.executeStatements(statements);
        };

        // Simulate the loop body as if it executes once
        // This is necessary to emulate the behavior of FunC analyzer
        this.envStack.simulate(loopBodyBranch);

        if (condition !== undefined) {
            if (condition) {
                // Take the loop body branch, but do it using a worst case analysis
                // because the number of iterations is unknown

                // First, run the loop branch but making undetermined any variable that gets assigned
                const cancelledVarsEnv = this.envStack.simulate(() => {
                    const prevAssignment = this.cancel_assignments;
                    try {
                        this.cancel_assignments = true;
                        loopBodyBranch();
                    } finally {
                        this.cancel_assignments = prevAssignment;
                    }
                });

                // Starting with the environment in the previous step, run the loop branch again
                // but this time not making variables undetermined
                const finalEnv = this.envStack.simulate(
                    loopBodyBranch,
                    cancelledVarsEnv.env,
                );

                this.updateCurrentStack(finalEnv.env);
            }
            // Take the "do nothing" branch. In other words, leave the environment as currently is
        } else {
            // Take both branches

            // For the loop branch, we need to do a worst case analysis:

            // Make assigned variables undetermined
            const cancelledVarsEnv = this.envStack.simulate(() => {
                const prevAssignment = this.cancel_assignments;
                try {
                    this.cancel_assignments = true;
                    loopBodyBranch();
                } finally {
                    this.cancel_assignments = prevAssignment;
                }
            });

            // Starting with the environment in the previous step, run the loop branch again
            // but this time not making variables undetermined
            const loopEnv = this.envStack.simulate(
                loopBodyBranch,
                cancelledVarsEnv.env,
            );

            // Join the two environments: the "do nothing" branch is represented
            // by the current environment.
            this.joinIntoCurrentStack([
                loopEnv.env,
                this.envStack.getCurrentEnvironment(),
            ]);
        }
    }

    /**
     * Takes the origin stack and updates it with values in the target stack. It only updates those variables that exist
     * in both stacks.
     *
     * The procedure assumes that both stacks have the same number of environments. This should be true if opening
     * environment nodes is only done through the method envStack.executeInNewEnvironment.
     *
     * Returns the updated stack.
     *
     */
    protected updateOriginStackIntoTarget(
        origin: Environment<ValueWithStatus>,
        target: Environment<ValueWithStatus>,
    ): Environment<ValueWithStatus> {
        // Intersect the keys in the values map of the origin with those in the target
        let keys = new Set(origin.values.keys());
        keys = keys.intersection(new Set(target.values.keys()));

        // Of the surviving keys, set the values as found in the target environment
        const finalNames: Map<string, ValueWithStatus> = new Map();

        for (const key of keys) {
            finalNames.set(key, target.values.get(key)!);
        }

        let newOriginParent: Environment<ValueWithStatus> | undefined =
            undefined;

        // Now update the parent origin environment
        if (origin.parent !== undefined && target.parent !== undefined) {
            newOriginParent = this.updateOriginStackIntoTarget(
                origin.parent,
                target.parent,
            );
        } else if (
            (origin.parent === undefined && target.parent !== undefined) ||
            (origin.parent !== undefined && target.parent === undefined)
        ) {
            // This should not happen. This is a programmer's error
            throwInternalCompilerError(
                "Cannot update origin environment stack into target stack because they have different lengths.",
            );
        }

        return { values: finalNames, parent: newOriginParent };
    }

    protected updateCurrentStack(env: Environment<ValueWithStatus>) {
        const newEnv = this.updateOriginStackIntoTarget(
            this.envStack.getCurrentEnvironment(),
            env,
        );
        // Update the current environment with the final values
        this.envStack.setCurrentEnvironment(newEnv);
    }

    /**
     * Joins the target stacks into the origin stack.
     * The procedure assumes that the origin and target stacks have the same number of environments. This should be true if opening
     * environment nodes is only done through the method envStack.executeInNewEnvironment.
     *
     * Returns the updated stack after the targets have been joined into it.
     * @param origin
     * @param targets
     * @returns
     */
    protected joinTargetsIntoOrigin(
        origin: Environment<ValueWithStatus>,
        targets: Environment<ValueWithStatus>[],
    ): Environment<ValueWithStatus> {
        // Intersect the keys in the values map using the origin as base
        let keys = new Set(origin.values.keys());
        for (const env of targets) {
            keys = keys.intersection(new Set(env.values.keys()));
        }

        // For those names that survived in keys, keep those that
        // have the same value in all the provided targets
        const finalNames: Map<string, ValueWithStatus> = new Map();

        const pivotEnv = targets.pop();

        if (pivotEnv !== undefined) {
            // Fill the initial values as found in the pivot environment
            for (const key of keys) {
                finalNames.set(key, pivotEnv.values.get(key)!); // key is ensured to be in pivotEnv because keys is the intersection of all envs.
            }

            // Now, extract the common values with respect to each of the target environments
            l_key: for (const key of keys) {
                for (const env of targets) {
                    const currentVal = finalNames.get(key)!; // key is ensured to be in finalNames because finalNames was initialized with set "keys"
                    const alternativeVal = env.values.get(key)!; // key is ensured to be in env because keys is the intersection of all envs.

                    // If either the current or the alternative have been deleted, the final value is deleted
                    if (currentVal.deleted || alternativeVal.deleted) {
                        finalNames.set(key, defaultDeletedStatus);
                        // There is no need to keep checking for the rest of the target environments
                        // because the key as already undetermined, independently of the value of the rest
                        // of the target environments. So, just move to the next key.
                        continue l_key;
                    }

                    // Here, it is ensured that currentVal and alternativeVal are marked as not deleted.
                    const commonSubValue = extractCommonSubValue(
                        currentVal.value,
                        alternativeVal.value,
                    );
                    if (commonSubValue !== undefined) {
                        finalNames.set(key, markAsUndeleted(commonSubValue));
                    } else {
                        // The values have no common sub-part or sub-structure, so, it is as if the value is deleted
                        finalNames.set(key, defaultDeletedStatus);
                        // There is no need to keep checking for the rest of the target environments
                        // because the key as already undetermined, independently of the value of the rest
                        // of the target environments. So, just move to the next key.
                        continue l_key;
                    }
                }
            }

            // Put the pivot environment back into the targets
            targets.push(pivotEnv);
        }

        let newOriginParent: Environment<ValueWithStatus> | undefined =
            undefined;

        const targetParents = targets.map((env) => env.parent);

        // Now join the parent environments
        if (
            origin.parent !== undefined &&
            targetParents.every((env) => env !== undefined)
        ) {
            newOriginParent = this.joinTargetsIntoOrigin(
                origin.parent,
                targetParents,
            );
        } else if (
            (origin.parent !== undefined &&
                targetParents.some((env) => env === undefined)) ||
            (origin.parent === undefined &&
                targetParents.every((env) => env !== undefined))
        ) {
            // This should not happen. This is a programmer's error
            throwInternalCompilerError(
                "Cannot join target environment stacks into origin stack because they have different lengths.",
            );
        }
        return { values: finalNames, parent: newOriginParent };
    }

    protected joinIntoCurrentStack(envs: Environment<ValueWithStatus>[]) {
        const newEnv = this.joinTargetsIntoOrigin(
            this.envStack.getCurrentEnvironment(),
            envs,
        );
        this.envStack.setCurrentEnvironment(newEnv);
    }

    protected extractPathTypes(path: AstExpression): string[] {
        function buildStep(parentTypes: string[], expType: TypeRef): string[] {
            if (expType.kind === "ref" || expType.kind === "ref_bounced") {
                return [...parentTypes, expType.name];
            } else if (expType.kind === "map") {
                return [...parentTypes, `map<${expType.key},${expType.value}>`];
            } else if (expType.kind === "void") {
                return [...parentTypes, "void"];
            } else {
                return [...parentTypes, "null"];
            }
        }

        // A path expression can either be a field access or an id.
        if (path.kind === "field_access") {
            const expType = getExpType(this.context, path);
            const parentTypes = this.extractPathTypes(path.aggregate);
            return buildStep(parentTypes, expType);
        } else if (path.kind === "id") {
            const expType = getExpType(this.context, path);
            return buildStep([], expType);
        } else {
            throwInternalCompilerError(
                "only path expressions allowed.",
                path.loc,
            );
        }
    }
}

/**
 * Extracts the common part of two values. For atomic types, this just compares if the values are equal.
 * For StructValues, this extracts the part of both structs that is common to them. This is necessary
 * because the analyzer works with partially constructed structs. So, when joining different branches,
 * we need to keep the part of the structs that remain the same in the branches.
 */
function extractCommonSubValue(val1: Value, val2: Value): Value | undefined {
    if (val1 === null) {
        return eqValues(val1, val2) ? val1 : undefined;
    } else if (typeof val1 === "object" && "$tactStruct" in val1) {
        if (
            typeof val2 === "object" &&
            val2 !== null &&
            "$tactStruct" in val2
        ) {
            const val1Keys = new Set(Object.keys(val1));
            const val2Keys = new Set(Object.keys(val2));
            const commonKeys = val1Keys.intersection(val2Keys);
            // Since "$tactStruct" is in both val1 and val2,
            // commonKeys contains at least "$tactStruct".

            const result: StructValue = {};

            for (const key of commonKeys) {
                const commonVal = extractCommonSubValue(val1[key]!, val2[key]!);
                if (commonVal !== undefined) {
                    result[key] = commonVal;
                }
            }

            return result;
        } else {
            return undefined;
        }
    } else {
        // The rest of values, since they do not have further sub structure,
        // just compare for equality as in the case for null
        return eqValues(val1, val2) ? val1 : undefined;
    }
}

class WrapperStack extends EnvironmentStack<Value> {
    private env: EnvironmentStack<ValueWithStatus>;

    constructor(env: EnvironmentStack<ValueWithStatus>) {
        super(copyValue);
        this.env = env;
    }

    // Overwrite all the public methods and just pass the logic to the private environment
    public setNewBinding(name: string, val: Value) {
        this.env.setNewBinding(name, markAsUndeleted(val));
    }

    public updateBinding(name: string, val: Value) {
        this.env.updateBinding(name, markAsUndeleted(val));
    }

    public getBinding(name: string): Value | undefined {
        const binding = this.env.getBinding(name);
        if (binding !== undefined) {
            return binding.deleted ? undefined : binding.value;
        } else {
            return undefined;
        }
    }

    public selfInEnvironment(): boolean {
        const binding = this.env.getBinding("self");
        return binding !== undefined ? !binding.deleted : false;
    }

    public executeInNewEnvironment<T>(
        code: () => T,
        initialBindings: { names: string[]; values: Value[] } = {
            names: [],
            values: [],
        },
    ): T {
        const wrappedValues = initialBindings.values.map(markAsUndeleted);
        return this.env.executeInNewEnvironment(code, {
            ...initialBindings,
            values: wrappedValues,
        });
    }

    public simulate<T>(
        _code: () => T,
        _startEnv: Environment<Value> = { values: new Map() },
    ): { env: Environment<Value>; val: T } {
        // Should not be used by the standard interpreter: the main problem is that _startEnv cannot receive as default the current env
        // this.env, because we should not remove the deleted flag in each entry of this.env.
        throwInternalCompilerError(
            "simulate method in WrapperStack should not be used by the standard Tact " +
                "interpreter because its behavior cannot be properly defined.",
        );
    }
}
