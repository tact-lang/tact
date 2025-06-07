// Continuing advanced tests for asm functions with subtle edge cases

// Test 11: Verifying that using a non-existent TVM instruction placeholder in an asm function causes a proper compilation error
// We'll deliberately use an unknown instruction 'FOOBAR', which should trigger a compile-time error.

asm fun unknownInstruction(): Int { FOOBAR }

fun test_unknownInstruction(): Int {
    return unknownInstruction();
}
