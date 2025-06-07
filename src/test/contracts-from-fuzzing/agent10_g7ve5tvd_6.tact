/// Test 7: Using a parameter name that conflicts with a TVM instruction (DROP)
asm fun conflict(DROP: Int): Int { DROP }