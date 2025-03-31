fun testDynamicComputedChain() : Address {
    let chain: Int = 2 - 2; // dynamically computes to 0, but at compile-time is constant
    return newAddress(chain, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun main() {
    let a = testDynamicComputedChain();
}
