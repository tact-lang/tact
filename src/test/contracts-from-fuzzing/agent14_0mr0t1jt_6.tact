/// Comprehensive Testing of ASM Functions Feature in Tact, excluding known issues

// Test 1: Minimal valid asm function using TVM instruction PUSHINT
asm fun answer(): Int { 42 PUSHINT }

// Test 2: ASM function using SWAP instruction to reorder the two arguments
asm fun swapArgs(a: Int, b: Int): Int { SWAP }

// Test 3: ASM function with an unused primitive should fail; expecting compilation error
asm fun bad(): Int { 43 }

// Test 4: ASM identity function that simply returns its parameter (leveraging implicit stack passing)
asm fun identity(x: Int): Int { }

// Test 5: ASM function using both argument and return arrangements to swap two values
// Since Tact does not support tuple types directly, we define a struct to capture multiple return values
struct TS { first: Int; second: Int }
asm(b a -> 1 0) fun returnSwap(a: Int, b: Int): TS { }

// Test 6: ASM function using a structure parameter and the ADD instruction to sum its flattened fields
struct AB { a: Int; b: Int }
asm fun sumAB(ab: AB): Int { ADD }

// Test 7: ASM function demonstrating PUSHINT with boundary numeric value
asm fun pushBoundary(): Int { -5 PUSHINT }

// Test 8: ASM function demonstrating a chain of TVM instructions
// Note: The exact behavior depends on the stack; here we create a chain of operations for testing purposes
asm fun computeExpression(a: Int, b: Int): Int {
    // Stack initially: a, b (a at bottom, b at top)
    DUP      // duplicate top (b), stack becomes: a, b, b
    ADD      // add top two: b + b, stack becomes: a, (b+b)
    PUSHINT 1
    ADD      // add: (b+b) + 1, stack becomes: a, (b+b+1)
    SWAP     // swap, stack becomes: (b+b+1), a
    ADD      // add: (b+b+1) + a
}

/// Main function to invoke several tests
fun main() {
    let i = identity(123);
    let srs = returnSwap(10, 20);  // Expected: TS { first: 20, second: 10 } via arrangement
    let sab = sumAB(AB{ a: 10, b: 20 }); // Expected: 30
    let pb = pushBoundary();
    let sa = swapArgs(5, 15); // Expected: swaps to 15
    let ce = computeExpression(3, 7); // Compute (7+7+1)+3 = 18
    pb; // return one computed value
}
