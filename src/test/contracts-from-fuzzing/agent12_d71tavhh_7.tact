// Test A: Basic asm function that pushes a constant onto the stack
asm fun answer(): Int {
    42 PUSHINT
}

fun main() {
    let a: Int = answer();
}
