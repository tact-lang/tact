import { Address, beginCell, BitString, Cell, toNano } from "@ton/core";
import { paddedBufferToBits } from "@ton/core/dist/boc/utils/paddedBits";
import * as crc32 from "crc-32";
import { CompilerContext } from "../context";
import { idTextErr, throwInternalCompilerError } from "../errors";
import {
    AstAsmFunctionDef,
    AstBinaryOperation,
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
    AstNativeFunctionDecl,
    AstNull,
    AstNumber,
    AstOpBinary,
    AstOpUnary,
    AstPrimitiveTypeDecl,
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
    AstUnaryOperation,
    eqNames,
    idText,
    isSelfId,
    SrcInfo,
    tryExtractPath,
} from "../grammar/ast";
import {
    getStaticConstant,
    getStaticFunction,
    getType,
    hasStaticConstant,
    hasStaticFunction,
} from "../types/resolveDescriptors";
import { getExpType } from "../types/resolveExpression";
import {
    CommentValue,
    copyValue,
    showValue,
    StructValue,
    Value,
} from "../types/types";
import { sha256_sync } from "@ton/crypto";
import { enabledMasterchain } from "../config/features";
import { dummySrcInfo } from "../grammar/grammar";
import {
    divFloor,
    modFloor,
    throwErrorConstEval,
    throwNonFatalErrorConstEval,
} from "./util";
import { InterpreterInterface } from "../interpreter";

// TVM integers are signed 257-bit integers
const minTvmInt: bigint = -(2n ** 256n);
const maxTvmInt: bigint = 2n ** 256n - 1n;

// Range allowed in repeat statements
const minRepeatStatement: bigint = -(2n ** 256n); // Note it is the same as minimum for TVM
const maxRepeatStatement: bigint = 2n ** 31n - 1n;

class ReturnSignal extends Error {
    private value?: Value;

    constructor(value?: Value) {
        super();
        this.value = value;
    }

    public getValue(): Value | undefined {
        return this.value;
    }
}

export type InterpreterConfig = {
    // Options that tune the interpreter's behavior.

    // Maximum number of iterations inside a loop before a time out is issued.
    // If a loop takes more than such number of iterations, the interpreter will fail evaluation.
    // This option applies to: do...until, while and repeat loops.
    maxLoopIterations: bigint;

    // Whenever a field or id does not exist, throw a fatal error if true;
    // throw non fatal error otherwise.
    missingFieldsAndIdsAreAlwaysFatal: boolean;
};

const WILDCARD_NAME: string = "_";

/* An Environment consists of a map of variable names to their values 
(which have the generic type V), and a reference to the (optional) parent 
environment. In other words, an Environment acts as a node in the linked list
representing the environments stack.

The elements in the map are called "bindings".
*/
export type Environment<V> = {
    values: Map<string, V>;
    parent?: Environment<V>;
};

/*
An environment stack is a linked list of Environment nodes. 

The type of the values stored in the environments is represented by the 
generic type V.
*/
export class EnvironmentStack<V> {
    private currentEnv: Environment<V>;
    private copyValue: (val: V) => V;

    constructor(copyValueMethod: (val: V) => V) {
        this.currentEnv = { values: new Map() };
        this.copyValue = copyValueMethod;
    }

    private copyEnvironment(env: Environment<V>): Environment<V> {
        const newMap: Map<string, V> = new Map();

        for (const [name, val] of env.values) {
            newMap.set(name, this.copyValue(val));
        }

        let newParent: Environment<V> | undefined = undefined;

        if (env.parent !== undefined) {
            newParent = this.copyEnvironment(env.parent);
        }

        return { values: newMap, parent: newParent };
    }

    private findBindingMap(name: string): Map<string, V> | undefined {
        let env: Environment<V> | undefined = this.currentEnv;
        while (env !== undefined) {
            if (env.values.has(name)) {
                return env.values;
            } else {
                env = env.parent;
            }
        }
        return undefined;
    }

    /*
    Sets a binding for "name" in the **current** environment of the stack.
    If a binding for "name" already exists in the current environment, it 
    overwrites the binding with the provided value.
    As a special case, name "_" is ignored.

    Note that this method does not check if binding "name" already exists in 
    a parent environment.
    This means that if binding "name" already exists in a parent environment, 
    it will be shadowed by the provided value in the current environment.
    This shadowing behavior is useful for modelling recursive function calls.
    For example, consider the recursive implementation of factorial 
    (for simplification purposes, it returns 1 for the factorial of 
    negative numbers):

    1  fun factorial(a: Int): Int {
    2  if (a <= 1) {
    3     return 1;
    4  } else {
    5     return a * factorial(a - 1);
    6  }

    Just before factorial(4) finishes its execution, the environment stack will
    look as follows (the arrows point to their parent environment):

    a = 4 <------- a = 3 <-------- a = 2 <------- a = 1

    Note how each child environment shadows variable a, because each
    recursive call to factorial at line 5 creates a child
    environment with a new binding for a.

    When factorial(1) = 1 finishes execution, the environment at the top
    of the stack is popped:
    
    a = 4 <------- a = 3 <-------- a = 2

    and execution resumes at line 5 in the environment where a = 2,
    so that the return at line 5 is 2 * 1 = 2.

    This in turn causes the stack to pop the environment at the top:

    a = 4 <------- a = 3

    so that the return at line 5 (now in the environment a = 3) will 
    produce 3 * 2 = 6, and so on.
    */
    public setNewBinding(name: string, val: V) {
        if (name !== WILDCARD_NAME) {
            this.currentEnv.values.set(name, val);
        }
    }

