// Revised Test 20: Correcting return rearrangement error for a function returning a single value.
// Instead of using (-> 1 0) which is invalid for a function that returns a single value,
// we use the default arrangement (-> 0) or omit arrangement altogether.

struct SingleInt { value: Int }
asm(-> 0) fun swapSubCorrected(): SingleInt {
    100 PUSHINT
    50 PUSHINT
    SUB
}

// Re-run Test 18: Execute unknown instruction test
asm fun unknownInstruction(): Int { FOOBAR }

// Continue with other tests from 19 to 25 (unchanged where possible)

// Test 19: Use multiple TVM instructions in sequence (complex sequence) and check stack depth consistency
asm fun complexSequence(): Int {
    1 PUSHINT       // push 1
    2 PUSHINT       // push 2
    ADD             // result: 3
    3 PUSHINT       // push 3
    MUL             // result: 9
}

// Test 21: Use a TVM instruction with an argument that forces a different opcode variant
asm fun pushLargeNumber(): Int {
    500 PUSHINT
}

// Test 22: Testing multiple instructions with inline arrangements: Using arrangement on both parameters and result
struct Pair2 { first: Int; second: Int }
// We'll simulate a function that expects to capture two identical values as Pair2 after ADD and DUP
asm(b a -> 0 1) fun pairAdd(a: Int, b: Int): Pair2 {
    ADD
    DUP  // Duplicate the result
}

// Test 23: Creating an asm function that attempts to mix non-primitive constants with TVM instructions.
asm fun mixedPrimitiveOrder(): Int {
    5 PUSHINT
    10
    ADD
}

// Test 24: Empty asm function with no operations and no declared return type (should compile)
asm fun trulyEmpty() { }

// Test 25: Using a parameter name that shadows a TVM instruction (e.g., ADD) but then not using it
asm fun shadowParam(ADD: Int): Int { 99 PUSHINT }
