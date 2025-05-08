contract TestContract { }

// Test to validate contractHash functionality by comparing the newAddress constructed using contractHash
// with the address computed via contractAddress. According to the documentation, they should match.
fun testContractHash() {
    let s = initOf TestContract();
    let computedHash = contractHash(s.code, s.data);
    let addrFromHash = newAddress(0, computedHash);
    let addrFromInit = contractAddress(s);
    require(addrFromHash == addrFromInit, "ContractHash based address mismatch");
}

// Test to validate BasechainAddress helpers: emptyBasechainAddress and newBasechainAddress
fun testBasechainAddressHelpers() {
    let emptyAddr = emptyBasechainAddress();
    require(emptyAddr.hash == null, "emptyBasechainAddress did not yield a null hash");
    let testHash = 987654321;
    let newBaseAddr = newBasechainAddress(testHash);
    require(newBaseAddr.hash == testHash, "newBasechainAddress hash value incorrect");
}

// Run all extra tests together without repeating previously known tests
fun runDeepTests() {
    // Already validated forceBasechain and literal conversion in previous tests
    testContractHash();
    testBasechainAddressHelpers();
}