    /*
    Searches the binding "name" in the stack, starting at the current
    environment and moving towards the parent environments. 
    If it finds the binding, it updates its value
    to "val". If it does not find "name", the stack is unchanged.
    As a special case, name "_" is always ignored.
    */
    public updateBinding(name: string, val: V) {
        if (name !== WILDCARD_NAME) {
            const bindings = this.findBindingMap(name);
            if (bindings !== undefined) {
                bindings.set(name, val);
            }
        }
    }

    /*
    Searches the binding "name" in the stack, starting at the current
    environment and moving towards the parent environments. 
    If it finds "name", it returns its value.
    If it does not find "name", it returns undefined.
    As a special case, name "_" always returns undefined.
    */
    public getBinding(name: string): V | undefined {
        if (name === WILDCARD_NAME) {
            return undefined;
        }
        const bindings = this.findBindingMap(name);
        if (bindings !== undefined) {
            return bindings.get(name);
        } else {
            return undefined;
        }
    }

    public selfInEnvironment(): boolean {
        return this.findBindingMap("self") !== undefined;
    }

    /*
    Executes "code" in a fresh environment that is placed at the top
    of the environment stack. The fresh environment is initialized
    with the bindings in "initialBindings". Once "code" finishes
    execution, the new environment is automatically popped from 
    the stack. 
    
    This method is useful for starting a new local variables scope, 
    like in a function call.
    */
    public executeInNewEnvironment<T>(
        code: () => T,
        initialBindings: { names: string[]; values: V[] } = {
            names: [],
            values: [],
        },
    ): T {
        const names = initialBindings.names;
        const values = initialBindings.values;

        // Create a new node in the stack
        this.currentEnv = { values: new Map(), parent: this.currentEnv };

        names.forEach((name, index) => {
            this.setNewBinding(name, values[index]!);
        }, this);

        try {
            return code();
        } finally {
            // Drop the current node in the stack
            this.currentEnv = this.currentEnv.parent!;
        }
    }

    public simulate<T>(
        code: () => T,
        startEnv: Environment<V> = this.currentEnv,
    ): { env: Environment<V>; val: T } {
        // Make a copy of the start environment
        const envCopy = this.copyEnvironment(startEnv);

        // Save the current environment for restoring it once
        // the execution finishes
        const currentEnv = this.currentEnv;

        // All the changes will be made to the copy
        this.currentEnv = envCopy;

        try {
            const result = code();
            return { env: this.currentEnv, val: result };
        } finally {
            // Restore the environment as it was before execution of the code
            this.currentEnv = currentEnv;
        }
    }

    public simulateInNewEnvironment<T>(
        code: () => T,
        startEnv: Environment<V> = this.currentEnv,
    ): { env: Environment<V>; val: T } {
        return this.simulate(
            () => this.executeInNewEnvironment(code),
            startEnv,
        );
    }

    public setCurrentEnvironment(env: Environment<V>) {
        this.currentEnv = env;
    }

    public getCurrentEnvironment(): Environment<V> {
        return this.currentEnv;
    }
}

export const defaultInterpreterConfig: InterpreterConfig = {
    // Let us put a limit of 2 ^ 12 = 4096 iterations on loops to increase compiler responsiveness
    // I think maxLoopIterations should be a command line option in case a user wants to wait more
    // during evaluation.
    maxLoopIterations: 2n ** 12n,

    missingFieldsAndIdsAreAlwaysFatal: false,
};

/*
A parameterizable Tact interpreter. 
The standard Tact interpreter extends this abstract class.

Generic type T is the expressions' result type.
*/
abstract class AbstractInterpreter<T> extends InterpreterInterface<T> {
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
        const exprEvaluator = () => this.interpretExpression(ast.expression);
        this.evalDestructStatement(ast, exprEvaluator);
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

    public abstract evalDestructStatement(
        ast: AstStatementDestruct,
        exprEvaluator: () => T,
    ): void;

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

/*
The standard Tact interpreter.

The constructor receives an optional CompilerContext which includes 
all external declarations that the interpreter will use during interpretation.
If no CompilerContext is provided, the semantics will use an empty 
CompilerContext.

**IMPORTANT**: if a custom CompilerContext is provided, it should be the 
CompilerContext provided by the typechecker. 

The reason for requiring a CompilerContext is that the interpreter should work 
in the use case where the interpreter only knows part of the code.
For example, consider the following code (I marked with brackets [ ] the places 
where the interpreter gets called during expression simplification in the 
compilation phase):

const C: Int = [1];

contract TestContract {

   get fun test(): Int {
      return [C + 1];
   }
}

When the interpreter gets called inside the brackets, it does not know what 
other code is surrounding those brackets, because the interpreter did not execute the 
code outside the brackets. Hence, it relies on the typechecker to receive the 
CompilerContext that includes the declarations in the code 
(the constant C for example).

Since the interpreter relies on the typechecker, this semantics assume that the 
interpreter will only be called on AST trees
that are already valid Tact programs.

Internally, the semantics use a stack of environments to keep track of
variables at different scopes. Each environment in the stack contains a map
that binds a variable name to its corresponding value.
*/
export class TactInterpreter extends AbstractInterpreter<Value> {
    protected envStack: EnvironmentStack<Value>;
    protected context: CompilerContext;
    protected config: InterpreterConfig;

