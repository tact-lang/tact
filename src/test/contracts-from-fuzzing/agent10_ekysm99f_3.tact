// Test 1: Basic asm function returning constant integer
// This tests the minimal valid assembly function using a TVM instruction (PUSHINT)
asm fun push42(): Int { 42 PUSHINT }

fun main() {
    let x: Int = push42();
    // Expected: x = 42
}
