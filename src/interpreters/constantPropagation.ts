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
    AstStatementDestruct,
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

/*
This corresponds to the following lattice:

         any_value
      /      |      \
  val1     val2      val3 ........
     \       |       /
          no_value
*/
type LatticeValue =
    | {
          value: Value;
          kind: "value";
      }
    | {
          kind: "any_value"; // This is the top element
      }
    | {
          kind: "no_value"; // This is the bottom element
      };

function toLatticeValue(val: Value | undefined): LatticeValue {
    if (val !== undefined) {
        return { value: val, kind: "value" };
    } else {
        return anyValue;
    }
}

function eqLatticeValues(val1: LatticeValue, val2: LatticeValue): boolean {
    if (val1.kind === "value" && val2.kind === "value") {
        return eqValues(val1.value, val2.value);
    } else {
        return val1.kind === val2.kind;
    }
}

const anyValue: LatticeValue = { kind: "any_value" };

function joinLatticeValues(
    val1: LatticeValue,
    val2: LatticeValue,
): LatticeValue {
    if (val1.kind === "any_value" || val2.kind === "any_value") {
        return anyValue;
    } else if (val1.kind === "no_value") {
        return val2;
    } else if (val2.kind === "no_value") {
        return val1;
    } else {
        const commonSubValue = extractCommonSubValue(val1.value, val2.value);
        if (commonSubValue !== undefined) {
            return toLatticeValue(commonSubValue);
        } else {
            return anyValue;
        }
    }
}

function copyLatticeValue(val: LatticeValue): LatticeValue {
    if (val.kind !== "value") {
        return val;
    } else {
        return toLatticeValue(copyValue(val.value));
    }
}

// The following constants store all the ABI functions known by the analyzer.
// We need to keep them like this because ABI functions are not registered
// in the CompilerContext, and so, it is not possible to determine which
// ABI functions are mutation functions and which are not.
// So, we need to state that info explicitly.

const knownStructABIFunctions = ["toCell", "fromCell", "toSlice", "fromSlice"];
const knownStructABIMutationFunctions: string[] = [];
const knownMapABIFunctions = [
    "set",
    "get",
    "del",
    "asCell",
    "isEmpty",
    "exists",
    "deepEquals",
    "replace",
    "replaceGet",
];
const knownMapABIMutationFunctions = ["set", "del", "replace", "replaceGet"];

export class ConstantPropagationAnalyzer extends InterpreterInterface<LatticeValue> {
    protected interpreter: TactInterpreter;
    protected envStack: EnvironmentStack<LatticeValue>;
    protected context: CompilerContext;
    protected config: InterpreterConfig;

    constructor(
        context: CompilerContext = new CompilerContext(),
        config: InterpreterConfig = defaultInterpreterConfig,
    ) {
        super();
        this.context = context;
        this.config = config;
        this.envStack = new EnvironmentStack(copyLatticeValue);
        this.interpreter = new TactInterpreter(context, config);
    }

