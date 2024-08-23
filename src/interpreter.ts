import { evalConstantExpression } from "./constEval";
import { CompilerContext } from "./context";
import { TactConstEvalError, TactParseError, idTextErr } from "./errors";
import {
    AstBoolean,
    AstCondition,
    AstConditional,
    AstConstantDef,
    AstContract,
    AstExpression,
    AstFieldAccess,
    AstFunctionDef,
    AstId,
    AstInitOf,
    AstMessageDecl,
    AstMethodCall,
    AstModuleItem,
    AstNativeFunctionDecl,
    AstNull,
    AstNumber,
    AstOpBinary,
    AstOpUnary,
    AstPrimitiveTypeDecl,
    AstStatement,
    AstStatementAssign,
    AstStatementAugmentedAssign,
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
    AstString,
    AstStructDecl,
    AstStructInstance,
    AstTrait,
    idText,
} from "./grammar/ast";
import { parseExpression } from "./grammar/grammar";
import { InterpreterSemantics } from "./interpreterSemantics/types";
import { throwNonFatalErrorConstEval } from "./interpreterSemantics/util";
import { Value } from "./types/types";

type EvalResult =
    | { kind: "ok"; value: Value }
    | { kind: "error"; message: string };

export function parseAndEvalExpression(sourceCode: string): EvalResult {
    try {
        const ast = parseExpression(sourceCode);
        const constEvalResult = evalConstantExpression(
            ast,
            new CompilerContext(),
        );
        return { kind: "ok", value: constEvalResult };
    } catch (error) {
        if (
            error instanceof TactParseError ||
            error instanceof TactConstEvalError
        )
            return { kind: "error", message: error.message };
        throw error;
    }
}

/*
A parameterizable Tact interpreter. It receives a concrete semantics in the constructor. 
The concrete semantics attaches custom behaviors to the interpreter. 
For example, for instantiating an interpreter with the standard Tact semantics:

const interpreter = new Interpreter(new StandardSemantics(ctx));

Generic type T is the expressions' result type. Generic type S the statements' result type.
*/
export class Interpreter<T, S> {
    private semantics: InterpreterSemantics<T, S>;

    constructor(semantics: InterpreterSemantics<T, S>) {
        this.semantics = semantics;
    }

    private executeStatements(
        statements: AstStatement[],
        initial: S = this.semantics.emptyStatementResult(),
    ): S {
        return statements.reduce(
            (prev, currStmt) =>
                this.semantics.joinStatementResults(
                    prev,
                    this.interpretStatement(currStmt),
                ),
            initial,
        );
    }

    public interpretModuleItem(ast: AstModuleItem): void {
        switch (ast.kind) {
            case "constant_def":
                this.interpretConstantDef(ast);
                break;
            case "function_def":
                this.interpretFunctionDef(ast);
                break;
            case "struct_decl":
                this.interpretStructDecl(ast);
                break;
            case "message_decl":
                this.interpretMessageDecl(ast);
                break;
            case "native_function_decl":
                this.interpretFunctionDecl(ast);
                break;
            case "primitive_type_decl":
                this.interpretPrimitiveTypeDecl(ast);
                break;
            case "contract":
                this.interpretContract(ast);
                break;
            case "trait":
                this.interpretTrait(ast);
                break;
        }
    }

    public interpretConstantDef(ast: AstConstantDef) {
        throwNonFatalErrorConstEval(
            "Constant definitions are currently not supported.",
            ast.loc,
        );
    }

    public interpretFunctionDef(ast: AstFunctionDef) {
        throwNonFatalErrorConstEval(
            "Function definitions are currently not supported.",
            ast.loc,
        );
    }

