/*
Comprehensive Assembly Functions Test Suite for Tact Compiler

This test suite contains multiple asm function tests for various aspects of asm functions:
- Test 1: push42NoReturn: an asm function with no return type specified
- Test 2: sumNested: flattening and summing nested structure parameters
- Test 3: checkDepth: testing ACCESS to the TVM stack depth
- Test 4: push9: verifying PUSHINT for a literal within short operand range
- Test 5: echo: identity function using DUP to duplicate the top of the stack

Note: Known issues are avoided as per instructions, and tests focus on features not previously covered in known issues.
*/

// Structures for nested parameter tests
struct AB { a: Int; b: Int }
struct Nested { ab1: AB; ab2: AB }

// Test 1: asm function with no return type
// Behavior: Push 42 onto the stack using PUSHINT; since no return type is specified, the value remains on the stack.
asm fun push42NoReturn(x: Int) { 42 PUSHINT }

// Test 2: asm function to sum flattened nested parameters
// For a Nested struct, the flattened order is: ab1.a, ab1.b, ab2.a, ab2.b.
// The sequence of ADD instructions sums them up.
asm fun sumNested(n: Nested): Int {
    ADD   // (ab2.a + ab2.b): pops top two
    ADD   // adds ab1.b
    ADD   // adds ab1.a, result = ab1.a + ab1.b + ab2.a + ab2.b
}

// Test 3: asm function to retrieve the TVM stack depth
asm fun checkDepth(): Int { DEPTH }

// Test 4: asm function pushing a literal within short operand range
asm fun push9(): Int { 9 PUSHINT }

// Test 5: asm identity function using DUP
// Duplicates the top stack value, effectively returning the input as is.
asm fun echo(x: Int): Int { DUP }

// Test calls
fun testPush42NoReturn() {
    // Call push42NoReturn; since nothing is captured, we simply call it
    push42NoReturn(99);
}

fun testSumNested() {
    let s = sumNested(Nested { ab1: AB { a: 1, b: 2 }, ab2: AB { a: 3, b: 4 } });
    // Expected sum: 1 + 2 + 3 + 4 = 10
}

fun testCheckDepth() {
    let d = checkDepth();
}

fun testPush9() {
    let n = push9();
}

fun testEcho() {
    let e = echo(77);
}
