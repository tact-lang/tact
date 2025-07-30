// Test 4: Assembly function that attempts to reference a parameter directly, which should be interpreted as a TVM instruction and cause an error
asm fun wrongRef(x: Int): Int { x }
