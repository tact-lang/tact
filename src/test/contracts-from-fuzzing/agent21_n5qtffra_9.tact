//// Test 24: Improper Reference to a Function Parameter
// Direct usage of parameter "x" inside the asm function is not allowed.
// Expected: compile error
asm fun invalidRef(x: Int): Int { x ADD }

fun main() {
    invalidRef(42);
}
