
/**
 * Mode "all" instructs the interpreter to execute all branches at a branching point.
 * This mode will first attempt to evaluate boolean conditions in order to determine the branch
 * to execute. If the condition evaluation fails, it will execute all the possible branches.
 * 
 * Mode "standard" instructs the interpreter to behave like a standard interpreter 
 * (i.e., take the branch for the corresponding boolean condition).
 */


/*
Implementations of this abstract class represent concrete semantics or behaviors for the interpreter. 
This is useful for attaching special code during the execution of the interpreter.
For example, the standard semantics for the Tact interpreter are implemented by class StandardSemantics.

Generic type V represents the type of expressions' results.
*/