    constructor(
        context: CompilerContext = new CompilerContext(),
        config: InterpreterConfig = defaultInterpreterConfig,
    ) {
        super(copyValue);
        this.envStack = new EnvironmentStack(copyValue);
        this.context = context;
        this.config = config;
    }

    public setEnvironmentStack(envStack: EnvironmentStack<Value>) {
        this.envStack = envStack;
    }

    protected emitFieldOrIdError(message: string, src: SrcInfo): never {
        if (this.config.missingFieldsAndIdsAreAlwaysFatal) {
            throwErrorConstEval(message, src);
        } else {
            throwNonFatalErrorConstEval(message, src);
        }
    }

    public lookupBinding(name: AstId): Value {
        if (hasStaticConstant(this.context, idText(name))) {
            const constant = getStaticConstant(this.context, idText(name));
            if (constant.value !== undefined) {
                return constant.value;
            } else {
                this.emitFieldOrIdError(
                    `cannot evaluate declared constant ${idText(name)} as it does not have a body`,
                    name.loc,
                );
            }
        }
        const variableBinding = this.envStack.getBinding(idText(name));
        if (variableBinding !== undefined) {
            return variableBinding;
        }
        this.emitFieldOrIdError("cannot evaluate a variable", name.loc);
    }

    public evalBuiltinOnSelf(
        ast: AstMethodCall,
        self: Value,
        _argValues: Value[],
    ): Value | undefined {
        switch (idText(ast.method)) {
            case "asComment": {
                ensureMethodArity(0, ast.args, ast.loc);
                const comment = ensureString(self, ast.self.loc);
                return new CommentValue(comment);
            }
            default:
                return undefined;
        }
    }

    public evalCallOnSelf(
        ast: AstMethodCall,
        _self: Value,
        _argValues: Value[],
    ): Value {
        throwNonFatalErrorConstEval(
            `calls of ${idTextErr(ast.method)} are not supported at this moment`,
            ast.loc,
        );
    }

    public interpretNull(_ast: AstNull): Value {
        return null;
    }

    public interpretBoolean(ast: AstBoolean): Value {
        return ast.value;
    }

    public interpretNumber(ast: AstNumber): Value {
        return ensureInt(ast.value, ast.loc);
    }

    public interpretString(ast: AstString): Value {
        return ensureString(
            interpretEscapeSequences(ast.value, ast.loc),
            ast.loc,
        );
    }

    public evalUnaryOp(ast: AstOpUnary, operandEvaluator: () => Value): Value {
        // Tact grammar does not have negative integer literals,
        // so in order to avoid errors for `-115792089237316195423570985008687907853269984665640564039457584007913129639936`
        // which is `-(2**256)` we need to have a special case for it

        if (ast.operand.kind === "number" && ast.op === "-") {
            // emulating negative integer literals
            return ensureInt(-ast.operand.value, ast.loc);
        }

        return evalUnaryOp(ast.op, operandEvaluator, ast.operand.loc, ast.loc);
    }

    public evalBinaryOp(
        ast: AstOpBinary,
        leftValue: Value,
        rightEvaluator: () => Value,
    ): Value {
        return evalBinaryOp(
            ast.op,
            leftValue,
            rightEvaluator,
            ast.left.loc,
            ast.right.loc,
            ast.loc,
        );
    }

    public evalBinaryOpInAugmentedAssign(
        ast: AstStatementAugmentedAssign,
        leftValue: Value,
        rightEvaluator: () => Value,
    ): Value {
        return evalBinaryOp(
            ast.op,
            leftValue,
            rightEvaluator,
            ast.path.loc,
            ast.expression.loc,
            ast.loc,
        );
    }

    public toBoolean(value: Value, src: SrcInfo): boolean {
        return ensureBoolean(value, src);
    }

    public evalStructInstance(
        ast: AstStructInstance,
        initializerEvaluators: (() => Value)[],
    ): Value {
        if (ast.args.length !== initializerEvaluators.length) {
            throwInternalCompilerError(
                "Number of arguments in ast must match the number of argument evaluators.",
            );
        }

        const structTy = getType(this.context, ast.type);

        // initialize the resulting struct value with
        // the default values for fields with initializers
        // or null for uninitialized optional fields
        const resultWithDefaultFields: StructValue = structTy.fields.reduce(
            (resObj, field) => {
                if (field.default !== undefined) {
                    resObj[field.name] = field.default;
                } else {
                    if (field.type.kind === "ref" && field.type.optional) {
                        resObj[field.name] = null;
                    }
                }
                return resObj;
            },
            { $tactStruct: idText(ast.type) } as StructValue,
        );

        // this will override default fields set above
        return ast.args.reduce((resObj, fieldWithInit, index) => {
            resObj[idText(fieldWithInit.field)] =
                initializerEvaluators[index]!();
            return resObj;
        }, resultWithDefaultFields);
    }

