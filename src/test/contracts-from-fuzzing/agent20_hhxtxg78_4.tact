// Test 2: Assembly function with primitive not followed by a TVM instruction
// Expecting a compilation error because the primitive is not paired with an instruction.

asm fun badPrimitive(): Int { 43 }
