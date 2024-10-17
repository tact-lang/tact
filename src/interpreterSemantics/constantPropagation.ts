import { TactConstEvalError, throwInternalCompilerError } from "../errors";
import { AstId, AstMethodCall, AstNull, AstBoolean, AstNumber, AstString, AstOpUnary, AstOpBinary, AstStructInstance, AstFieldAccess, AstStaticCall, AstFunctionDef, AstStatementAugmentedAssign, AstStatementLet, AstStatement, AstStatementAssign, tryExtractPath, AstCondition, AstStatementExpression, AstStatementForEach, AstStatementRepeat, AstStatementReturn, AstStatementTry, AstStatementTryCatch, AstStatementUntil, AstStatementWhile, AstExpression, idText } from "../grammar/ast";
import { SrcInfo } from "../grammar/grammar";
import { extractCommonSubValue, Value } from "../types/types";
import { Environment, StandardSemantics } from "./standardSemantics";
import { throwNonFatalErrorConstEval } from "./util";

type BranchingMode = "standard" | "collecting";

export class ConstantPropagationAnalyzer extends StandardSemantics {

    protected mode: BranchingMode = "collecting";
    protected cancel_assignments = false;
    
    public interpretLetStatement(ast: AstStatementLet) {
        switch (this.mode) {
            case "standard": {
                super.interpretLetStatement(ast);
                break;
            }
            case "collecting": {
                // Need to try evaluation of expression. If this fails,
                // "undefined" is the final value

                const val = this.tryExpressionEvaluation(() => this.interpretExpression(ast.expression));
                this.storeNewBinding(ast.name, val);

                break;
            }
        }
        
    }

    public interpretAssignStatement(ast: AstStatementAssign) {
        const fullPath = tryExtractPath(ast.path);

        if (fullPath !== null && fullPath.length > 0) {
            switch (this.mode) {
                case "standard": {
                    super.interpretAssignStatement(ast);
                    break;
                }
                case "collecting": {
                    // Need to try evaluation of expression. If this fails,
                    // "undefined" is the final value

                    const val = this.tryExpressionEvaluation(() => this.interpretExpression(ast.expression));

                    // In case the cancel_assignments flag is active, treat the expression
                    // as failed, since the assigned variable will be treated as undetermined.
                    this.updateBinding(fullPath, this.cancel_assignments ? undefined : val, ast.loc);

                    break;
                }
            }
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
            const updateEvaluator = () =>
                this.interpretExpression(ast.expression);

            switch (this.mode) {
                case "standard": {
                    super.interpretAugmentedAssignStatement(ast);
                    break;
                }
                case "collecting": {
                    // Need to try evaluation of expressions. If at any point this fails,
                    // "undefined" is the final value

                    let currentPathValue: Value | undefined = undefined;

                    // In an assignment, the path is either a field access or an id
                    if (ast.path.kind === "field_access") {
                        currentPathValue = this.tryExpressionEvaluation(() => this.interpretFieldAccess(ast.path as AstFieldAccess));
                    } else if (ast.path.kind === "id") {
                        currentPathValue = this.tryExpressionEvaluation(() => this.lookupBinding(ast.path as AstId));
                    } else {
                        throwInternalCompilerError(
                            "assignments allow path expressions only",
                            ast.path.loc,
                        );
                    }
                    
                    if (currentPathValue !== undefined) {
                        const newVal = this.tryExpressionEvaluation(() =>
                            this.evalBinaryOpInAugmentedAssign(
                                ast,
                                currentPathValue,
                                updateEvaluator,
                            )
                        );

                        // In case the cancel_assignments flag is active, treat the expression
                        // as failed, since the assigned variable will be treated as undetermined.
                        this.updateBinding(fullPath, this.cancel_assignments ? undefined : newVal, ast.loc);
                    } else {
                        this.updateBinding(fullPath, undefined, ast.loc);
                    }

                    break;
                }
            }
        } else {
            throwInternalCompilerError(
                "assignments allow path expressions only",
                ast.path.loc,
            );
        }
    }

