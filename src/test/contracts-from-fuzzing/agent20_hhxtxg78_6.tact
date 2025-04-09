// Test 3: Valid asm function using DROP TVM instruction with no return
// Assembly function without a declared return type, meaning it does not capture a value from the stack.

asm fun dropValue() { DROP }

fun test_drop() {
    dropValue();
}
