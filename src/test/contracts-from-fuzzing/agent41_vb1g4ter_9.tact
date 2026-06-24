fun testComputedConstantChain() : Address {
    // Using an arithmetic expression that resolves to 0
    return newAddress(0 + 0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun main() {
    let addr = testComputedConstantChain();
}
