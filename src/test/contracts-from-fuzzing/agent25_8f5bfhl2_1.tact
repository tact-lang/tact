/// Test 1: A simple valid asm function that pushes 42 onto the stack and captures it as an Int
asm fun answer(): Int { 42 PUSHINT }

fun main() {
    answer();
}
