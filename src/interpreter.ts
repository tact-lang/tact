import { evalConstantExpression } from "./constEval";
import { CompilerContext } from "./context";
import {
    TactConstEvalError,
    TactParseError,
    idTextErr,
    throwInternalCompilerError,
} from "./errors";
import {
    AstAsmFunctionDef,
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
    AstString,
    AstStructDecl,
    AstStructInstance,
    AstTrait,
    idText,
    tryExtractPath,
} from "./grammar/ast";
import { parseExpression, SrcInfo } from "./grammar/grammar";
import { throwNonFatalErrorConstEval } from "./interpreters/util";
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

export abstract class InterpreterInterface<T> {
    public interpretModuleItem(ast: AstModuleItem) {
        switch (ast.kind) {
            case "constant_def":
                this.interpretConstantDef(ast);
                break;
            case "function_def":
                this.interpretFunctionDef(ast);
                break;
            case "asm_function_def":
                this.interpretAsmFunctionDef(ast);
                break;
            case "struct_decl":
                this.interpretStructDecl(ast);
                break;
            case "message_decl":
                this.interpretMessageDecl(ast);
                break;
            case "native_function_decl":
                this.interpretNativeFunctionDecl(ast);
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

    public abstract interpretConstantDef(ast: AstConstantDef): void;

    public abstract interpretFunctionDef(ast: AstFunctionDef): void;

    public abstract interpretAsmFunctionDef(ast: AstAsmFunctionDef): void;

    public abstract interpretStructDecl(ast: AstStructDecl): void;

    public abstract interpretMessageDecl(ast: AstMessageDecl): void;

    public abstract interpretPrimitiveTypeDecl(ast: AstPrimitiveTypeDecl): void;

    public abstract interpretNativeFunctionDecl(
        ast: AstNativeFunctionDecl,
    ): void;

    public abstract interpretContract(ast: AstContract): void;

    public abstract interpretTrait(ast: AstTrait): void;

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

    public abstract interpretName(ast: AstId): T;

    public abstract interpretMethodCall(ast: AstMethodCall): T;

    public abstract interpretInitOf(ast: AstInitOf): T;

    public abstract interpretNull(ast: AstNull): T;

    public abstract interpretBoolean(ast: AstBoolean): T;

    public abstract interpretNumber(ast: AstNumber): T;

    public abstract interpretString(ast: AstString): T;

    public abstract interpretUnaryOp(ast: AstOpUnary): T;

    public abstract interpretBinaryOp(ast: AstOpBinary): T;

    public abstract interpretConditional(ast: AstConditional): T;

    public abstract interpretStructInstance(ast: AstStructInstance): T;

    public abstract interpretFieldAccess(ast: AstFieldAccess): T;

    public abstract interpretStaticCall(ast: AstStaticCall): T;

    public interpretStatement(ast: AstStatement) {
        switch (ast.kind) {
            case "statement_let":
                this.interpretLetStatement(ast);
                break;
            case "statement_destruct":
                this.interpretDestructStatement(ast);
                break;
            case "statement_assign":
                this.interpretAssignStatement(ast);
                break;
            case "statement_augmentedassign":
                this.interpretAugmentedAssignStatement(ast);
                break;
            case "statement_condition":
                this.interpretConditionStatement(ast);
                break;
            case "statement_expression":
                this.interpretExpressionStatement(ast);
                break;
            case "statement_foreach":
                this.interpretForEachStatement(ast);
                break;
            case "statement_repeat":
                this.interpretRepeatStatement(ast);
                break;
            case "statement_return":
                this.interpretReturnStatement(ast);
                break;
            case "statement_try":
                this.interpretTryStatement(ast);
                break;
            case "statement_try_catch":
                this.interpretTryCatchStatement(ast);
                break;
            case "statement_until":
                this.interpretUntilStatement(ast);
                break;
            case "statement_while":
                this.interpretWhileStatement(ast);
                break;
        }
    }

    public abstract interpretLetStatement(ast: AstStatementLet): void;

    public abstract interpretAssignStatement(ast: AstStatementAssign): void;

    public abstract interpretAugmentedAssignStatement(
        ast: AstStatementAugmentedAssign,
    ): void;

    public abstract interpretConditionStatement(ast: AstCondition): void;

    public abstract interpretExpressionStatement(
        ast: AstStatementExpression,
    ): void;

    public abstract interpretForEachStatement(ast: AstStatementForEach): void;

    public abstract interpretRepeatStatement(ast: AstStatementRepeat): void;

    public abstract interpretReturnStatement(ast: AstStatementReturn): void;

    public abstract interpretTryStatement(ast: AstStatementTry): void;

    public abstract interpretTryCatchStatement(ast: AstStatementTryCatch): void;

    public abstract interpretUntilStatement(ast: AstStatementUntil): void;

    public abstract interpretWhileStatement(ast: AstStatementWhile): void;

    protected executeStatements(statements: AstStatement[]) {
        statements.forEach((currStmt) => {
            this.interpretStatement(currStmt);
        }, this);
    }
}

/*
A parameterizable Tact interpreter. It receives a concrete semantics in the constructor. 
The concrete semantics attaches custom behaviors to the interpreter. 
For example, for instantiating an interpreter with the standard Tact semantics:

const interpreter = new Interpreter(new StandardSemantics(ctx));

Generic type T is the expressions' result type.
*/
export abstract class AbstractInterpreter<T> extends InterpreterInterface<T> {
    protected copyValue: (val: T) => T;

    constructor(copyValueMethod: (val: T) => T) {
        super();
        this.copyValue = copyValueMethod;
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

    public interpretAsmFunctionDef(ast: AstAsmFunctionDef) {
        throwNonFatalErrorConstEval(
            "Asm functions are currently not supported.",
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

    public interpretNativeFunctionDecl(ast: AstNativeFunctionDecl) {
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

    public interpretName(ast: AstId): T {
        return this.lookupBinding(ast);
    }

    public interpretMethodCall(ast: AstMethodCall): T {
        const selfValue = this.interpretExpression(ast.self);

        const argValues = ast.args.map(
            (expr) => this.copyValue(this.interpretExpression(expr)),
            this,
        );

        const builtinResult = this.evalBuiltinOnSelf(ast, selfValue, argValues);
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

    public interpretUnaryOp(ast: AstOpUnary): T {
        // Instead of immediately evaluating the operand, we surround the
        // operand evaluation in a continuation, because some
        // unary operators need to perform some previous checks before
        // evaluating the operand.
        const operandEvaluator = () => this.interpretExpression(ast.operand);
        return this.evalUnaryOp(ast, operandEvaluator);
    }

    public interpretBinaryOp(ast: AstOpBinary): T {
        const leftValue = this.interpretExpression(ast.left);

        // As done with unary operators, we surround the evaluation
        // of the right argument in a continuation, just in case
        // the semantics need to do some special action before evaluating
        // the right argument, like short-circuiting, for example.
        const rightEvaluator = () => this.interpretExpression(ast.right);

        return this.evalBinaryOp(ast, leftValue, rightEvaluator);
    }

    public interpretConditional(ast: AstConditional): T {
        const conditionValue = this.toBoolean(
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

        return this.evalStructInstance(ast, argEvaluators);
    }

    public interpretFieldAccess(ast: AstFieldAccess): T {
        const aggregateEvaluator = () =>
            this.interpretExpression(ast.aggregate);

        return this.evalFieldAccess(ast, aggregateEvaluator);
    }

    public interpretStaticCall(ast: AstStaticCall): T {
        const argValues = ast.args.map(
            (expr) => this.copyValue(this.interpretExpression(expr)),
            this,
        );

        const builtinResult = this.evalBuiltin(ast, argValues);
        if (builtinResult !== undefined) {
            return builtinResult;
        }

        // We have a call to a user-defined function.

        const functionDef = this.lookupFunction(ast);

        // Extract the parameter names
        const paramNames = functionDef.params.map((param) =>
            idText(param.name),
        );

        // Transform the statements into continuations
        const statementsEvaluator = () => {
            this.executeStatements(functionDef.statements);
        };

        // Now call the function
        return this.evalStaticCall(ast, functionDef, statementsEvaluator, {
            names: paramNames,
            values: argValues,
        });
    }

    public interpretLetStatement(ast: AstStatementLet) {
        const val = this.interpretExpression(ast.expression);
        this.storeNewBinding(ast.name, val);
    }

    public interpretDestructStatement(ast: AstStatementDestruct) {
        for (const [_, name] of ast.identifiers.values()) {
            if (hasStaticConstant(this.context, idText(name))) {
                // Attempt of shadowing a constant in a destructuring declaration
                throwInternalCompilerError(
                    `declaration of ${idText(name)} shadows a constant with the same name`,
                    ast.loc,
                );
            }
        }
        const val = this.interpretExpression(ast.expression);
        if (
            val === null ||
            typeof val !== "object" ||
            !("$tactStruct" in val)
        ) {
            throwErrorConstEval(
                `destructuring assignment expected a struct, but got ${showValue(
                    val,
                )}`,
                ast.expression.loc,
            );
        }
        if (ast.identifiers.size !== Object.keys(val).length - 1) {
            throwErrorConstEval(
                `destructuring assignment expected ${Object.keys(val).length - 1} fields, but got ${
                    ast.identifiers.size
                }`,
                ast.loc,
            );
        }

        for (const [field, name] of ast.identifiers.values()) {
            if (name.text === "_") {
                continue;
            }
            const v = val[idText(field)];
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
            if (v === undefined) {
                throwErrorConstEval(
                    `destructuring assignment expected field ${idTextErr(
                        field,
                    )}`,
                    ast.loc,
                );
            }
            this.envStack.setNewBinding(idText(name), v);
        }
    }

    public interpretAssignStatement(ast: AstStatementAssign) {
        const fullPath = tryExtractPath(ast.path);

        if (fullPath !== null && fullPath.length > 0) {
            const val = this.interpretExpression(ast.expression);
            this.updateBinding(fullPath, val, ast.loc);
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

            let currentPathValue: T;

            // In an assignment, the path is either a field access or an id
            if (ast.path.kind === "field_access") {
                currentPathValue = this.interpretFieldAccess(ast.path);
            } else if (ast.path.kind === "id") {
                currentPathValue = this.lookupBinding(ast.path);
            } else {
                throwInternalCompilerError(
                    "assignments allow path expressions only",
                    ast.path.loc,
                );
            }

            const newVal = this.evalBinaryOpInAugmentedAssign(
                ast,
                currentPathValue,
                updateEvaluator,
            );
            this.updateBinding(fullPath, newVal, ast.loc);
        } else {
            throwInternalCompilerError(
                "assignments allow path expressions only",
                ast.path.loc,
            );
        }
    }

    public interpretConditionStatement(ast: AstCondition) {
        const condition = this.toBoolean(
            this.interpretExpression(ast.condition),
            ast.condition.loc,
        );

        if (condition) {
            this.runInNewEnvironment(() => {
                this.executeStatements(ast.trueStatements);
            });
        } else if (ast.falseStatements !== null) {
            // We are in an else branch. The typechecker ensures that
            // the elseif branch does not exist.
            this.runInNewEnvironment(() => {
                this.executeStatements(ast.falseStatements!);
            });
        } else if (ast.elseif !== null) {
            // We are in an elseif branch
            this.interpretConditionStatement(ast.elseif);
        }
    }

    public interpretExpressionStatement(ast: AstStatementExpression) {
        this.interpretExpression(ast.expression);
    }

    public interpretForEachStatement(ast: AstStatementForEach) {
        throwNonFatalErrorConstEval("foreach currently not supported", ast.loc);
    }

    public interpretRepeatStatement(ast: AstStatementRepeat) {
        const iterations = this.toRepeatInteger(
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
            this.runInNewEnvironment(() => {
                for (let i = 1n; i <= iterations; i++) {
                    this.runOneIteration(i, ast.loc, () => {
                        this.executeStatements(ast.statements);
                    });
                }
            });
        }
    }

    public interpretReturnStatement(ast: AstStatementReturn) {
        if (ast.expression !== null) {
            const val = this.interpretExpression(ast.expression);
            this.evalReturn(val);
        } else {
            this.evalReturn();
        }
    }

    public interpretTryStatement(ast: AstStatementTry) {
        throwNonFatalErrorConstEval(
            "try statements currently not supported",
            ast.loc,
        );
    }

    public interpretTryCatchStatement(ast: AstStatementTryCatch) {
        throwNonFatalErrorConstEval(
            "try-catch statements currently not supported",
            ast.loc,
        );
    }

    public interpretUntilStatement(ast: AstStatementUntil): void {
        let condition: boolean;
        let iterCount = 1n;
        // We can create a single environment for all the iterations in the loop
        // (instead of a fresh environment for each iteration)
        // because the typechecker ensures that variables do not leak outside
        // the loop. Also, the language requires that all declared variables inside the
        // loop be initialized, which means that we can overwrite its value in the environment
        // in each iteration.
        this.runInNewEnvironment(() => {
            do {
                this.runOneIteration(iterCount, ast.loc, () => {
                    this.executeStatements(ast.statements);

                    // The typechecker ensures that the condition does not refer to
                    // variables declared inside the loop.
                    condition = this.toBoolean(
                        this.interpretExpression(ast.condition),
                        ast.condition.loc,
                    );
                });

                iterCount++;
            } while (!condition);
        });
    }

    public interpretWhileStatement(ast: AstStatementWhile) {
        let condition = this.toBoolean(
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
        this.runInNewEnvironment(() => {
            while (condition) {
                this.runOneIteration(iterCount, ast.loc, () => {
                    this.executeStatements(ast.statements);

                    // The typechecker ensures that the condition does not refer to
                    // variables declared inside the loop.
                    condition = this.toBoolean(
                        this.interpretExpression(ast.condition),
                        ast.condition.loc,
                    );
                });

                iterCount++;
            }
        });
    }

    /********  ABSTRACT METHODS  ****/

    /*
    Executes calls to built-in functions of the form self.method(args).
    Should return "undefined" if method is not a built-in function. 
    */
    public abstract evalBuiltinOnSelf(
        ast: AstMethodCall,
        self: T,
        argValues: T[],
    ): T | undefined;

    /*
    Evaluates the unary operation. Parameter operandEvaluator is a continuation 
    that computes the operator's operand. The reason for using a continuation
    is that certain operators may execute some logic **before** evaluation 
    of the operand.
    */
    public abstract evalUnaryOp(ast: AstOpUnary, operandEvaluator: () => T): T;

    /*
    Evaluates the binary operator. Parameter rightEvaluator is a continuation
    that computes the value of the right operand. The reason for using a continuation
    is that certain operators may execute some logic **before** evaluation 
    of the right operand (for example, short-circuiting).
    */
    public abstract evalBinaryOp(
        ast: AstOpBinary,
        leftValue: T,
        rightEvaluator: () => T,
    ): T;

    public abstract toBoolean(value: T, src: SrcInfo): boolean;

    /*
    Evaluates the struct instance. Parameter initializerEvaluators is a list of continuations.
    Each continuation computes the result of executing the initializer.
    */
    public abstract evalStructInstance(
        ast: AstStructInstance,
        initializerEvaluators: (() => T)[],
    ): T;

    /*
    Evaluates a field access of the form "path.field". Parameter aggregateEvaluator is a continuation.
    The continuation computes the value of "path".
    */
    public abstract evalFieldAccess(
        ast: AstFieldAccess,
        aggregateEvaluator: () => T,
    ): T;

    /*
    Executes calls to built-in functions of the form method(args).
    Should return "undefined" if method is not a built-in function. 
    */
    public abstract evalBuiltin(
        ast: AstStaticCall,
        argValues: T[],
    ): T | undefined;

    public abstract lookupFunction(ast: AstStaticCall): AstFunctionDef;

    /*
    Calls function "functionDef" using parameters "args". The body of "functionDef" can be
    executed by invoking continuation "functionBodyEvaluator". 
    */
    public abstract evalStaticCall(
        ast: AstStaticCall,
        functionDef: AstFunctionDef,
        functionBodyEvaluator: () => void,
        args: { names: string[]; values: T[] },
    ): T;

    /*
    Evaluates the binary operator implicit in an augment assignment. 
    Parameter rightEvaluator is a continuation
    that computes the value of the right operand. The reason for using a continuation
    is that certain operators may execute some logic **before** evaluation 
    of the right operand (for example, short-circuiting).
    */
    public abstract evalBinaryOpInAugmentedAssign(
        ast: AstStatementAugmentedAssign,
        leftValue: T,
        rightEvaluator: () => T,
    ): T;

    public abstract lookupBinding(path: AstId): T;

    public abstract storeNewBinding(id: AstId, exprValue: T): void;

    public abstract updateBinding(
        path: AstId[],
        exprValue: T,
        src: SrcInfo,
    ): void;

    /*
    Runs the continuation statementsEvaluator in a new environment.
    In the standard semantics, this means opening a new environment in 
    the stack and closing the environment when statementsEvaluator finishes execution.
    */
    public abstract runInNewEnvironment(statementsEvaluator: () => void): void;

    public abstract toInteger(value: T, src: SrcInfo): bigint;

    public abstract toRepeatInteger(value: T, src: SrcInfo): bigint;

    /*
    Runs one iteration of the body of a loop. The body of the loop is executed by 
    calling the continuation "iterationEvaluator". The iteration number is provided 
    for further custom logic.
    */
    public abstract runOneIteration(
        iterationNumber: bigint,
        src: SrcInfo,
        iterationEvaluator: () => void,
    ): void;

    public abstract evalReturn(val?: T): void;
}
