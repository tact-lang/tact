/// Comprehensive Testing of ASM Functions Feature in Tact (Extended Tests - Corrected Calls for extends functions)

// Test 1: Minimal valid asm function using TVM instruction PUSHINT
asm fun answer(): Int { 42 PUSHINT }

// Test 2: ASM function using SWAP instruction to reorder the two arguments
asm fun swapArgs(a: Int, b: Int): Int { SWAP }

// Test 3: ASM function with an unused primitive should fail; expecting compilation error
// Note: This test is isolated because it is expected to fail, so it's commented out:
// asm fun bad(): Int { 43 }

// Test 4: ASM identity function that simply returns its parameter (leveraging implicit stack passing)
asm fun identity(x: Int): Int { }

// Test 5: ASM function using both argument and return arrangements to swap two values
// We use a struct to capture multiple return values
struct TS { first: Int; second: Int }
asm(b a -> 1 0) fun returnSwap(a: Int, b: Int): TS { }

// Test 6: ASM function using a structure parameter and the ADD instruction to sum its flattened fields
struct AB { a: Int; b: Int }
asm fun sumAB(ab: AB): Int { ADD }

// Test 7: ASM function demonstrating PUSHINT with a boundary numeric value
asm fun pushBoundary(): Int { -5 PUSHINT }

// Test 8: ASM function demonstrating a chain of TVM instructions
// Stack initially: a (bottom), b (top)
asm fun computeExpression(a: Int, b: Int): Int {
    DUP      // duplicate top (b): stack becomes: a, b, b
    ADD      // add top two: b + b, stack becomes: a, (b+b)
    PUSHINT 1
    ADD      // add: (b+b) + 1, stack becomes: a, (b+b+1)
    SWAP     // swap, stack becomes: (b+b+1), a
    ADD      // add: (b+b+1) + a
}

// Test 9: ASM function with 'inline' attribute (should compile successfully)
asm inline fun inlineTest(): Int { 42 PUSHINT }

// Test 10: ASM function with 'extends' attribute
// For extends functions, the first parameter must be named 'self' and have the extended type
asm extends fun extendedAsm(self: Int, x: Int): Int { 42 PUSHINT }

// Test 11: ASM function with both 'extends' and 'mutates' attributes
asm extends mutates fun mutatedAsm(self: Int, x: Int): Int { 42 PUSHINT }

// Test 12: ASM function using an argument arrangement only to reorder parameters
// The arrangement 'asm(b a)' rearranges so that parameter 'b' is pushed first and 'a' second
asm(b a) fun orderOnly(a: Int, b: Int): Int { SWAP }

// Main function invoking several of the tests
fun main() {
    let a = answer();
    let s = swapArgs(10, 20);
    let i = identity(123);
    let rs = returnSwap(10, 20); // Expected to capture TS { first: 20, second: 10 }
    let sab = sumAB(AB{ a: 10, b: 20 }); // Expected: 30
    let pb = pushBoundary();
    let ce = computeExpression(3, 7); // Expected: (7+7+1)+3 = 18
    let it = inlineTest();
    // Calling extension functions must be done on the extended type instance
    let ea = (100).extendedAsm(200);
    let ma = (300).mutatedAsm(400);
    let oo = orderOnly(5, 15);

    // Return one value to satisfy main's expected type
    a;
}
