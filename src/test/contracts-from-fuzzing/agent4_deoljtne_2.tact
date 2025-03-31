/// Test 2: Using a parameter identifier in asm body – expected to fail because parameter usages must not be referenced directly
asm fun identity(x: Int): Int { x }