    public interpretStructDecl(ast: AstStructDecl) {
        throwNonFatalErrorConstEval(
            "Struct declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretMessageDecl(ast: AstMessageDecl) {
        throwNonFatalErrorConstEval(
            "Message declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretPrimitiveTypeDecl(ast: AstPrimitiveTypeDecl) {
        throwNonFatalErrorConstEval(
            "Primitive type declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretFunctionDecl(ast: AstNativeFunctionDecl) {
        throwNonFatalErrorConstEval(
            "Native function declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretContract(ast: AstContract) {
        throwNonFatalErrorConstEval(
            "Contract declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretTrait(ast: AstTrait) {
        throwNonFatalErrorConstEval(
            "Trait declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretExpression(ast: AstExpression): T {
        switch (ast.kind) {
            case "id":
                return this.interpretName(ast);
            case "method_call":
                return this.interpretMethodCall(ast);
            case "init_of":
                return this.interpretInitOf(ast);
            case "null":
                return this.interpretNull(ast);
            case "boolean":
                return this.interpretBoolean(ast);
            case "number":
                return this.interpretNumber(ast);
            case "string":
                return this.interpretString(ast);
            case "op_unary":
                return this.interpretUnaryOp(ast);
            case "op_binary":
                return this.interpretBinaryOp(ast);
            case "conditional":
                return this.interpretConditional(ast);
            case "struct_instance":
                return this.interpretStructInstance(ast);
            case "field_access":
                return this.interpretFieldAccess(ast);
            case "static_call":
                return this.interpretStaticCall(ast);
        }
    }

    public interpretName(ast: AstId): T {
        return this.semantics.lookupBinding(ast);
    }

    public interpretMethodCall(ast: AstMethodCall): T {
        const selfValue = this.interpretExpression(ast.self);
        const argValues = ast.args.map(this.interpretExpression, this);

        const builtinResult = this.semantics.evalBuiltinOnSelf(
            ast,
            selfValue,
            argValues,
        );
        if (builtinResult !== undefined) {
            return builtinResult;
        }

        // We have a call to a user-defined function.

        throwNonFatalErrorConstEval(
            `calls of ${idTextErr(ast.method)} are not supported at this moment`,
            ast.loc,
        );
    }

    public interpretInitOf(ast: AstInitOf): T {
        throwNonFatalErrorConstEval(
            "initOf is not supported at this moment",
            ast.loc,
        );
    }

    public interpretNull(ast: AstNull): T {
        return this.semantics.evalNull(ast);
    }

    public interpretBoolean(ast: AstBoolean): T {
        return this.semantics.evalBoolean(ast);
    }

    public interpretNumber(ast: AstNumber): T {
        return this.semantics.evalInteger(ast);
    }

    public interpretString(ast: AstString): T {
        return this.semantics.evalString(ast);
    }

    public interpretUnaryOp(ast: AstOpUnary): T {
        // Instead of immediately evaluating the operand, we surround the
        // operand evaluation in a continuation, because some
        // unary operators need to perform some previous checks before
        // evaluating the operand.
        const operandEvaluator = () => this.interpretExpression(ast.operand);
        return this.semantics.evalUnaryOp(ast, operandEvaluator);
    }

    public interpretBinaryOp(ast: AstOpBinary): T {
        const leftValue = this.interpretExpression(ast.left);

        // As done with unary operators, we surround the evaluation
        // of the right argument in a continuation, just in case
        // the semantics need to do some special action before evaluating
        // the right argument, like short-circuiting, for example.
        const rightEvaluator = () => this.interpretExpression(ast.right);

        return this.semantics.evalBinaryOp(ast, leftValue, rightEvaluator);
    }

    public interpretConditional(ast: AstConditional): T {
        const conditionValue = this.semantics.toBoolean(
            this.interpretExpression(ast.condition),
            ast.condition.loc,
        );
        if (conditionValue) {
            return this.interpretExpression(ast.thenBranch);
        } else {
            return this.interpretExpression(ast.elseBranch);
        }
    }

    public interpretStructInstance(ast: AstStructInstance): T {
        // Make each of the field initializers a continuation
        const argEvaluators = ast.args.map(
            (fieldWithInit) => () =>
                this.interpretExpression(fieldWithInit.initializer),
            this,
        );

        return this.semantics.evalStructInstance(ast, argEvaluators);
    }

    public interpretFieldAccess(ast: AstFieldAccess): T {
        const aggregateEvaluator = () =>
            this.interpretExpression(ast.aggregate);

        return this.semantics.evalFieldAccess(ast, aggregateEvaluator);
    }

    public interpretStaticCall(ast: AstStaticCall): T {
        const argValues = ast.args.map(this.interpretExpression, this);

        const builtinResult = this.semantics.evalBuiltin(ast, argValues);
        if (builtinResult !== undefined) {
            return builtinResult;
        }

        // We have a call to a user-defined function.

        const functionDef = this.semantics.lookupFunction(ast);

        // Extract the parameter names
        const paramNames = functionDef.params.map((param) =>
            idText(param.name),
        );

        // Transform the statements into continuations
        const statementsEvaluator = () =>
            this.executeStatements(functionDef.statements);

        // Now call the function
        return this.semantics.evalStaticCall(
            ast,
            functionDef,
            statementsEvaluator,
            { names: paramNames, values: argValues },
        );
    }

    public interpretStatement(ast: AstStatement): S {
        switch (ast.kind) {
            case "statement_let":
                return this.interpretLetStatement(ast);
            case "statement_assign":
                return this.interpretAssignStatement(ast);
            case "statement_augmentedassign":
                return this.interpretAugmentedAssignStatement(ast);
            case "statement_condition":
                return this.interpretConditionStatement(ast);
            case "statement_expression":
                return this.interpretExpressionStatement(ast);
            case "statement_foreach":
                return this.interpretForEachStatement(ast);
            case "statement_repeat":
                return this.interpretRepeatStatement(ast);
            case "statement_return":
                return this.interpretReturnStatement(ast);
            case "statement_try":
                return this.interpretTryStatement(ast);
            case "statement_try_catch":
                return this.interpretTryCatchStatement(ast);
            case "statement_until":
                return this.interpretUntilStatement(ast);
            case "statement_while":
                return this.interpretWhileStatement(ast);
        }
    }

    public interpretLetStatement(ast: AstStatementLet): S {
        const val = this.interpretExpression(ast.expression);
        return this.semantics.storeNewBinding(ast, val);
    }

    public interpretAssignStatement(ast: AstStatementAssign): S {
        if (ast.path.kind === "id") {
            const val = this.interpretExpression(ast.expression);
            return this.semantics.updateBinding(ast.path, val);
        } else {
            throwNonFatalErrorConstEval(
                "only identifiers are currently supported as path expressions",
                ast.path.loc,
            );
        }
    }

    public interpretAugmentedAssignStatement(
        ast: AstStatementAugmentedAssign,
    ): S {
        if (ast.path.kind === "id") {
            const updateEvaluator = () =>
                this.interpretExpression(ast.expression);
            const currentPathValue = this.semantics.lookupBinding(ast.path);
            const newVal = this.semantics.evalBinaryOpInAugmentedAssign(
                ast,
                currentPathValue,
                updateEvaluator,
            );
            return this.semantics.updateBinding(ast.path, newVal);
        } else {
            throwNonFatalErrorConstEval(
                "only identifiers are currently supported as path expressions",
                ast.path.loc,
            );
        }
    }

    public interpretConditionStatement(ast: AstCondition): S {
        const condition = this.semantics.toBoolean(
            this.interpretExpression(ast.condition),
            ast.condition.loc,
        );
        if (condition) {
            return this.semantics.runInNewEnvironment(() =>
                this.executeStatements(ast.trueStatements),
            );
        } else if (ast.falseStatements !== null) {
            return this.semantics.runInNewEnvironment(() =>
                this.executeStatements(ast.falseStatements!),
            );
        } else {
            return this.semantics.emptyStatementResult();
        }
    }

    public interpretExpressionStatement(ast: AstStatementExpression): S {
        return this.semantics.toStatementResult(
            this.interpretExpression(ast.expression),
        );
    }

    public interpretForEachStatement(ast: AstStatementForEach): S {
        throwNonFatalErrorConstEval("foreach currently not supported", ast.loc);
    }

    public interpretRepeatStatement(ast: AstStatementRepeat): S {
        const iterations = this.semantics.toRepeatInteger(
            this.interpretExpression(ast.iterations),
            ast.iterations.loc,
        );
        if (iterations > 0) {
            // We can create a single environment for all the iterations in the loop
            // (instead of a fresh environment for each iteration)
            // because the typechecker ensures that variables do not leak outside
            // the loop. Also, the language requires that all declared variables inside the
            // loop be initialized, which means that we can overwrite its value in the environment
            // in each iteration.
            return this.semantics.runInNewEnvironment(() => {
                let result = this.semantics.emptyStatementResult();

                for (let i = 1n; i <= iterations; i++) {
                    result = this.semantics.runOneIteration(i, ast.loc, () =>
                        this.executeStatements(ast.statements, result),
                    );
                }

                return result;
            });
        } else {
            return this.semantics.emptyStatementResult();
        }
    }

    public interpretReturnStatement(ast: AstStatementReturn): S {
        if (ast.expression !== null) {
            const val = this.interpretExpression(ast.expression);
            return this.semantics.evalReturn(val);
        } else {
            return this.semantics.evalReturn();
        }
    }

    public interpretTryStatement(ast: AstStatementTry): S {
        throwNonFatalErrorConstEval(
            "try statements currently not supported",
            ast.loc,
        );
    }

    public interpretTryCatchStatement(ast: AstStatementTryCatch): S {
        throwNonFatalErrorConstEval(
            "try-catch statements currently not supported",
            ast.loc,
        );
    }

    public interpretUntilStatement(ast: AstStatementUntil): S {
        let condition: boolean;
        let iterCount = 1n;
        // We can create a single environment for all the iterations in the loop
        // (instead of a fresh environment for each iteration)
        // because the typechecker ensures that variables do not leak outside
        // the loop. Also, the language requires that all declared variables inside the
        // loop be initialized, which means that we can overwrite its value in the environment
        // in each iteration.
        return this.semantics.runInNewEnvironment(() => {
            let result = this.semantics.emptyStatementResult();
            do {
                result = this.semantics.runOneIteration(
                    iterCount,
                    ast.loc,
                    () => {
                        const r = this.executeStatements(
                            ast.statements,
                            result,
                        );

                        // The typechecker ensures that the condition does not refer to
                        // variables declared inside the loop.
                        condition = this.semantics.toBoolean(
                            this.interpretExpression(ast.condition),
                            ast.condition.loc,
                        );

                        return r;
                    },
                );

                iterCount++;
            } while (!condition);

            return result;
        });
    }

    public interpretWhileStatement(ast: AstStatementWhile): S {
        let condition = this.semantics.toBoolean(
            this.interpretExpression(ast.condition),
            ast.condition.loc,
        );

        let iterCount = 1n;
        // We can create a single environment for all the iterations in the loop
        // (instead of a fresh environment for each iteration)
        // because the typechecker ensures that variables do not leak outside
        // the loop. Also, the language requires that all declared variables inside the
        // loop be initialized, which means that we can overwrite its value in the environment
        // in each iteration.
        return this.semantics.runInNewEnvironment(() => {
            let result = this.semantics.emptyStatementResult();
            while (condition) {
                result = this.semantics.runOneIteration(
                    iterCount,
                    ast.loc,
                    () => {
                        const r = this.executeStatements(
                            ast.statements,
                            result,
                        );

                        // The typechecker ensures that the condition does not refer to
                        // variables declared inside the loop.
                        condition = this.semantics.toBoolean(
                            this.interpretExpression(ast.condition),
                            ast.condition.loc,
                        );

                        return r;
                    },
                );

                iterCount++;
            }

            return result;
        });
    }
}
