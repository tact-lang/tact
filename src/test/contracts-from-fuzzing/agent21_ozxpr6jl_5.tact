/// Test 5: Valid asm function using DEPTH TVM instruction
// It should capture the stack depth (which is an Int) with valid TVM instruction.
asm fun checkDepth(): Int { DEPTH }

fun testDepth() {
    let d = checkDepth();
}
