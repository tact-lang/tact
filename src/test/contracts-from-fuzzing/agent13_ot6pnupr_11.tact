// Comprehensive Testing of asm functions in Tact

// Test 1: Basic asm function using TVM instructions (non-extension)
// This function simply returns the constant 42 using PUSHINT.
asm fun answer(): Int { 42 PUSHINT }

// Test 2: Valid asm extension function ('addOne'):
// Extension asm functions require the first parameter to be named 'self' and are called with method syntax.
asm extends fun addOne(self: Int): Int { 1 PUSHINT ADD }

// Test 3: Non-extension asm function with an empty body (identity function)
// According to behavior, the value on top of the stack is captured as the return value.
// Here the parameter 'x' will be pushed; empty body means the stack is unaltered.
asm fun identity(x: Int): Int { }

// Test 4: Invalid asm function that provides an unused primitive;
// According to documentation, a primitive not consumed by any instruction should result in a compilation error.
asm fun bad(): Int { 43 }

// Test 5: asm extension function with arrangements and swapping
// Define a struct for capturing two integers
struct Pair { a: Int; b: Int }

// This extension asm function uses 'SWAP' to exchange positions of 'self' and the second parameter.
// It is invoked as an extension method, so the first parameter is 'self'.
asm extends fun swap(self: Int, other: Int): Pair { SWAP }

// Test 6: asm function using explicit arrangement
// Here we define a non-extension asm function with two parameters (len, s) and an arrangement which swaps them.
// The arrangement 's len -> 1 0' means that at runtime, 's' will be on top of the stack captured first, then 'len'.
asm(s len -> 1 0) fun swapArgs(len: Int, s: Int): Pair { SWAP }

// Test 7: asm function attempting to reference a parameter directly in the body
// According to documentation, direct references to parameters in asm function bodies are interpreted as TVM instruction names,
// which leads to obscure errors as such identifiers are unlikely to be valid TVM instructions.
asm fun paramTest(x: Int): Int { x }


// Main function to invoke the tests
fun main() {
    // Test 1: Call basic asm function
    answer();

    // Test 2: Call extension asm function 'addOne' using method syntax
    41.addOne();

    // Test 3: Call non-extension 'identity' - expect to return the same value because the parameter is captured from the stack
    identity(123);

    // Test 4: The following call is expected to fail compilation due to the unused primitive 43
    // Uncomment to see compilation error
    // bad();

    // Test 5: Call extension function 'swap' using method syntax
    let p1: Pair = 10.swap(20);  // Expected Pair { a: 20, b: 10 } after swap

    // Test 6: Call asm function with arrangement; invocation uses normal call syntax
    let p2: Pair = swapArgs(1, 2); // Expected Pair { a: 2, b: 1 } because of arrangement swapping

    // Test 7: Call asm function 'paramTest' which references its parameter directly
    // This is expected to produce an error at runtime or result in ambiguous behavior
    // Uncomment to test behavior
    // paramTest(10);
}
