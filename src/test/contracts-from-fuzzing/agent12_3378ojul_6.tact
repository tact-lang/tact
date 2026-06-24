/// Test assembly function with a return type mismatch
asm fun wrongReturn(): Cell { 42 PUSHINT }

fun main() {
    let c = wrongReturn();
}
