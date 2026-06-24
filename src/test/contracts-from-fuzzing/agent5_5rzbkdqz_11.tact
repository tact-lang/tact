/// Test 11: Complex asm function using multiple TVM instructions
asm fun complex(): Int {
    10 PUSHINT
    20 PUSHINT
    SWAP
    ADD
}

fun testComplex() {
    let result = complex();
}