    public evalFieldAccess(
        ast: AstFieldAccess,
        aggregateEvaluator: () => Value,
    ): Value {
        // special case for contract/trait constant accesses via `self.constant`
        // interpret "self" as a contract/trait access only if "self"
        // is not already assigned in the environment (this would mean
        // we are executing inside an extends function)
        if (
            ast.aggregate.kind === "id" &&
            isSelfId(ast.aggregate) &&
            !this.envStack.selfInEnvironment()
        ) {
            const selfTypeRef = getExpType(this.context, ast.aggregate);
            if (selfTypeRef.kind === "ref") {
                const contractTypeDescription = getType(
                    this.context,
                    selfTypeRef.name,
                );
                const foundContractConst =
                    contractTypeDescription.constants.find((constId) =>
                        eqNames(ast.field, constId.name),
                    );
                if (foundContractConst === undefined) {
                    // not a constant, e.g. `self.storageVariable`
                    this.emitFieldOrIdError(
                        "cannot evaluate non-constant self field access",
                        ast.aggregate.loc,
                    );
                }
                if (foundContractConst.value !== undefined) {
                    return foundContractConst.value;
                } else {
                    this.emitFieldOrIdError(
                        `cannot evaluate declared contract/trait constant ${idTextErr(ast.field)} as it does not have a body`,
                        ast.field.loc,
                    );
                }
            }
        }
        const valStruct = aggregateEvaluator();
        if (
            valStruct === null ||
            typeof valStruct !== "object" ||
            !("$tactStruct" in valStruct)
        ) {
            throwErrorConstEval(
                `constant struct expected, but got ${showValue(valStruct)}`,
                ast.aggregate.loc,
            );
        }
        return this.extractFieldFromStruct(
            valStruct,
            ast.field,
            ast.aggregate.loc,
        );
    }

    protected extractFieldFromStruct(
        struct: StructValue,
        field: AstId,
        src: SrcInfo,
    ): Value {
        if (idText(field) in struct) {
            return struct[idText(field)]!;
        } else {
            this.emitFieldOrIdError(
                `struct field ${idTextErr(field)} is missing`,
                src,
            );
        }
    }

    public evalBuiltin(
        ast: AstStaticCall,
        argValues: Value[],
    ): Value | undefined {
        switch (idText(ast.function)) {
            case "ton": {
                ensureFunArity(1, ast.args, ast.loc);
                const tons = ensureString(argValues[0]!, ast.args[0]!.loc);
                try {
                    return ensureInt(
                        BigInt(toNano(tons).toString(10)),
                        ast.loc,
                    );
                } catch (e) {
                    if (e instanceof Error && e.message === "Invalid number") {
                        throwErrorConstEval(
                            `invalid ${idTextErr(ast.function)} argument`,
                            ast.loc,
                        );
                    }
                    throw e;
                }
            }
            case "pow": {
                ensureFunArity(2, ast.args, ast.loc);
                const valBase = ensureInt(argValues[0]!, ast.args[0]!.loc);
                const valExp = ensureInt(argValues[1]!, ast.args[1]!.loc);
                if (valExp < 0n) {
                    throwErrorConstEval(
                        `${idTextErr(ast.function)} builtin called with negative exponent ${valExp}`,
                        ast.loc,
                    );
                }
                try {
                    return ensureInt(valBase ** valExp, ast.loc);
                } catch (e) {
                    if (e instanceof RangeError) {
                        // even TS bigint type cannot hold it
                        throwErrorConstEval(
                            "integer does not fit into TVM Int type",
                            ast.loc,
                        );
                    }
                    throw e;
                }
            }
            case "pow2": {
                ensureFunArity(1, ast.args, ast.loc);
                const valExponent = ensureInt(argValues[0]!, ast.args[0]!.loc);
                if (valExponent < 0n) {
                    throwErrorConstEval(
                        `${idTextErr(ast.function)} builtin called with negative exponent ${valExponent}`,
                        ast.loc,
                    );
                }
                try {
                    return ensureInt(2n ** valExponent, ast.loc);
                } catch (e) {
                    if (e instanceof RangeError) {
                        // even TS bigint type cannot hold it
                        throwErrorConstEval(
                            "integer does not fit into TVM Int type",
                            ast.loc,
                        );
                    }
                    throw e;
                }
            }
            case "sha256": {
                ensureFunArity(1, ast.args, ast.loc);
                const str = ensureString(argValues[0]!, ast.args[0]!.loc);
                const dataSize = Buffer.from(str).length;
                if (dataSize > 128) {
                    throwErrorConstEval(
                        `data is too large for sha256 hash, expected up to 128 bytes, got ${dataSize}`,
                        ast.loc,
                    );
                }
                return BigInt("0x" + sha256_sync(str).toString("hex"));
            }
            case "emptyMap": {
                ensureFunArity(0, ast.args, ast.loc);
                return null;
            }
            case "cell":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(argValues[0]!, ast.args[0]!.loc);
                    try {
                        return Cell.fromBase64(str);
                    } catch (_) {
                        throwErrorConstEval(
                            `invalid base64 encoding for a cell: ${str}`,
                            ast.loc,
                        );
                    }
                }
                break;
            case "slice":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(argValues[0]!, ast.args[0]!.loc);
                    try {
                        return Cell.fromBase64(str).asSlice();
                    } catch (_) {
                        throwErrorConstEval(
                            `invalid base64 encoding for a cell: ${str}`,
                            ast.loc,
                        );
                    }
                }
                break;
            case "rawSlice":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(argValues[0]!, ast.args[0]!.loc);

