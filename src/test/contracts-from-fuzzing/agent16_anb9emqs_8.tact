contract TestContract { }

// Test to validate hasSameBasechainAddress extension method
fun testHasSameBasechainAddress() {
    let s = initOf TestContract();

    // For a basechain address computed from the contract's init package, it should return true
    let baseAddr = contractAddress(s);
    require(s.hasSameBasechainAddress(baseAddr), "hasSameBasechainAddress check failed for basechain address");

    // Now, construct a masterchain address and ensure hasSameBasechainAddress returns false
    let masterAddr = newAddress(-1, contractHash(s.code, s.data));
    require(!s.hasSameBasechainAddress(masterAddr), "hasSameBasechainAddress should return false for non-basechain address");
}

// Test to validate that contractAddressExt can produce a masterchain address and that forceBasechain rejects it
fun testContractAddressExtDifferentChain() {
    let s = initOf TestContract();
    let masterAddr = contractAddressExt(-1, s.code, s.data);
    try {
         forceBasechain(masterAddr);
         require(false, "forceBasechain did not throw for masterchain address produced by contractAddressExt");
    } catch (exitCode) {
         require(exitCode == 138, "Unexpected exit code for forceBasechain on masterchain address from contractAddressExt");
    }
}

// Test to validate storing a BasechainAddress in a Builder and retrieving it via asAddress
fun testStoreBasechainAddress() {
    let testHash = 987654321;
    let baseAddrStruct = newBasechainAddress(testHash);
    let b = beginCell();
    let b2 = b.storeBasechainAddress(baseAddrStruct);
    let s = b2.asSlice();
    let extractedAddr = s.asAddress(0); // interpret as basechain address
    require(extractedAddr == newAddress(0, testHash), "storeBasechainAddress did not store the correct address");
}

fun runDeepTests2() {
    testHasSameBasechainAddress();
    testContractAddressExtDifferentChain();
    testStoreBasechainAddress();
}
