// Additional tests for contract address functionalities exploring subtle edge cases

// Test: forceWorkchain with a valid masterchain address
fun testForceWorkchainValid() {
    let masterchainAddr: Address = newAddress(-1, 0xABC);
    // This call should succeed since the workchain parameter matches (-1)
    forceWorkchain(masterchainAddr, -1, 593);
}

// Test: Address.toString returns a nonempty string
fun testAddressToStringNonEmpty() : Bool {
    let a: Address = newAddress(0, 0xABCDEF);
    let s: String = a.toString();
    // Check that the string is not empty
    return s != "";
}

// Test: newBasechainAddress and emptyBasechainAddress behavior
fun testBasechainAddressConstructors() : Bool {
    let emptyAddr: BasechainAddress = emptyBasechainAddress();
    let filledAddr: BasechainAddress = newBasechainAddress(0x789);
    // emptyAddr.hash should be null and filledAddr.hash should equal 0x789
    return (emptyAddr.hash == null) && (filledAddr.hash == 0x789);
}

// Integrated test invoking all new tests
fun integratedAddressTest2() {
    testForceWorkchainValid();
    dump(testAddressToStringNonEmpty());
    dump(testBasechainAddressConstructors());
    dump("Integrated Address Test 2 complete");
}