                    if (!/^[0-9a-fA-F]*_?$/.test(str)) {
                        throwErrorConstEval(
                            `invalid hex string: ${str}`,
                            ast.loc,
                        );
                    }

                    // Remove underscores from the hex string
                    const hex = str.replace("_", "");
                    const paddedHex = hex.length % 2 === 0 ? hex : "0" + hex;
                    const buffer = Buffer.from(paddedHex, "hex");

                    // Initialize the BitString
                    let bits = new BitString(
                        buffer,
                        hex.length % 2 === 0 ? 0 : 4,
                        hex.length * 4,
                    );

                    // Handle the case where the string ends with an underscore
                    if (str.endsWith("_")) {
                        const paddedBits = paddedBufferToBits(buffer);

                        // Ensure there's enough length to apply the offset
                        const offset = hex.length % 2 === 0 ? 0 : 4;
                        if (paddedBits.length >= offset) {
                            bits = paddedBits.substring(
                                offset,
                                paddedBits.length - offset,
                            );
                        } else {
                            bits = new BitString(Buffer.from(""), 0, 0);
                        }
                    }

                    // Ensure the bit length is within acceptable limits
                    if (bits.length > 1023) {
                        throwErrorConstEval(
                            `slice constant is too long, expected up to 1023 bits, got ${bits.length}`,
                            ast.loc,
                        );
                    }

