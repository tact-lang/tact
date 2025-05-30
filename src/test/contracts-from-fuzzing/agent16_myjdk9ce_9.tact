/// Combined Comprehensive Fuzz-Testing File for asm functions

// --- Valid asm functions as per docs ---

// Test 1: Valid asm function using arrangement
asm(s len -> 0) fun asmSwap(s: Slice, len: Int): Slice { SWAP }

// Test 4: Valid asm function using mutates attribute with arrangement (as per docs example)
asm(-> 1 0) extends mutates fun asmMutateLDREF(self: Slice): Cell { LDREF }

// Test 6: Valid multi-line assembly function mixing instructions and comments
asm fun asmMultiLine(): Int {
    // Push constant 7 onto stack
    7 INT
    // Duplicate top of stack
    DUP
    // Drop duplicate
    DROP
}

// Test 7: Assembly function with nested arrangement: using struct as return type
struct Pair { first: Int; second: Int }
asm fun asmReturnPair(a: Int, b: Int): Pair {
    // Push a and b onto the stack
    a INT
    b INT
    // For Pair captured right-to-left, swap to correct order
    SWAP
}

// Test 9: Assembly function with valid argument arrangement using multiple arguments
struct Triple { a: Int; b: Int; c: Int }
asm(a b c -> 2 1 0) fun asmTriple(a: Int, b: Int, c: Int): Triple {
    a INT
    b INT
    c INT
    // Rearrangement (2 1 0) reverses the order: perform two swaps
    SWAP
    SWAP
}

// Test 10: Assembly function with a valid call to a TVM instruction that involves numbers beyond inline literal range
asm fun asmPushLargeNumber(): Int { 300 PUSHINT }

// Test 11: Valid asm function that uses DUP and DROP in sequence to simulate stack depth modifications
asm fun asmStackManipulate(): Int {
    DUP
    DUP
    DROP
    DROP
}

// Test 12: Assembly function that returns no value (void asm function)
asm fun asmNoReturn() { 42 INT DROP }

// --- Error-inducing asm functions (should fail to compile) ---

// These functions are intended to produce compile-time errors and are commented out to allow the file to compile.
/*
// Test 2: Lowercase TVM instruction (should error)
asm fun asmLowerCaseTest(): Int { 42 int }

// Test 3: Assembly function with stray primitive (should error)
asm fun asmStrayPrimitiveTest(): Int { 43 }

// Test 5: Attempt to reference a parameter inside asm body (should error)
struct Dummy { a: Int }
asm fun asmParamReferenceTest(dummy: Dummy): Int { dummy }

// Test 8: Assembly function that mixes valid and invalid instructions on the same line (should error due to stray primitive)
asm fun asmMixInvalid(): Int { 10 INT 20 }
*/

// --- Main function calling valid asm functions ---

fun main() {
    let s = beginCell().asSlice();
    // Call asmSwap
    let _ = asmSwap(s, 5);
    // Call asmMutateLDREF as an extension on Slice
    let _ = s.asmMutateLDREF();
    // Call multi-line asm function
    let _ = asmMultiLine();
    // Call asmReturnPair and retrieve Pair
    let pair: Pair = asmReturnPair(10, 20);
    // Call asmTriple and retrieve Triple
    let triple: Triple = asmTriple(1, 2, 3);
    // Call asmPushLargeNumber
    let _ = asmPushLargeNumber();
    // Call asmStackManipulate
    let _ = asmStackManipulate();
    // Call asmNoReturn
    asmNoReturn();
}
