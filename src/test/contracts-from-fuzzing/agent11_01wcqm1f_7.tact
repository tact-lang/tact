/// Test: Mutation asm function using the mutates attribute

// A simple assembly function that uses the mutates attribute.
// According to the docs, the mutates function consumes an extra value from the stack ('self').
// For our test, we simply define it without calling it.

asm(-> 1 0) extends mutates fun loadAndReturn(self: Int): Int {
    999 PUSHINT
}

/// Test: Stack underflow error in asm function by deliberately dropping too many values
// This function is defined to show compile-time behavior. We do not call it.
asm fun underflowTest(): Int {
    repeat (10) { DROP }
}

/// Test: Combining argument arrangement with no return arrangement
// Using a parameter arrangement to rearrange order of parameters. We'll use "asm(a c b)".
// With 3 parameters (a, b, c), originally they are pushed as: a (bottom), then b, then c on top.
// With arrangement asm(a c b), they are pushed in the order: a, then c, then b, meaning top-of-stack is b, below it is c, below that is a.
// We compute a + b + c by adding the top two values, then swapping, then adding.

asm(a c b) fun rearrangeSum(a: Int, b: Int, c: Int): Int {
    ADD   // adds top two: b + c, leaving a and (b+c) on the stack
    SWAP  // bring a to top
    ADD   // adds a + (b+c)
}

/// Test: Using lowercase tvm instruction to confirm case sensitivity error
// This asm function should fail to compile because 'pushint' is in lowercase instead of 'PUSHINT'.
asm fun caseSensitivityFail(): Int { 42 pushint }

/// main function calls the valid function rearrangeSum.
fun main() {
    let _ = rearrangeSum(1, 2, 3);
}