                    // Return the constructed slice
                    return beginCell().storeBits(bits).endCell().asSlice();
                }
                break;
            case "ascii":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(argValues[0]!, ast.args[0]!.loc);
                    const hex = Buffer.from(str).toString("hex");
                    if (hex.length > 64) {
                        throwErrorConstEval(
                            `ascii string is too long, expected up to 32 bytes, got ${Math.floor(hex.length / 2)}`,
                            ast.loc,
                        );
                    }
                    if (hex.length == 0) {
                        throwErrorConstEval(
                            `ascii string cannot be empty`,
                            ast.loc,
                        );
                    }
                    return BigInt("0x" + hex);
                }
                break;
            case "crc32":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(argValues[0]!, ast.args[0]!.loc);
                    return BigInt(crc32.str(str) >>> 0); // >>> 0 converts to unsigned
                }
                break;
            case "address":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(argValues[0]!, ast.args[0]!.loc);
                    try {
                        const address = Address.parse(str);
                        if (
                            address.workChain !== 0 &&
                            address.workChain !== -1
                        ) {
                            throwErrorConstEval(
                                `${str} is invalid address`,
                                ast.loc,
                            );
                        }
                        if (
                            !enabledMasterchain(this.context) &&
                            address.workChain !== 0
                        ) {
                            throwErrorConstEval(
                                `address ${str} is from masterchain which is not enabled for this contract`,
                                ast.loc,
                            );
                        }
                        return address;
                    } catch (_) {
                        throwErrorConstEval(
                            `invalid address encoding: ${str}`,
                            ast.loc,
                        );
                    }
                }
                break;
            case "newAddress": {
                ensureFunArity(2, ast.args, ast.loc);
                const wc = ensureInt(argValues[0]!, ast.args[0]!.loc);
                const addr = Buffer.from(
                    ensureInt(argValues[1]!, ast.args[1]!.loc)
                        .toString(16)
                        .padStart(64, "0"),
                    "hex",
                );
                if (wc !== 0n && wc !== -1n) {
                    throwErrorConstEval(
                        `expected workchain of an address to be equal 0 or -1, received: ${wc}`,
                        ast.loc,
                    );
                }
                if (!enabledMasterchain(this.context) && wc !== 0n) {
                    throwErrorConstEval(
                        `${wc}:${addr.toString("hex")} address is from masterchain which is not enabled for this contract`,
                        ast.loc,
                    );
                }
                return new Address(Number(wc), addr);
            }
            default:
                return undefined;
        }
    }

    public lookupFunction(ast: AstStaticCall): AstFunctionDef {
        if (hasStaticFunction(this.context, idText(ast.function))) {
            const functionDescription = getStaticFunction(
                this.context,
                idText(ast.function),
            );
            switch (functionDescription.ast.kind) {
                case "function_def":
                    // Currently, no attribute is supported
                    if (functionDescription.ast.attributes.length > 0) {
                        throwNonFatalErrorConstEval(
                            "calls to functions with attributes are currently not supported",
                            ast.loc,
                        );
                    }
                    return functionDescription.ast;

                case "function_decl":
                    throwNonFatalErrorConstEval(
                        `${idTextErr(ast.function)} cannot be interpreted because it does not have a body`,
                        ast.loc,
                    );
                    break;
                case "native_function_decl":
                    throwNonFatalErrorConstEval(
                        "native function calls are currently not supported",
                        ast.loc,
                    );
                    break;
                case "asm_function_def":
                    throwNonFatalErrorConstEval(
                        "asm function calls are currently not supported",
                        ast.loc,
                    );
                    break;
            }
        } else {
            throwNonFatalErrorConstEval(
                `function ${idTextErr(ast.function)} is not declared`,
                ast.loc,
            );
        }
    }

    public evalStaticCall(
        _ast: AstStaticCall,
        _functionDef: AstFunctionDef,
        functionBodyEvaluator: () => undefined,
        args: { names: string[]; values: Value[] },
    ): Value {
        // Call function inside a new environment
        return this.envStack.executeInNewEnvironment(
            () => {
                // Interpret all the statements
                try {
                    functionBodyEvaluator();
                    // At this point, the function did not execute a return.
                    // Execution continues after the catch.
                } catch (e) {
                    if (e instanceof ReturnSignal) {
                        const val = e.getValue();
                        if (val !== undefined) {
                            return val;
                        }
                        // The function executed a return without a value.
                        // Execution continues after the catch.
                    } else {
                        throw e;
                    }
                }
                // If execution reaches this point, it means that
                // the function had no return statement or executed a return
                // without a value. In summary, the function does not return a value.
                // We rely on the typechecker so that the function is called as a statement.
                // Hence, we can return a dummy null, since the null will be discarded anyway.
                return null;
            },
            { names: args.names, values: args.values },
        );
    }

    public evalDestructStatement(
        ast: AstStatementDestruct,
        exprEvaluator: () => Value,
    ) {
        for (const [_, name] of ast.identifiers.values()) {
            if (hasStaticConstant(this.context, idText(name))) {
                // Attempt of shadowing a constant in a destructuring declaration
                throwInternalCompilerError(
                    `declaration of ${idText(name)} shadows a constant with the same name`,
                    ast.loc,
                );
            }
        }
        const val = exprEvaluator();
        if (
            val === null ||
            typeof val !== "object" ||
            !("$tactStruct" in val)
        ) {
            throwInternalCompilerError(
                `destructuring assignment expected a struct, but got ${showValue(
                    val,
                )}`,
                ast.expression.loc,
            );
        }
        if (ast.identifiers.size !== Object.keys(val).length - 1) {
            this.emitFieldOrIdError(
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
                this.emitFieldOrIdError(
                    `destructuring assignment expected field ${idTextErr(
                        field,
                    )}`,
                    ast.loc,
                );
            }
            this.envStack.setNewBinding(idText(name), v);
        }
    }

    public storeNewBinding(id: AstId, exprValue: Value) {
        if (hasStaticConstant(this.context, idText(id))) {
            // Attempt of shadowing a constant in a let declaration
            throwInternalCompilerError(
                `declaration of ${idText(id)} shadows a constant with the same name`,
                id.loc,
            );
        }

        // Make a copy of exprValue, because everything is assigned by value
        this.envStack.setNewBinding(idText(id), this.copyValue(exprValue));
    }

    public updateBinding(path: AstId[], exprValue: Value, src: SrcInfo) {
        if (path.length === 0) {
            throwInternalCompilerError(
                `path expression must be non-empty`,
                src,
            );
        }
        if (path.length === 1) {
            // Make a copy of exprValue, because everything is assigned by value
            this.envStack.updateBinding(
                idText(path[0]!),
                this.copyValue(exprValue),
            );
            return;
        }

        // the path expression contains at least 2 identifiers

        // Look up the first identifier
        const baseStruct = this.envStack.getBinding(idText(path[0]!));
        if (baseStruct !== undefined) {
            // The typechecker ensures that baseStruct is a contract or a struct,
            // which are treated identically by the interpreter as StructValues

            // Carry out look ups from ids 1 to path.length-2 (inclusive)
            let innerValue = baseStruct as StructValue;
            for (let i = 1; i <= path.length - 2; i++) {
                const fieldName = idText(path[i]!);
                if (fieldName in innerValue) {
                    const tempValue = innerValue[fieldName]!;
                    // The typechecker ensures that tempValue is a StructValue
                    // (because we are not accessing the last id in the path)
                    innerValue = tempValue as StructValue;
                } else {
                    this.emitFieldOrIdError(
                        `cannot find field ${fieldName}`,
                        path[i]!.loc,
                    );
                }
            }

            // Update the final field
            // Make a copy of exprValue, because everything is assigned by value
            innerValue[idText(path[path.length - 1]!)] =
                this.copyValue(exprValue);
        } else {
            this.emitFieldOrIdError(
                `cannot find identifier ${idText(path[0]!)}`,
                path[0]!.loc,
            );
        }
    }

    public runInNewEnvironment(statementsEvaluator: () => void) {
        this.envStack.executeInNewEnvironment(statementsEvaluator);
    }

    public toInteger(value: Value, src: SrcInfo): bigint {
        return ensureInt(value, src);
    }

    public evalReturn(val?: Value) {
        throw new ReturnSignal(val);
    }

    public runOneIteration(
        iterationNumber: bigint,
        src: SrcInfo,
        iterationEvaluator: () => void,
    ) {
        iterationEvaluator();
        if (iterationNumber >= this.config.maxLoopIterations) {
            throwNonFatalErrorConstEval("loop timeout reached", src);
        }
    }

    public toRepeatInteger(value: Value, src: SrcInfo): bigint {
        return ensureRepeatInt(value, src);
    }
}

