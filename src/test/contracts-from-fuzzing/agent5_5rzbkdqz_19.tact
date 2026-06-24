/// Additional Test 39: asm function that intentionally causes a runtime stack underflow by dropping too many items
// While this compiles, if run, it is expected to cause a runtime error (exit code 2). This validates error messaging at runtime.
asm fun underflowTest(): Int { DROP }

/// Additional Test 40: Using a valid parameter consumption pattern with duplicated parameter usage
// Here we push the parameter value, duplicate it, and add, resulting in twice the value.
asm fun duplicateAdd(x: Int): Int { x PUSHINT DUP ADD }

/// Additional Test 41: Testing a valid asm function with multiple sequential TVM instructions
asm fun sequenceTest(a: Int, b: Int): Int {
    a PUSHINT
    b PUSHINT
    SWAP
    ADD
    DUP
    ADD
}

/// Additional Test 42: Using a valid inline assembly function with a comment block in the middle
asm fun commentInside(): Int {
    // Starting with pushing 30
    30 PUSHINT
    // Duplicate and add
    DUP
    ADD
}

/// Additional Test 43: Edge-case test with negative argument in extended push range
asm fun negExtended(): Int { -128 PUSHINT }

// Standard helper functions to enable linking these asm functions
fun testUnderflow() {
    let _ = underflowTest();
}

fun testDuplicateAdd() {
    let res = duplicateAdd(7); // Expected 7 + 7 = 14
}

fun testSequence() {
    let res = sequenceTest(3, 4); // Calculation: push 3, push 4, swap, add -> (4+3)=7, duplicate, add -> 7+7=14
}

fun testCommentInside() {
    let res = commentInside(); // Expected: 30 + 30 = 60
}

fun testNegExtended() {
    let res = negExtended();
}