    public startAnalysis() {
        // Check that the ABI Functions known by the analyzer are still the ones in StructFunctions and MapFunctions
        if (
            StructFunctions.size !== knownStructABIFunctions.length ||
            knownStructABIFunctions.some((name) => !StructFunctions.has(name))
        ) {
            throwInternalCompilerError(
                "There are new Struct ABI functions unknown to the Constant Propagation Analyzer. Please add them to the Constant Propagation Analyzer.",
            );
        }

        if (
            MapFunctions.size !== knownMapABIFunctions.length ||
            knownMapABIFunctions.some((name) => !MapFunctions.has(name))
        ) {
            throwInternalCompilerError(
                "There are new Map ABI functions unknown to the Constant Propagation Analyzer. Please add them to the Constant Propagation Analyzer.",
            );
        }

        this.envStack = new EnvironmentStack(copyLatticeValue);

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

                this.envStack.setNewBinding("self", toLatticeValue(selfStruct));

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

                this.envStack.setNewBinding("self", toLatticeValue(selfStruct));

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
                        toLatticeValue(selfStruct),
                    );
                } else {
                    // reset the self variable
                    this.envStack.setNewBinding("self", anyValue);
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
        const argValues = ast.params.map((_) => anyValue);

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
        const argValues = ast.params.map((_) => anyValue);

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
                    { names: [argName], values: [anyValue] },
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

    public interpretName(ast: AstId): LatticeValue {
        return toLatticeValue(
            this.prepareForStandardInterpreter(() =>
                this.interpreter.interpretName(ast),
            ),
        );
    }

    public interpretMethodCall(ast: AstMethodCall): LatticeValue {
        // For the moment do not analyze. Just treat all mutation function calls as black boxes
        // that could assign to their self argument any value.

        // Also, evaluate all the arguments, just to check for errors.
        this.interpretExpression(ast.self);
        ast.args.forEach((expr) => this.interpretExpression(expr), this);

        // Now, undefine the path if assigned by a mutation function
        const path = tryExtractPath(ast.self);
        if (path !== null) {
            const src = getExpType(this.context, ast.self);

            if (src.kind === "ref") {
                const srcT = getType(this.context, src.name);
                if (srcT.kind === "struct") {
                    if (knownStructABIMutationFunctions.includes(idText(ast.method))) {
                        this.updateBinding(
                            path,
                            ast.self,
                            anyValue,
                            ast.self.loc,
                        );
                    }
                }

                const f = srcT.functions.get(idText(ast.method))?.isMutating;
                if (f) {
                    this.updateBinding(path, ast.self, anyValue, ast.self.loc);
                }
            }

            if (src.kind === "map") {
                if (knownMapABIMutationFunctions.includes(idText(ast.method))) {
                    this.updateBinding(path, ast.self, anyValue, ast.self.loc);
                }
            }
        }
        // If the ast.self is not a path expression, i.e., it has the form: a.b.f().g()...
        // then there is nothing to update in the environment because a.b.f().g() is not a full path to a variable.

        // Since we are not analyzing the function, just return that it could have produced any value.
        return anyValue;
    }

    public interpretInitOf(ast: AstInitOf): LatticeValue {
        // Currently not supported.

        // Just evaluate the arguments, but do nothing else
        ast.args.forEach((expr) => this.interpretExpression(expr), this);

        return anyValue;
    }

    public interpretNull(ast: AstNull): LatticeValue {
        return toLatticeValue(
            this.prepareForStandardInterpreter(() =>
                this.interpreter.interpretNull(ast),
            ),
        );
    }

    public interpretBoolean(ast: AstBoolean): LatticeValue {
        return toLatticeValue(
            this.prepareForStandardInterpreter(() =>
                this.interpreter.interpretBoolean(ast),
            ),
        );
    }

    public interpretNumber(ast: AstNumber): LatticeValue {
        return toLatticeValue(
            this.prepareForStandardInterpreter(() =>
                this.interpreter.interpretNumber(ast),
            ),
        );
    }

    public interpretString(ast: AstString): LatticeValue {
        return toLatticeValue(
            this.prepareForStandardInterpreter(() =>
                this.interpreter.interpretString(ast),
            ),
        );
    }

    public interpretUnaryOp(ast: AstOpUnary): LatticeValue {
        const operandEvaluator = () => {
            const result = this.interpretExpression(ast.operand);
            if (result.kind !== "value") {
                throw new UndefinedValueSignal();
            }
            return result.value;
        };

        return toLatticeValue(
            this.prepareForStandardInterpreter(() =>
                this.interpreter.evalUnaryOp(ast, operandEvaluator),
            ),
        );
    }

    public interpretBinaryOp(ast: AstOpBinary): LatticeValue {
        const leftValue = this.interpretExpression(ast.left);

        // Process the rest of the operators, they do not short-circuit

        if (leftValue.kind === "value") {
            const rightEvaluator = () => {
                const result = this.interpretExpression(ast.right);
                if (result.kind !== "value") {
                    throw new UndefinedValueSignal();
                }
                return result.value;
            };

            return toLatticeValue(
                this.prepareForStandardInterpreter(() =>
                    this.interpreter.evalBinaryOp(
                        ast,
                        leftValue.value,
                        rightEvaluator,
                    ),
                ),
            );
        } else {
            // Operators || and && must be processed differently, because they short-circuit.
            // Essentially, || and && produce two potential branches, because the left operand is undetermined.
            // One branch is the "do nothing" branch, and the other one is the processing of the right operand.
            if (ast.op === "||" || ast.op === "&&") {
                const rightEnv = this.envStack.simulate(() =>
                    this.interpretExpression(ast.right),
                ).env;

                // Join the environments
                this.envStack.setCurrentEnvironment(
                    joinEnvironments([
                        rightEnv,
                        this.envStack.getCurrentEnvironment(),
                    ]),
                );
            } else {
                // The rest of the operators do not short-circuit, so simply process the right operand
                this.interpretExpression(ast.right);
            }

            // Since the left operand is undetermined, the whole operation is undetermined
            return anyValue;
        }
    }

    public interpretConditional(ast: AstConditional): LatticeValue {
        // Attempt to evaluate the condition
        const condition = this.interpretExpression(ast.condition);

        // Simulate the true and false branches.
        // We always need to analyze both branches to capture FunC behavior, even if only
        // one branch is taken ultimately.
        const trueEnv = this.envStack.simulate(() =>
            this.interpretExpression(ast.thenBranch),
        );
        const falseEnv = this.envStack.simulate(() =>
            this.interpretExpression(ast.elseBranch),
        );

        // If the condition produced a value, take the corresponding environment.
        // If not, join the two environments.
        if (condition.kind === "value") {
            if (ensureBoolean(condition.value, ast.condition.loc)) {
                this.envStack.setCurrentEnvironment(trueEnv.env);
                return trueEnv.val;
            } else {
                this.envStack.setCurrentEnvironment(falseEnv.env);
                return falseEnv.val;
            }
        } else {
            this.envStack.setCurrentEnvironment(
                joinEnvironments([trueEnv.env, falseEnv.env]),
            );
            return joinLatticeValues(trueEnv.val, falseEnv.val);
        }
    }

    public interpretStructInstance(ast: AstStructInstance): LatticeValue {
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
            if (val.kind === "value") {
                resObj.set(idText(fieldWithInit.field), val.value);
            } else {
                // Delete it, just in case a default value was added
                resObj.delete(idText(fieldWithInit.field));
            }
            return resObj;
        }, resultWithDefaultFields);

        return toLatticeValue(Object.fromEntries(finalMap));
    }

    public interpretFieldAccess(ast: AstFieldAccess): LatticeValue {
        const val = this.interpretExpression(ast.aggregate);
        if (val.kind === "value") {
            // The typechecker already made all the checks,
            // so, val is ensured to be struct-like.
            const structValue = val.value as StructValue;
            return toLatticeValue(structValue[idText(ast.field)]);
        }
        return val;
    }

    public interpretStaticCall(ast: AstStaticCall): LatticeValue {
        // For the moment, do not analyze. I need to find a way to handle recursive calls,
        // it is tricky.

        // Just evaluate the arguments
        ast.args.forEach((expr) => this.interpretExpression(expr), this);
        return anyValue;
    }

    public interpretLetStatement(ast: AstStatementLet) {
        const val = this.analyzeTopLevelExpression(ast.expression);
        this.storeNewBinding(ast.name, val);
    }

    public interpretDestructStatement(ast: AstStatementDestruct): void {
        const val = this.analyzeTopLevelExpression(ast.expression);

        if (val.kind === "value") {
            // Typechecker ensures val is a struct-like object (contracts and traits treated as structs by analyzer).
            const valStruct = val.value as StructValue;

            for (const [field, name] of ast.identifiers.values()) {
                const val = valStruct[idText(field)];
                // No need to check for wildcard name "_" because the environment stack handles it

                this.storeNewBinding(name, toLatticeValue(val));
            }
        } else {
            // All the names in the destruct statement are undetermined
            for (const [_, name] of ast.identifiers.values()) {
                this.storeNewBinding(name, anyValue);
            }
        }
    }

    public interpretAssignStatement(ast: AstStatementAssign) {
        const fullPath = tryExtractPath(ast.path);

        if (fullPath !== null && fullPath.length > 0) {
            const val = this.analyzeTopLevelExpression(ast.expression);

            this.updateBinding(fullPath, ast.path, val, ast.loc);
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
            let currentPathValue: LatticeValue = anyValue;

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

            if (currentPathValue.kind === "value") {
                const updateExprEvaluator = () => {
                    const result = this.interpretExpression(ast.expression);
                    if (result.kind !== "value") {
                        throw new UndefinedValueSignal();
                    }
                    return result.value;
                };

                const newVal = this.prepareForStandardInterpreter(() =>
                    this.interpreter.evalBinaryOpInAugmentedAssign(
                        ast,
                        currentPathValue.value,
                        updateExprEvaluator,
                    ),
                );
                this.updateBinding(
                    fullPath,
                    ast.path,
                    toLatticeValue(newVal),
                    ast.loc,
                );
            } else {
                // As was the case with binary operators, the || and && short-circuit, so
                // we need to do branch analysis on them.
                if (ast.op === "||" || ast.op === "&&") {
                    const rightEnv = this.envStack.simulate(() =>
                        this.interpretExpression(ast.expression),
                    ).env;

                    // Join the environments
                    this.envStack.setCurrentEnvironment(
                        joinEnvironments([
                            rightEnv,
                            this.envStack.getCurrentEnvironment(),
                        ]),
                    );
                } else {
                    // The rest of the operators do not short-circuit, so simply process the expression
                    this.interpretExpression(ast.expression);
                }

                // Since originally the path was undetermined, the final result of the operator is undetermined
                this.updateBinding(fullPath, ast.path, anyValue, ast.loc);
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
        if (conditionValue.kind === "value") {
            condition = ensureBoolean(conditionValue.value, ast.condition.loc);
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

        // Simulate the loop body as if it executes once.
        // This is necessary to emulate the behavior of FunC
        this.envStack.simulateInNewEnvironment(loopBodyBranch);

        // Since it is not known if the map expression is empty or not,
        // it is time to compute the fix-point of the loop

        const finalEnv = this.computeLoopEnv(
            this.envStack.getCurrentEnvironment(),
            loopBodyBranch,
        );
        this.envStack.setCurrentEnvironment(finalEnv);
    }

    public interpretRepeatStatement(ast: AstStatementRepeat) {
        // Attempt to evaluate the iterations
        const iterationsValue = this.analyzeTopLevelExpression(ast.iterations);

        let iterations: bigint | undefined = undefined;

        // If it produced a value, transform it to integer
        // and execute the loop body
        if (iterationsValue.kind === "value") {
            iterations = ensureRepeatInt(
                iterationsValue.value,
                ast.iterations.loc,
            );
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
        const tryEnv = this.envStack.simulateInNewEnvironment(() => {
            this.executeStatements(ast.statements);
        });

        // Join the try branch and the "empty catch" branch.
        // The later is represented by the current environment
        this.envStack.setCurrentEnvironment(
            joinEnvironments([
                tryEnv.env,
                this.envStack.getCurrentEnvironment(),
            ]),
        );
    }

    public interpretTryCatchStatement(ast: AstStatementTryCatch) {
        // Simulate the try and catch branches
        const tryEnv = this.envStack.simulateInNewEnvironment(() => {
            this.executeStatements(ast.statements);
        });
        const catchEnv = this.envStack.simulateInNewEnvironment(() => {
            this.executeStatements(ast.catchStatements);
        });

        // Join the try and catch branches
        this.envStack.setCurrentEnvironment(
            joinEnvironments([tryEnv.env, catchEnv.env]),
        );
    }

    public interpretUntilStatement(ast: AstStatementUntil): void {
        // The loop body always executes at least once
        this.executeStatements(ast.statements);

        // Attempt to evaluate the condition
        const conditionValue = this.analyzeTopLevelExpression(ast.condition);

        let condition: boolean | undefined = undefined;

        // If it produced a value, transform it to boolean
        if (conditionValue.kind === "value") {
            condition = ensureBoolean(conditionValue.value, ast.condition.loc);
        }

        this.processUntilBranches(ast.statements, ast.condition, condition);
    }

    public interpretWhileStatement(ast: AstStatementWhile) {
        // Attempt to evaluate the condition
        const conditionValue = this.analyzeTopLevelExpression(ast.condition);

        let condition: boolean | undefined = undefined;

        // If it produced a value, transform it to boolean
        // and execute the loop body.
        if (conditionValue.kind === "value") {
            condition = ensureBoolean(conditionValue.value, ast.condition.loc);
        }

        this.processWhileBranches(ast.statements, ast.condition, condition);
    }

    private storeNewBinding(id: AstId, exprValue: LatticeValue) {
        // If exprValue is undefined, then the variable is undetermined.
        if (exprValue.kind === "value") {
            // Make a copy of exprValue, because everything is assigned by value
            this.envStack.setNewBinding(
                idText(id),
                toLatticeValue(copyValue(exprValue.value)),
            );
        } else {
            this.envStack.setNewBinding(idText(id), exprValue);
        }
    }

    private updateBinding(
        path: AstId[],
        pathExpr: AstExpression,
        exprValue: LatticeValue,
        src: SrcInfo,
    ) {
        if (exprValue.kind === "value") {
            // Typechecking ensures that there is at least one element in path
            if (path.length === 1) {
                // Make a copy of exprValue, because everything is assigned by value
                this.envStack.updateBinding(
                    idText(path[0]!),
                    toLatticeValue(copyValue(exprValue.value)),
                );
            } else {
                const baseVal = this.interpretName(path[0]!);
                let currentStruct: StructValue = {};
                const pathTypes = this.extractPathTypes(pathExpr);

                if (baseVal.kind === "value") {
                    // Typechecking ensures that path[0] is a struct-like object (contract/traits are treated as structs by the analyzer).
                    currentStruct = baseVal.value as StructValue;
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
                this.storeNewBinding(path[0]!, toLatticeValue(baseStruct));
                // And now proceed as in the standard interpreter
                this.prepareForStandardInterpreter(() => {
                    this.interpreter.updateBinding(path, exprValue.value, src);
                });
            }
        } else {
            // Because the value is undefined, the full path is undetermined

            if (path.length === 1) {
                this.envStack.updateBinding(idText(path[0]!), exprValue);
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

                if (baseVal.kind !== "value") {
                    return;
                }

                // Typechecking ensures that path[0] is a struct-like object (contract/traits are treated as structs by the analyzer).
                let currentStruct = baseVal.value as StructValue;
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
                        toLatticeValue(finalStruct),
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

    // Here, the partial evaluator is needed to detect some symbolic cases of
    // division by zero.
    private analyzeTopLevelExpression(expr: AstExpression): LatticeValue {
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
                    return toLatticeValue(extractValue(result as AstValue));
                } else {
                    return anyValue;
                }
            });
            this.envStack.setCurrentEnvironment(result.env);
            return result.val;
        } catch (e) {
            if (e instanceof TactConstEvalError) {
                if (!e.fatal) {
                    return this.interpretExpression(expr);
                }
            }
            throw e;
        }
    }

    private prepareForStandardInterpreter<T>(code: () => T): T | undefined {
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

    protected processConditionBranches(
        trueBranch: () => void,
        falseBranch: () => void,
        condition?: boolean,
    ): void {
        // Simulate the true and false branches
        // We need to analyze both branches to emulate FunC,
        // independently of the branch that ends up executing.
        const trueEnv = this.envStack.simulateInNewEnvironment(trueBranch);
        const falseEnv = this.envStack.simulateInNewEnvironment(falseBranch);

        // If the condition is actually defined, take the corresponding environment.
        // If not, join the two environments.
        if (condition !== undefined) {
            if (condition) {
                this.envStack.setCurrentEnvironment(trueEnv.env);
            } else {
                this.envStack.setCurrentEnvironment(falseEnv.env);
            }
        } else {
            this.envStack.setCurrentEnvironment(
                joinEnvironments([trueEnv.env, falseEnv.env]),
            );
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
        // This is necessary to emulate the behavior of FunC
        const oneIterEnv =
            this.envStack.simulateInNewEnvironment(repeatBodyBranch);

        if (iterations !== undefined) {
            if (iterations > 0) {
                if (iterations <= this.config.maxLoopIterations) {
                    // Actually execute the loop and set the resulting environment
                    const finalEnv = this.envStack.simulateInNewEnvironment(
                        () => {
                            for (let i = 1n; i <= iterations; i++) {
                                repeatBodyBranch();
                            }
                        },
                    );
                    this.envStack.setCurrentEnvironment(finalEnv.env);
                } else {
                    // Take the loop body branch, compute the fix-point starting from
                    // the environment that resulted from executing the loop once

                    const finalEnv = this.computeLoopEnv(
                        oneIterEnv.env,
                        repeatBodyBranch,
                    );
                    this.envStack.setCurrentEnvironment(finalEnv);
                }
            }
            // Take the "do nothing" branch. In other words, leave the environment as currently is
        } else {
            // Take both branches, compute the fix-point starting from
            // the current environment (i.e., the "do nothing" environment)
            const finalEnv = this.computeLoopEnv(
                this.envStack.getCurrentEnvironment(),
                repeatBodyBranch,
            );
            this.envStack.setCurrentEnvironment(finalEnv);
        }
    }

    protected processUntilBranches(
        statements: AstStatement[],
        conditionAst: AstExpression,
        condition?: boolean,
    ) {
        const loopBodyBranch = () => {
            this.executeStatements(statements);
            // After executing the body, we need to execute the condition again.
            this.interpretExpression(conditionAst);
        };

        if (condition !== undefined) {
            if (!condition) {
                // Take the loop body branch, compute the fix-point starting from a second iteration of the loop
                const twiceLoopEnv =
                    this.envStack.simulateInNewEnvironment(loopBodyBranch);
                const finalEnv = this.computeLoopEnv(
                    twiceLoopEnv.env,
                    loopBodyBranch,
                );
                this.envStack.setCurrentEnvironment(finalEnv);
            }
            // Take the "do nothing" branch. In other words, leave the environment as currently is
        } else {
            // Take both branches, compute the fix-point starting from
            // the current environment (i.e., the "do nothing" environment)
            const finalEnv = this.computeLoopEnv(
                this.envStack.getCurrentEnvironment(),
                loopBodyBranch,
            );
            this.envStack.setCurrentEnvironment(finalEnv);
        }
    }

    protected processWhileBranches(
        statements: AstStatement[],
        conditionAst: AstExpression,
        condition?: boolean,
    ) {
        const loopBodyBranch = () => {
            this.executeStatements(statements);
            // After executing the body, we need to execute the condition again.
            this.interpretExpression(conditionAst);
        };

        // Simulate the loop body as if it executes once
        // This is necessary to emulate the behavior of FunC analyzer
        const oneIterEnv =
            this.envStack.simulateInNewEnvironment(loopBodyBranch);

        if (condition !== undefined) {
            if (condition) {
                // Take the loop body branch, compute the fix-point starting from the environment
                // that resulted from executing the loop once

                const finalEnv = this.computeLoopEnv(
                    oneIterEnv.env,
                    loopBodyBranch,
                );
                this.envStack.setCurrentEnvironment(finalEnv);
            }
            // Take the "do nothing" branch. In other words, leave the environment as currently is
        } else {
            // Take both branches, compute the fix-point starting from
            // the current environment (i.e., the "do nothing" environment)
            const finalEnv = this.computeLoopEnv(
                this.envStack.getCurrentEnvironment(),
                loopBodyBranch,
            );
            this.envStack.setCurrentEnvironment(finalEnv);
        }
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

    /* Computes the fix-point starting from startEnv by executing the loopCode repeatedly until the
     * environment changes no more.
     */
    protected computeLoopEnv(
        startEnv: Environment<LatticeValue>,
        loopCode: () => void,
    ): Environment<LatticeValue> {
        const finalEnv = this.envStack.simulateInNewEnvironment(() => {
            let equalEnvs = false;
            while (!equalEnvs) {
                const prevEnv = this.envStack.getCurrentEnvironment();
                const loopEnv = this.envStack.simulate(loopCode).env;
                const newEnv = joinEnvironments([prevEnv, loopEnv]);
                this.envStack.setCurrentEnvironment(newEnv);
                equalEnvs = eqEnvironments(prevEnv, newEnv);
            }
        }, startEnv);
        return finalEnv.env;
    }
}

/**
 * Joins the target environments (including their ancestor environments).
 * The procedure assumes that the target environments have the same number of ancestor environments. This should be true if opening
 * environment nodes is only done through the method envStack.executeInNewEnvironment.
 */
function joinEnvironments(
    targets: Environment<LatticeValue>[],
): Environment<LatticeValue> {
    const pivotEnv = targets.pop();

    if (pivotEnv === undefined) {
        return { values: new Map() };
    }

    // Intersect the keys in the values map using the pivot as base
    let keys = new Set(pivotEnv.values.keys());
    for (const env of targets) {
        keys = keys.intersection(new Set(env.values.keys()));
    }

    // For those names that survived in keys, keep those that
    // have the same value in all the provided targets
    const finalNames: Map<string, LatticeValue> = new Map();

    // Fill the initial values as found in the pivot environment
    for (const key of keys) {
        finalNames.set(key, pivotEnv.values.get(key)!); // key is ensured to be in pivotEnv because keys is the intersection of all envs.
    }

    // Now, join the values of all the target environments, for each key.
    for (const key of keys) {
        // key is ensured to be in finalNames because finalNames was initialized with set "keys"
        let currentVal = finalNames.get(key)!;

        for (const env of targets) {
            const alternativeVal = env.values.get(key)!; // key is ensured to be in env because keys is the intersection of all envs.

            currentVal = joinLatticeValues(currentVal, alternativeVal);
        }

        finalNames.set(key, currentVal);
    }

    // Put the pivot environment back into the targets
    targets.push(pivotEnv);

    // Now, time to join the parent environments

    let joinedParents: Environment<LatticeValue> | undefined = undefined;

    const targetParents = targets
        .map((env) => env.parent)
        .filter((env) => env !== undefined);

    // Sanity check
    if (targetParents.length !== 0 && targetParents.length !== targets.length) {
        // This should not happen. This is a programmer's error
        throwInternalCompilerError(
            "Cannot join target environments because they have different ancestor lengths.",
        );
    }

    // Now join the parent environments
    if (targetParents.length > 0) {
        joinedParents = joinEnvironments(targetParents);
    }

    return { values: finalNames, parent: joinedParents };
}

function eqEnvironments(
    env1: Environment<LatticeValue>,
    env2: Environment<LatticeValue>,
): boolean {
    const map1 = env1.values;
    const map2 = env2.values;

    if (map1.size !== map2.size) {
        return false;
    }

    for (const [key, val1] of map1) {
        if (!map2.has(key)) {
            return false;
        }
        const val2 = map2.get(key)!;
        if (!eqLatticeValues(val1, val2)) {
            return false;
        }
    }

    // Up to here, the maps are equal, now check that the ancestor environments are also equal
    const parent1 = env1.parent;
    const parent2 = env2.parent;

    if (parent1 !== undefined && parent2 !== undefined) {
        return eqEnvironments(parent1, parent2);
    } else if (parent1 === undefined && parent2 === undefined) {
        return true;
    } else {
        return false;
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
    private env: EnvironmentStack<LatticeValue>;

    constructor(env: EnvironmentStack<LatticeValue>) {
        super(copyValue);
        this.env = env;
    }

    // Overwrite all the public methods and just pass the logic to the private environment
    public setNewBinding(name: string, val: Value) {
        this.env.setNewBinding(name, toLatticeValue(val));
    }

    public updateBinding(name: string, val: Value) {
        this.env.updateBinding(name, toLatticeValue(val));
    }

    public getBinding(name: string): Value | undefined {
        const binding = this.env.getBinding(name);
        if (binding !== undefined && binding.kind === "value") {
            return binding.value;
        } else {
            return undefined;
        }
    }

    public selfInEnvironment(): boolean {
        const binding = this.env.getBinding("self");
        return binding !== undefined ? binding.kind === "value" : false;
    }

    public executeInNewEnvironment<T>(
        code: () => T,
        initialBindings: { names: string[]; values: Value[] } = {
            names: [],
            values: [],
        },
    ): T {
        const wrappedValues = initialBindings.values.map(toLatticeValue);
        return this.env.executeInNewEnvironment(code, {
            ...initialBindings,
            values: wrappedValues,
        });
    }

    public simulate<T>(
        _code: () => T,
        _startEnv: Environment<Value> = { values: new Map() },
    ): { env: Environment<Value>; val: T } {
        throwInternalCompilerError(
            "simulate method is currently not supported in WrapperStack",
        );
    }

    public simulateInNewEnvironment<T>(
        _code: () => T,
        _startEnv: Environment<Value> = { values: new Map() },
    ): { env: Environment<Value>; val: T } {
        throwInternalCompilerError(
            "simulateInNewEnvironment method is currently not supported in WrapperStack",
        );
    }

    public setCurrentEnvironment(_env: Environment<Value>) {
        throwInternalCompilerError(
            "setCurrentEnvironment method is currently not supported in WrapperStack",
        );
    }

    public getCurrentEnvironment(): Environment<Value> {
        throwInternalCompilerError(
            "getCurrentEnvironment method is currently not supported in WrapperStack",
        );
    }
}
