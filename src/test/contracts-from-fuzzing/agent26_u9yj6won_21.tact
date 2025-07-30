// Updated comprehensive test suite for contract address functionalities, updated to avoid inline if expressions

contract ReconstructTest {}

// Test: Using an extra data prefix before a standard address should cause parse error
fun testParseStdAddressWithExtraData() : Bool {
    let a: Address = newAddress(0, 0x123456789ABCDEF);
    // Store an extra 8-bit value before the actual address
    let builder = beginCell()
        .storeUint(42, 8)    // Extra data
        .storeAddress(a);
    let slice = builder.asSlice();
    try {
        let _ = slice.asAddress(0);
        return false; // Parsing succeeded unexpectedly
    } catch (exitCode) {
        return true; // Expected failure
    }
}

// Test: Reconstruct contract address using contractHash and compare with contractAddress
fun testContractAddressReconstruction() : Bool {
    let initPkg: StateInit = initOf ReconstructTest();
    let addr1: Address = contractAddress(initPkg);
    let addr2: Address = newAddress(0, contractHash(initPkg.code, initPkg.data));
    return addr1 == addr2;
}

// Test: Dynamically determine chain id using ternary operator
fun testDynamicChainId(x: Int) {
    let chainId = (x % 2 == 0) ? 0 : -1;
    let _ = newAddress(chainId, 0x1234);
}

// Test: Basic equality properties of addresses
fun testEqualityProperties() : Bool {
    let addr1 = newAddress(0, 0xAB);
    let addr2 = newAddress(0, 0xAB);
    let addr3 = newAddress(-1, 0xAB);
    return (addr1 == addr2) && (addr1 != addr3);
}

// Test: Roundtrip serialization: store an address in a cell and recover it
fun testRoundtripSerialization() : Bool {
    let a = newAddress(0, 0xFEDCBA);
    let slice = beginCell().storeAddress(a).asSlice();
    let b = slice.asAddress(0);
    return a == b;
}

// Additional tests: forceWorkchain, Address.toString, and BasechainAddress constructors

fun testForceWorkchainValid() {
    let masterchainAddr: Address = newAddress(-1, 0xABC);
    // This call should succeed since the workchain parameter matches (-1)
    forceWorkchain(masterchainAddr, -1, 593);
}

fun testAddressToStringNonEmpty() : Bool {
    let a: Address = newAddress(0, 0xABCDEF);
    let s: String = a.toString();
    return s != "";
}

fun testBasechainAddressConstructors() : Bool {
    let emptyAddr: BasechainAddress = emptyBasechainAddress();
    let filledAddr: BasechainAddress = newBasechainAddress(0x789);
    return (emptyAddr.hash == null) && (filledAddr.hash == 0x789);
}

// Integrated test invoking multiple address edge case tests
fun integratedAddressTests() {
    dump(testParseStdAddressWithExtraData());
    dump(testContractAddressReconstruction());
    testDynamicChainId(15);
    dump(testEqualityProperties());
    dump(testRoundtripSerialization());
    testForceWorkchainValid();
    dump(testAddressToStringNonEmpty());
    dump(testBasechainAddressConstructors());
    dump("Integrated Address Tests complete");
}
