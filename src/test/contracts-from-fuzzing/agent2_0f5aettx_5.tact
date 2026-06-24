/* Test 17: Extra primitive that is not consumed by an instruction: should error */
asm fun extraArgs(): Int { 1 PUSHINT 2 }