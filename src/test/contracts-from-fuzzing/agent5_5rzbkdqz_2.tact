/// Test 2: dynamicPush - attempting to use parameter x as a primitive
// Expected to fail because direct use of a parameter in asm body without a consuming TVM instruction is not allowed due to misinterpretation as a TVM opcode.

asm fun dynamicPush(x: Int): Int { x PUSHINT }
