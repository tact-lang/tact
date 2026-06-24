/* Test 53: asm function with inline attribute using correct ordering */
asm inline fun inlinedTest2(): Int { 100 PUSHINT }

/* Test 54: Using DUP instruction: duplicates top of stack then adds: 7 PUSHINT DUP ADD -> 7 + 7 = 14 */
asm fun dupAdd(): Int { 7 PUSHINT DUP ADD }

/* Test 57: Using SWAP and DUP: push 3 and 4, then SWAP, DUP, ADD -> After SWAP, the stack is [4, 3], DUP duplicates top (4), then ADD adds 4+4 = 8 */
asm fun swapDup(): Int { 3 PUSHINT 4 PUSHINT SWAP DUP ADD }

/* Test 58: Complex arithmetic chaining: (1+2)*3 = 9 */
asm fun complex(): Int { 1 PUSHINT 2 PUSHINT ADD 3 PUSHINT MUL }

/* Test 59: Minimal whitespace variant; uses only the minimal needed spaces */
asm fun minimalWS(): Int { 42 PUSHINT }