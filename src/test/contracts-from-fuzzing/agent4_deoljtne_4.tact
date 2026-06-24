/// Test 4: ASM function with a primitive not consumed by any TVM instruction
// Expected: Compilation error because the literal 100 is not consumed by any following instruction.
asm fun missingInstruction(): Int { 100 }