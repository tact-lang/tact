/// Test G: Assembly function with no parameters (global asm function), returning a constant
asm fun answer2(): Int {
    42 PUSHINT
}

fun main() {
    let a: Int = answer2();
}
