/* Test 40: Using a nonexistent TVM instruction, expecting a compile-time error */
asm fun invalidInstr(): Int { 42 PUSHINT FOO }

/* Test 41: asm function intended to trigger stack underflow at runtime (expected behavior, not a compiler bug) */
asm fun underflow(): Int { DROP }