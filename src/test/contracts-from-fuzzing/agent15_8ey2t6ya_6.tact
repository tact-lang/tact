/* Test invalid chain id with newAddress() */

fun test_invalid_chain(): Address {
    // Invalid: workchain id 2 is not allowed (only 0 and -1 are supported)
    return newAddress(2, 0x1234);
}

fun main() {
    let _ = test_invalid_chain();
}
