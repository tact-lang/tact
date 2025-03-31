/// Test 28-38: A combined file containing several further edge-case tests for asm functions

// Test 28: Valid arrangement with struct return that swaps parameter order
struct Two { a: Int; b: Int }
asm(-> 1 0) fun swapTwo(a: Int, b: Int): Two { a b }

// Test 36: Comments inside asm function body should be ignored
asm fun commentTest(): Int {
    // This is a comment in asm function
    50 PUSHINT // End-of-line comment
}

// Test 37: Negative number push test; -6 is outside the immediate opcode range and should use extended opcode
asm fun negPush(): Int { -6 PUSHINT }

// Test 38: Multiple TVM instructions using DUP and ADD to sum a number with itself
asm fun multiInstr(a: Int): Int {
    a PUSHINT
    DUP
    ADD
}

// Standard non-asm functions to call the above functions
fun testSwap() {
    // Expected: Two { a: 7, b: 3 }
    let t = swapTwo(3, 7);
}

fun testComment() {
    let x = commentTest();
}

fun testNegPush() {
    let y = negPush();
}

fun testMulti() {
    let z = multiInstr(5); // Expected: 5 + 5 = 10
}
