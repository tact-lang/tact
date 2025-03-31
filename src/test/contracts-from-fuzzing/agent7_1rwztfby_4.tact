contract DynamicChainTest {}

fun testDynamicChain(chain: Int): Address {
    // Using a chain value that is dynamic, so the compile-time check should not trigger if not constant
    return newAddress(chain, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun testValid(): Bool {
    // This function calls testDynamicChain with valid and invalid values
    let addr0: Address = testDynamicChain(0);
    let addrM1: Address = testDynamicChain(-1);
    // They should be different; also dynamic check passes
    return addr0 != addrM1;
}
