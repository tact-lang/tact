/*
Test 3: Invalid newAddress usage with unsupported chain ID
According to the documentation, only -1 (masterchain) and 0 (basechain) are allowed.
This snippet should trigger a compile-time error.
*/
fun invalidChain(): Address {
    // 1 is not a supported chain ID
    return newAddress(1, 0);
}
