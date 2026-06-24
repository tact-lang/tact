/* Combined test suite for asm functions feature in Tact

This suite covers various aspects of assembly (asm) functions, including:

1. A simple asm function with a TVM instruction (PUSHINT) using a literal.
2. Flattening of struct parameters: using a Pair struct and ADD TVM instruction.
3. An invalid asm function using a primitive literal without a consuming TVM instruction (should yield a compilation error).
4. A misuse: directly referencing a parameter identifier inside the asm function body (should yield a compilation error as it's interpreted as a TVM instruction).
5. Swapping return values using a return arrangement.
6. Combining both argument and return arrangements.
7. Using the DEPTH TVM instruction to capture the current stack depth.

We expect:
- Tests 1, 2, 5, 6, 7 to compile successfully.
- Tests 3 and 4 to yield appropriate compilation errors.

Note: This combined suite targets edge cases of asm functions and validates the current Tact documentation (for asm functions) against the compiler behavior.
*/

// Test 1: Simple asm function using TVM instruction PUSHINT
asm fun answer(): Int { 42 PUSHINT }

// Test 2: Using a struct parameter that is flattened on the stack
struct Pair { a: Int; b: Int }

asm fun addPair(p: Pair): Int { ADD }

// Test 3: Invalid usage: a primitive literal not consumed by any TVM instruction
// Expected: Compilation error about unused primitive
asm fun bad(): Int { 43 }

// Test 4: Misuse of parameter: directly referencing a parameter identifier
// Expected: Compilation error (unrecognized TVM instruction 'x')
asm fun identity(x: Int): Int { x }

// Test 5: Returning a swapped pair using a return arrangement
asm(-> 1 0) fun swapPair(a: Int, b: Int): Pair { SWAP }

// Test 6: Combining argument and return arrangements
asm(b a -> 1 0) fun swapArgOrder(a: Int, b: Int): Pair { SWAP }

// Test 7: Using the DEPTH TVM instruction to obtain stack depth
asm fun depthFunc(): Int { DEPTH }
