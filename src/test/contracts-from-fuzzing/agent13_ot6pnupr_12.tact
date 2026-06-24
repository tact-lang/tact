// Comprehensive Testing Report for asm functions in Tact
//
// Documentation for asm functions details several aspects:
// - Assembly functions must start with the 'asm' keyword and consist purely of TVM instructions and primitives.
// - Extension asm functions (using the 'extends' modifier) require the first parameter to be named 'self' (and note that 'self' cannot be declared for non-extension functions).
// - Parameter arrangements: using the arrangement syntax like 'asm(s len -> 1 0)' allows reordering of arguments on the stack, as documented  .
// - Primitives in the body must be consumed by a TVM instruction; standalone primitives cause compilation errors  .
// - Direct use of a parameter identifier in the asm body (e.g., simply writing 'x') is interpreted as a TVM instruction, leading to errors if undefined  .

// We performed a series of tests to validate these documented claims:

// Test 1: Basic asm function returning a constant using PUSHINT
asm fun answer(): Int { 42 PUSHINT }

// Test 2: Valid asm extension function 'addOne'
// Per documentation, extension functions require the first parameter to be named 'self' and are invoked using method syntax.
asm extends fun addOne(self: Int): Int { 1 PUSHINT ADD }

// Test 3: Non-extension asm function 'identity' with an empty body
// According to the documentation, if no instructions are provided, the value pushed (the parameter) is captured and returned.
asm fun identity(x: Int): Int { }

// Test 4: asm function 'bad' that emits an unused primitive
// The documentation specifies that a primitive that is not attached to a TVM instruction should throw a compilation error (as seen in  ). The function below is expected to fail.
asm fun bad(): Int { 43 }

// Test 5: asm extension function 'swap' using SWAP instruction
// This function swaps the order of its two integer inputs (with the first being 'self').
struct Pair { a: Int; b: Int }
asm extends fun swap(self: Int, other: Int): Pair { SWAP }

// Test 6: asm function 'swapArgs' using explicit arrangement
// Here we define a non-extension function with an arrangement 'asm(s len -> 1 0)' that swaps the two parameters on the stack.
asm(s len -> 1 0) fun swapArgs(len: Int, s: Int): Pair { SWAP }

// Test 7: asm function 'paramTest' referencing its parameter directly
// Directly writing the parameter name (e.g., 'x') in the body is not allowed since it will be interpreted as a TVM instruction token. This test is expected to produce a compile error.
asm fun paramTest(x: Int): Int { x }

// Main function invoking our tests
fun main() {
    // Invoke Test 1
    answer();

    // Invoke Test 2: Call using method syntax
    41.addOne();

    // Invoke Test 3: 'identity' should simply return its argument
    identity(123);

    // Test 4: 'bad' would produce a compilation error; leave commented out
    // bad();

    // Invoke Test 5: 'swap' should swap 10 and 20, producing Pair { a: 20, b: 10 }
    let p1: Pair = 10.swap(20);

    // Invoke Test 6: 'swapArgs' called normally; due to the arrangement, swapArgs(1, 2) should produce Pair { a: 2, b: 1 }
    let p2: Pair = swapArgs(1, 2);

    // Test 7: 'paramTest' is expected to fail; leave commented to avoid compile error
    // paramTest(10);
}
