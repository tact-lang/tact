fun testDynamicChainID(invalid: Int) {
    // This tests the behavior when the chain ID is dynamic and potentially invalid.
    let a: Address = newAddress(invalid, 0xdeadbeef);
    a;
}
