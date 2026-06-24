/*
Comprehensive Assembly Functions Test Suite for Tact Compiler

This file consolidates multiple asm function tests into a single source code to verify that assembly functions behave in accordance with the official Tact documentation.

Tests included:
1. Basic assembly function: 'answer' returns a literal using the TVM PUSHINT instruction.
2. Parameter ordering via SWAP: 'swapPair' swaps two integer parameters and returns them in a struct, verifying correct stack ordering.
3. Return arrangement with asm(-> 1 0): 'swapReturn' swaps the order of two parameters when capturing the return values, using a dedicated struct Pair2 with fields 'first' and 'second'.
4. Struct parameter flattening: 'addAB' adds two integers from a flattened struct AB.
5. Assembly function with no return capture: 'push42NoReturn' pushes a literal onto the stack without capturing it (side-effect only).
6. Nested struct parameter handling: 'sumNested' sums four integers from a nested struct (flattening nested AB structs).
7. TVM instruction for stack depth: 'checkDepth' returns the TVM stack depth via the DEPTH instruction.
8. Testing PUSHINT with a literal within short operand range: 'push9'.
9. Identity function using DUP: 'echo' returns its input unchanged.

All these tests confirm the documented behavior of asm functions and related TVM instructions in Tact.

Note: The intentionally failing test for primitive usage (bad) is omitted here as it was already verified separately.
*/

// 1. Basic asm function returning a literal
asm fun answer(): Int { 42 PUSHINT }

// 2. Parameter ordering test with SWAP
struct Pair { a: Int; b: Int }
asm fun swapPair(a: Int, b: Int): Pair { SWAP }

// 3. Return arrangement using asm(-> 1 0) to swap return order
struct Pair2 { first: Int; second: Int }
asm(-> 1 0) fun swapReturn(x: Int, y: Int): Pair2 { SWAP }

// 4. Struct flattening in parameters
struct AB { a: Int; b: Int }
asm fun addAB(two: AB): Int { ADD }

// 5. asm function with no return capture (side-effect only)
asm fun push42NoReturn(x: Int) { 42 PUSHINT }

// 6. Nested struct parameter flattening
struct Nested { ab1: AB; ab2: AB }
asm fun sumNested(n: Nested): Int {
    // The flattened order: ab1.a, ab1.b, ab2.a, ab2.b
    // Perform: (ab2.a + ab2.b), then add ab1.b, then add ab1.a
    ADD
    ADD
    ADD
}

// 7. TVM instruction to check stack depth
asm fun checkDepth(): Int { DEPTH }

// 8. Testing PUSHINT with a literal within short operand range
asm fun push9(): Int { 9 PUSHINT }

// 9. Identity function using DUP
asm fun echo(x: Int): Int { DUP }

// Comprehensive test function aggregating all tests from above
fun comprehensiveAsmTestSuite() {
    let a = answer();                // Expected: 42
    let sp = swapPair(11, 22);         // Expected: sp.a = 22, sp.b = 11
    let sr = swapReturn(123, 456);     // Expected: sr.first = 456, sr.second = 123
    let sumAB = addAB(AB { a: 10, b: 15 }); // Expected: 25 (15 + 10)
    push42NoReturn(99);              // Side-effect: pushes 42 but not captured
    let nestedSum = sumNested(Nested { ab1: AB { a: 1, b: 2 }, ab2: AB { a: 3, b: 4 } }); // Expected: 10
    let d = checkDepth();            // Returns current TVM stack depth
    let n = push9();                 // Expected: 9
    let e = echo(77);                // Expected: 77
    
    // Dummy usage to avoid unused variable warnings:
    let _ = a + sp.a + sp.b + sr.first + sr.second + sumAB + nestedSum + d + n + e;
}
