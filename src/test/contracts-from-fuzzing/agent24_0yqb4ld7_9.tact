struct MyPair { first: Int; second: Int }

// Test 1: Swap arrangement using asm functions
asm(a b -> 1 0) fun swapPair(a: Int, b: Int): MyPair { SWAP }

// Test 2: asm function with no declared return type (pushes a value then drops it)
asm fun noReturn() { 42 PUSHINT DROP }

// Test 3: asm function with inline attribute
asm inline fun inlineTest(): Int { 42 PUSHINT }

// Test 4 & 5: Valid extends and mutates extends assembly functions
// Extension functions must be called on an instance
struct TestBuilder { dummy: Int }

asm extends fun extTest(self: TestBuilder): TestBuilder { DROP }

asm mutates extends fun mutTest(self: TestBuilder, x: Int): TestBuilder { INC }

// Test 6: Assembly function using a struct as a parameter (struct flattening)
struct AB { a: Int; b: Int }
asm fun sumAB(val: AB): Int { ADD }

// Test 7: Assembly function pushing an immediate value outside the default immediate range (-5..10)
asm fun push15(): Int { 15 PUSHINT }

// Main function to call our tests; main returns void
fun main() {
    // Test 1: Swap arrangement
    let pair = swapPair(100, 200);
    // pair.first should be 200 and pair.second should be 100

    // Test 3: Inline attribute
    let v_inline = inlineTest();

    // Test 4 & 5: Extension functions via method calls
    let tb = TestBuilder { dummy: 0 };
    let tb_after_ext = tb.extTest();
    let tb_after_mut = tb_after_ext.mutTest(41);

    // Test 6: Struct parameter flattening
    let s = sumAB(AB { a: 5, b: 15 });

    // Test 7: Immediate value push with value 15
    let num15 = push15();

    // Test 2: Call noReturn (no captured value expected)
    noReturn();

    // End of tests; main returns void
}