    public interpretConditionStatement(ast: AstCondition) {
        switch (this.mode) {
            case "standard": {
                super.interpretConditionStatement(ast);
                break;
            }
            case "collecting": {
                // Collect the true and false branches.
                const trueBranch = () => { this.executeStatements(ast.trueStatements); };
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
                    falseBranch = () => { };
                }
                
                // Attempt to evaluate the condition
                const conditionValue = this.tryExpressionEvaluation(
                    () => this.interpretExpression(ast.condition)
                );
                let condition: boolean | undefined = undefined;

                // If the condition produced a value, transform it to boolean.
                if (conditionValue !== undefined) {
                    condition = this.toBoolean(
                        conditionValue,
                        ast.condition.loc
                    );
                }

                this.processConditionBranches(trueBranch, falseBranch, condition);

                break;
            }
        }
    }

    public interpretExpressionStatement(ast: AstStatementExpression) {
        switch (this.mode) {
            case "standard":
                super.interpretExpressionStatement(ast);
                break;
            case "collecting":
                // Keep executing if a non-fatal error occurs.
                this.tryExpressionEvaluation(
                    () => this.interpretExpression(ast.expression)
                );
                break;
        }
    }

    public interpretForEachStatement(ast: AstStatementForEach) {
        switch (this.mode) {
            case "standard":
                super.interpretForEachStatement(ast);
                break;
            case "collecting": {
                // Attempt to evaluate the map expression.
                // Currently, the analyzer does not trace the
                // set method for maps. Therefore, it is not safe
                // to attempt to determine if the map expression is empty or not.
                this.tryExpressionEvaluation(
                    () => this.interpretExpression(ast.map)
                );

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
                    const loopEnv = this.envStack.simulate(loopBodyBranch, cancelledVarsEnv);
        
                    // Join the two environments: the "do nothing" branch is represented 
                    // by the current environment.
                    this.joinEnvironments([loopEnv, this.envStack.getCurrentEnvironment()]);

                break;
            }
        }
    }

    public interpretRepeatStatement(ast: AstStatementRepeat) {
        switch (this.mode) {
            case "standard": {
                super.interpretRepeatStatement(ast);
                break;
            }
            case "collecting": {
                // Attempt to evaluate the iterations
                const iterationsValue = this.tryExpressionEvaluation(
                    () => this.interpretExpression(ast.iterations)
                );

                let iterations: bigint | undefined = undefined;

                // If it produced a value, transform it to integer
                // and execute the loop body
                if (iterationsValue !== undefined) {
                    iterations = this.toRepeatInteger(
                        iterationsValue,
                        ast.iterations.loc
                    );
                }

                this.processRepeatBranches(ast.statements, iterations);

                break;
            }

        }
    }

    public interpretReturnStatement(ast: AstStatementReturn) {
        switch (this.mode) {
            case "standard": {
                super.interpretReturnStatement(ast);
                break;
            }
            case "collecting": {
                // Interpret the expression, but do nothing with it
                if (ast.expression !== null) {
                    this.tryExpressionEvaluation(() => this.interpretExpression(ast.expression!));
                }
                break;
            }
        }
    }

    public interpretTryStatement(ast: AstStatementTry) {
        switch (this.mode) {
            case "standard": {
                super.interpretTryStatement(ast);
                break;
            }
            case "collecting": {
                // Simulate the try branch
                const tryEnv = this.envStack.simulate(() =>
                    this.executeStatements(ast.statements)
                );    
                
                // Join the try branch and the "empty catch" branch.
                // The later is represented by the current environment
                this.joinEnvironments([tryEnv, this.envStack.getCurrentEnvironment()]);

                break;
            }
        }
    }

    public interpretTryCatchStatement(ast: AstStatementTryCatch) {
        switch (this.mode) {
            case "standard": {
                super.interpretTryCatchStatement(ast);
                break;
            }
            case "collecting": {
                // Simulate the try and catch branches
                const tryEnv = this.envStack.simulate(() =>
                    this.executeStatements(ast.statements)
                );    
                const catchEnv = this.envStack.simulate(() =>
                    this.executeStatements(ast.catchStatements)
                );

                // Join the try and catch branches
                this.joinEnvironments([tryEnv, catchEnv]);
                
                break;
            }
        }
    }

    public interpretUntilStatement(ast: AstStatementUntil): void {
        switch (this.mode) {
            case "standard": {
                super.interpretUntilStatement(ast);
                break;
            }
            case "collecting": {
                // The loop body always executes at least once
                this.executeStatements(ast.statements);

                // Attempt to evaluate the condition
                const conditionValue = this.tryExpressionEvaluation(
                    () => this.interpretExpression(ast.condition)
                );

                let condition: boolean | undefined = undefined;

                // If it produced a value, transform it to boolean
                if (conditionValue !== undefined) {
                    condition = this.toBoolean(
                        conditionValue,
                        ast.condition.loc
                    );
                }

                this.processUntilBranches(ast.statements, condition);

                break;
            }
        }
    }

    public interpretWhileStatement(ast: AstStatementWhile) {
        switch (this.mode) {
            case "standard": {
                super.interpretWhileStatement(ast);
                break;
            }
            case "collecting": {
                // Attempt to evaluate the condition
                const conditionValue = this.tryExpressionEvaluation(
                    () => this.interpretExpression(ast.condition)
                );

                let condition: boolean | undefined = undefined;

                // If it produced a value, transform it to boolean
                // and execute the loop body.
                if (conditionValue !== undefined) {
                    condition = this.toBoolean(
                        conditionValue,
                        ast.condition.loc
                    );
                }

                this.processWhileBranches(ast.statements, condition);

                break;
            }
        }
    }

    protected tryExpressionEvaluation(evaluator: () => Value): Value | undefined {
        try {
            return evaluator();
        } catch (e) {
            if (e instanceof TactConstEvalError) {
                if (!e.fatal) {
                    return undefined;
                }
            }
            throw e;
        }
    }

    protected processConditionBranches(trueBranch: () => void, falseBranch: () => void, condition?: boolean): void {
        // Simulate the true and false branches
        const trueEnv = this.envStack.simulate(trueBranch);
        const falseEnv = this.envStack.simulate(falseBranch);

        // If the condition is actually defined, take the corresponding environment.
        // If not, join the two environments with respect to the current environment.
        if (condition !== undefined) {
            if (condition) {
                this.updateCurrentEnvironment(trueEnv);
            } else {
                this.updateCurrentEnvironment(falseEnv);
            }
        } else {
            this.joinEnvironments([trueEnv, falseEnv]);
        }
    }

    protected processRepeatBranches(statements: AstStatement[], iterations?: bigint) {

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
                    this.updateCurrentEnvironment(finalEnv);
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
                    const finalEnv = this.envStack.simulate(repeatBodyBranch, cancelledVarsEnv);

                    this.updateCurrentEnvironment(finalEnv);
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
            const loopEnv = this.envStack.simulate(repeatBodyBranch, cancelledVarsEnv);

            // Join the two environments: the "do nothing" branch is represented 
            // by the current environment.
            this.joinEnvironments([loopEnv, this.envStack.getCurrentEnvironment()]);
        }
    }

    protected processUntilBranches(statements: AstStatement[], condition?: boolean) {

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
                    const finalEnv = this.envStack.simulate(loopBodyBranch, cancelledVarsEnv);

                    this.updateCurrentEnvironment(finalEnv);
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
            const loopEnv = this.envStack.simulate(loopBodyBranch, cancelledVarsEnv);

            // Join the two environments: the "do nothing" branch is represented 
            // by the current environment.
            this.joinEnvironments([loopEnv, this.envStack.getCurrentEnvironment()]);
        }
    }

    protected processWhileBranches(statements: AstStatement[], condition?: boolean) {

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
                    const finalEnv = this.envStack.simulate(loopBodyBranch, cancelledVarsEnv);

                    this.updateCurrentEnvironment(finalEnv);
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
            const loopEnv = this.envStack.simulate(loopBodyBranch, cancelledVarsEnv);

            // Join the two environments: the "do nothing" branch is represented 
            // by the current environment.
            this.joinEnvironments([loopEnv, this.envStack.getCurrentEnvironment()]);
        }
    }

    
    
    protected updateCurrentEnvironment(env: Environment<Value>) {
        // Intersect the keys in the values map of the current environment with those in the provided environment
        let keys = new Set(this.envStack.getCurrentEnvironment().values.keys());
        keys = keys.intersection(new Set(env.values.keys()));

        // Of the surviving keys, set the values as found in the provided environment
        const finalNames: Map<string,Value> = new Map();

        for (const key of keys) {
            finalNames.set(key, env.values.get(key)!);
        }

        // Update the current environment with the final values
        this.envStack.setCurrentEnvironment({...this.envStack.getCurrentEnvironment(), values: finalNames})
    }

    protected joinEnvironments(envs: Environment<Value>[]) {
        // Intersect the keys in the values map using the current environment as base
        let keys = new Set(this.envStack.getCurrentEnvironment().values.keys());
        for (const env of envs) {
            keys = keys.intersection(new Set(env.values.keys()));
        }

        // For those names that survived in keys, keep those that 
        // have the same value in all the provided environments
        const finalNames: Map<string,Value> = new Map();

        const pivotEnv = envs.pop();
        
        if (pivotEnv !== undefined) {
            
            // Fill the initial values as found in the pivot environment
            for (const key of keys) {
                finalNames.set(key, pivotEnv.values.get(key)!);
            }

            // Now, extract the common values with respect to each of the environments
            for (const key of keys) {
                for (const env of envs) {
                    const currentVal = finalNames.get(key);
                    if (currentVal !== undefined) {
                        const alternativeVal = env.values.get(key)!; // key is ensured to be in env because keys is the intersection of all envs.
                        const commonSubValue = extractCommonSubValue(currentVal, alternativeVal);
                        if (commonSubValue !== undefined) {
                            finalNames.set(key, commonSubValue);
                        } else {
                            finalNames.delete(key);
                        }
                    }
                }
            }

            // Update the current environment with the final values
            this.envStack.setCurrentEnvironment({...this.envStack.getCurrentEnvironment(), values: finalNames})
        }

    }
}