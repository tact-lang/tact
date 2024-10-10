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
    AstStatementLet,
    AstStatementAugmentedAssign,
} from "../grammar/ast";
import { SrcInfo } from "../grammar/grammar";

/*
Implementations of this abstract class represent concrete semantics or behaviors for the interpreter. 
This is useful for attaching special code during the execution of the interpreter.
For example, the standard semantics for the Tact interpreter are implemented by class StandardSemantics.

Generic type V represents the type of expressions' results.
*/
export abstract class InterpreterSemantics<V> {
    public abstract lookupBinding(name: AstId): V;

    /*
    Executes calls to built-in functions of the form self.method(args).
    Should return "undefined" if method is not a built-in function. 
    */
    public abstract evalBuiltinOnSelf(
        ast: AstMethodCall,
        self: V,
        argValues: V[],
    ): V | undefined;

    public abstract evalNull(ast: AstNull): V;

    public abstract evalBoolean(ast: AstBoolean): V;

    public abstract evalInteger(ast: AstNumber): V;

    public abstract evalString(ast: AstString): V;

    /*
    Evaluates the unary operation. Parameter operandEvaluator is a continuation 
    that computes the operator's operand. The reason for using a continuation
    is that certain operators may execute some logic **before** evaluation 
    of the operand.
    */
    public abstract evalUnaryOp(ast: AstOpUnary, operandEvaluator: () => V): V;

    /*
    Evaluates the binary operator. Parameter rightEvaluator is a continuation
    that computes the value of the right operand. The reason for using a continuation
    is that certain operators may execute some logic **before** evaluation 
    of the right operand (for example, short-circuiting).
    */
    public abstract evalBinaryOp(
        ast: AstOpBinary,
        leftValue: V,
        rightEvaluator: () => V,
    ): V;

    public abstract toBoolean(value: V, src: SrcInfo): boolean;

    /*
    Evaluates the struct instance. Parameter initializerEvaluators is a list of continuations.
    Each continuation computes the result of executing the initializer.
    */
    public abstract evalStructInstance(
        ast: AstStructInstance,
        initializerEvaluators: (() => V)[],
    ): V;

    /*
    Evaluates a field access of the form "path.field". Parameter aggregateEvaluator is a continuation.
    The continuation computes the value of "path".
    */
    public abstract evalFieldAccess(
        ast: AstFieldAccess,
        aggregateEvaluator: () => V,
    ): V;

    /*
    Executes calls to built-in functions of the form method(args).
    Should return "undefined" if method is not a built-in function. 
    */
    public abstract evalBuiltin(
        ast: AstStaticCall,
        argValues: V[],
    ): V | undefined;

    public abstract lookupFunction(ast: AstStaticCall): AstFunctionDef;

    /*
    Calls function "functionDef" using parameters "args". The body of "functionDef" can be
    executed by invoking continuation "functionBodyEvaluator". 
    */
    public abstract evalStaticCall(
        ast: AstStaticCall,
        functionDef: AstFunctionDef,
        functionBodyEvaluator: () => void,
        args: { names: string[]; values: V[] },
    ): V;

    /*
    Evaluates the binary operator implicit in an augment assignment. 
    Parameter rightEvaluator is a continuation
    that computes the value of the right operand. The reason for using a continuation
    is that certain operators may execute some logic **before** evaluation 
    of the right operand (for example, short-circuiting).
    */
    public abstract evalBinaryOpInAugmentedAssign(
        ast: AstStatementAugmentedAssign,
        leftValue: V,
        rightEvaluator: () => V,
    ): V;

    public abstract storeNewBinding(ast: AstStatementLet, exprValue: V): void;

    public abstract updateBinding(ast: AstId, exprValue: V): void;

    /*
    Runs the continuation statementsEvaluator in a new environment.
    In the standard semantics, this means opening a new environment in 
    the stack and closing the environment when statementsEvaluator finishes execution.
    */
    public abstract runInNewEnvironment(statementsEvaluator: () => void): void;

    public abstract toInteger(value: V, src: SrcInfo): bigint;

    public abstract toRepeatInteger(value: V, src: SrcInfo): bigint;

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
    
    public abstract evalReturn(val?: V): void;
}
