/// Test 2: Using a primitive without a consuming instruction
// Expected: Compilation error because 43 is not consumed by any TVM instruction
asm fun withoutInstruction(): Int { 43 }