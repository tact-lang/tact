/* Test 18: Mismatched return type: capturing an Int value as a Cell, expected runtime type error */
asm fun wrongReturn(): Cell { 42 PUSHINT }