fun testInvalidChain() {
    // Invalid chain id "1" should be rejected at compile time
    let a: Address = newAddress(1, 0);
}

fun main() {
    testInvalidChain();
}
