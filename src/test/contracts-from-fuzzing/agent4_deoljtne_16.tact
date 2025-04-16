// Combined Further ASM Fuzz Tests

// Test 26: ASM function with an unknown TVM instruction (expected to fail as FOOBAR is not defined)
asm fun unknownInst(): Int { FOOBAR }

// Test 27: ASM function with multiple inline comments interleaved with instructions
asm fun commentMix(): Int { 
    1 PUSHINT /* push literal 1 */ 
    2 PUSHINT // push literal 2
    ADD 
}

// Test 28: ASM function with an extra literal not consumed by any instruction (expected to fail)
asm fun extraLiteralError(): Int { 10 PUSHINT 20 }

// Test 29: ASM function with multiple inline comments on the same line
asm fun multiComment(): Int { 5 PUSHINT /* push 5 */ 3 PUSHINT /* push 3 */ MUL }

// Test 30: ASM function with a complex calculation sequence
// This pushes 10, then 20, adds them, pushes 5, swaps the top two values, then subtracts: expected result = (5 - 30) = -25
asm fun complexCalc(x: Int): Int { 10 PUSHINT 20 PUSHINT ADD 5 PUSHINT SWAP SUB }
