// Test 10: Creating a masterchain address using chain -1
fun testMasterchainAddress(): Address {
    return newAddress(-1, 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef);
}

fun main() {
    testMasterchainAddress();
    return;
}
