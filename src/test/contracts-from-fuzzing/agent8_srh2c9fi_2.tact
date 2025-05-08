// Test 1: Basic asm function returning a constant value
asm fun answer(): Int { 42 PUSHINT }

// A simple function to call answer()
fun main() {
    let x = answer();
}