export function ensureInt(val: Value, source: SrcInfo): bigint {
    if (typeof val !== "bigint") {
        throwErrorConstEval(
            `integer expected, but got '${showValue(val)}'`,
            source,
        );
    }
    if (minTvmInt <= val && val <= maxTvmInt) {
        return val;
    } else {
        throwErrorConstEval(
            `integer '${showValue(val)}' does not fit into TVM Int type`,
            source,
        );
    }
}

export function ensureRepeatInt(val: Value, source: SrcInfo): bigint {
    if (typeof val !== "bigint") {
        throwErrorConstEval(
            `integer expected, but got '${showValue(val)}'`,
            source,
        );
    }
    if (minRepeatStatement <= val && val <= maxRepeatStatement) {
        return val;
    } else {
        throwErrorConstEval(
            `repeat argument must be a number between -2^256 (inclusive) and 2^31 - 1 (inclusive)`,
            source,
        );
    }
}

export function ensureBoolean(val: Value, source: SrcInfo): boolean {
    if (typeof val !== "boolean") {
        throwErrorConstEval(
            `boolean expected, but got '${showValue(val)}'`,
            source,
        );
    }
    return val;
}

function ensureString(val: Value, source: SrcInfo): string {
    if (typeof val !== "string") {
        throwErrorConstEval(
            `string expected, but got '${showValue(val)}'`,
            source,
        );
    }
    return val;
}

function ensureFunArity(arity: number, args: AstExpression[], source: SrcInfo) {
    if (args.length !== arity) {
        throwErrorConstEval(
            `function expects ${arity} argument(s), but got ${args.length}`,
            source,
        );
    }
}

function ensureMethodArity(
    arity: number,
    args: AstExpression[],
    source: SrcInfo,
) {
    if (args.length !== arity) {
        throwErrorConstEval(
            `method expects ${arity} argument(s), but got ${args.length}`,
            source,
        );
    }
}

export function evalUnaryOp(
    op: AstUnaryOperation,
    operandContinuation: () => Value,
    operandLoc: SrcInfo = dummySrcInfo,
    source: SrcInfo = dummySrcInfo,
): Value {
    switch (op) {
        case "+":
            return ensureInt(operandContinuation(), operandLoc);
        case "-":
            return ensureInt(
                -ensureInt(operandContinuation(), operandLoc),
                source,
            );
        case "~":
            return ~ensureInt(operandContinuation(), operandLoc);
        case "!":
            return !ensureBoolean(operandContinuation(), operandLoc);
        case "!!": {
            const valOperand = operandContinuation();
            if (valOperand === null) {
                throwErrorConstEval(
                    "non-null value expected but got null",
                    operandLoc,
                );
            }
            return valOperand;
        }
    }
}

