// Test 1: Basic asm function returning constant integer
asm fun answer(): Int { 42 PUSHINT }

fun main() {
    // Expected to return 42
    answer();
}