export function evalBinaryOp(
    op: AstBinaryOperation,
    valLeft: Value,
    valRightContinuation: () => Value, // It needs to be a continuation, because some binary operators short-circuit
    locLeft: SrcInfo = dummySrcInfo,
    locRight: SrcInfo = dummySrcInfo,
    source: SrcInfo = dummySrcInfo,
): Value {
    switch (op) {
        case "+":
            return ensureInt(
                ensureInt(valLeft, locLeft) +
                    ensureInt(valRightContinuation(), locRight),
                source,
            );
        case "-":
            return ensureInt(
                ensureInt(valLeft, locLeft) -
                    ensureInt(valRightContinuation(), locRight),
                source,
            );
        case "*":
            return ensureInt(
                ensureInt(valLeft, locLeft) *
                    ensureInt(valRightContinuation(), locRight),
                source,
            );
        case "/": {
            // The semantics of integer division for TVM (and by extension in Tact)
            // is a non-conventional one: by default it rounds towards negative infinity,
            // meaning, for instance, -1 / 5 = -1 and not zero, as in many mainstream languages.
            // Still, the following holds: a / b * b + a % b == a, for all b != 0.
            const r = ensureInt(valRightContinuation(), locRight);
            if (r === 0n)
                throwErrorConstEval("divisor must be non-zero", locRight);
            return ensureInt(divFloor(ensureInt(valLeft, locLeft), r), source);
        }
        case "%": {
            // Same as for division, see the comment above
            // Example: -1 % 5 = 4
            const r = ensureInt(valRightContinuation(), locRight);
            if (r === 0n)
                throwErrorConstEval("divisor must be non-zero", locRight);
            return ensureInt(modFloor(ensureInt(valLeft, locLeft), r), source);
        }
        case "&":
            return (
                ensureInt(valLeft, locLeft) &
                ensureInt(valRightContinuation(), locRight)
            );
        case "|":
            return (
                ensureInt(valLeft, locLeft) |
                ensureInt(valRightContinuation(), locRight)
            );
        case "^":
            return (
                ensureInt(valLeft, locLeft) ^
                ensureInt(valRightContinuation(), locRight)
            );
        case "<<": {
            const valNum = ensureInt(valLeft, locLeft);
            const valBits = ensureInt(valRightContinuation(), locRight);
            if (0n > valBits || valBits > 256n) {
                throwErrorConstEval(
                    `the number of bits shifted ('${valBits}') must be within [0..256] range`,
                    locRight,
                );
            }
            try {
                return ensureInt(valNum << valBits, source);
            } catch (e) {
                if (e instanceof RangeError)
                    // this actually should not happen
                    throwErrorConstEval(
                        `integer does not fit into TVM Int type`,
                        source,
                    );
                throw e;
            }
        }
        case ">>": {
            const valNum = ensureInt(valLeft, locLeft);
            const valBits = ensureInt(valRightContinuation(), locRight);
            if (0n > valBits || valBits > 256n) {
                throwErrorConstEval(
                    `the number of bits shifted ('${valBits}') must be within [0..256] range`,
                    locRight,
                );
            }
            try {
                return ensureInt(valNum >> valBits, source);
            } catch (e) {
                if (e instanceof RangeError)
                    // this is actually should not happen
                    throwErrorConstEval(
                        `integer does not fit into TVM Int type`,
                        source,
                    );
                throw e;
            }
        }
        case ">":
            return (
                ensureInt(valLeft, locLeft) >
                ensureInt(valRightContinuation(), locRight)
            );
        case "<":
            return (
                ensureInt(valLeft, locLeft) <
                ensureInt(valRightContinuation(), locRight)
            );
        case ">=":
            return (
                ensureInt(valLeft, locLeft) >=
                ensureInt(valRightContinuation(), locRight)
            );
        case "<=":
            return (
                ensureInt(valLeft, locLeft) <=
                ensureInt(valRightContinuation(), locRight)
            );
        case "==": {
            const valR = valRightContinuation();

            // the null comparisons account for optional types, e.g.
            // a const x: Int? = 42 can be compared to null
            if (
                typeof valLeft !== typeof valR &&
                valLeft !== null &&
                valR !== null
            ) {
                throwErrorConstEval(
                    "operands of `==` must have same type",
                    source,
                );
            }
            return valLeft === valR;
        }
        case "!=": {
            const valR = valRightContinuation();
            if (typeof valLeft !== typeof valR) {
                throwErrorConstEval(
                    "operands of `!=` must have same type",
                    source,
                );
            }
            return valLeft !== valR;
        }
        case "&&":
            return (
                ensureBoolean(valLeft, locLeft) &&
                ensureBoolean(valRightContinuation(), locRight)
            );
        case "||":
            return (
                ensureBoolean(valLeft, locLeft) ||
                ensureBoolean(valRightContinuation(), locRight)
            );
    }
}

function interpretEscapeSequences(stringLiteral: string, source: SrcInfo) {
    return stringLiteral.replace(
        /\\\\|\\"|\\n|\\r|\\t|\\v|\\b|\\f|\\u{([0-9A-Fa-f]{1,6})}|\\u([0-9A-Fa-f]{4})|\\x([0-9A-Fa-f]{2})/g,
        (match, unicodeCodePoint, unicodeEscape, hexEscape) => {
            switch (match) {
                case "\\\\":
                    return "\\";
                case '\\"':
                    return '"';
                case "\\n":
                    return "\n";
                case "\\r":
                    return "\r";
                case "\\t":
                    return "\t";
                case "\\v":
                    return "\v";
                case "\\b":
                    return "\b";
                case "\\f":
                    return "\f";
                default:
                    // Handle Unicode code point escape
                    if (unicodeCodePoint) {
                        const codePoint = parseInt(unicodeCodePoint, 16);
                        if (codePoint > 0x10ffff) {
                            throwErrorConstEval(
                                `unicode code point is outside of valid range 000000-10FFFF: ${stringLiteral}`,
                                source,
                            );
                        }
                        return String.fromCodePoint(codePoint);
                    }
                    // Handle Unicode escape
                    if (unicodeEscape) {
                        const codeUnit = parseInt(unicodeEscape, 16);
                        return String.fromCharCode(codeUnit);
                    }
                    // Handle hex escape
                    if (hexEscape) {
                        const hexValue = parseInt(hexEscape, 16);
                        return String.fromCharCode(hexValue);
                    }
                    return match;
            }
        },
    );
}
