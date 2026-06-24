contract AddressFuzz {
    // Test 8: Validate that forceBasechain fails for a masterchain address
    fun testForceBasechainFailure(): Bool {
        let masterchain: Address = newAddress(-1, 0x12345);
        try {
            forceBasechain(masterchain);
            // If no exception, then test fails
            return false;
        } catch (exitCode) {
            // Expected exit code 138 for non-basechain address
            return exitCode == 138;
        }
    }

    // Test 9: Construct an invalid standard address slice and verify that asAddress() triggers exit code 136
    fun testInvalidStandardAddress(): Bool {
        let basechainID: Int = 0;
        // Build a cell with an incorrect tag prefix (valid prefix is 0b100, we use 0b101 here)
        // Also, ensure the total bits do not match the expected 267 bits
        let cellWithInvalidTag = beginCell()
            .storeUint(0b101, 3)     // invalid prefix: expected 0b100
            .storeInt(basechainID, 8)  // valid chain id for basechain
            // Provide 256 bits (valid) but the tag is wrong
            .storeUint(0, 256)
            .endCell();
        let addrSlice: Slice = cellWithInvalidTag.asSlice();
        try {
            // This should throw because the slice doesn't represent a valid standard address
            let _ : Address = addrSlice.asAddress(basechainID);
            return false;
        } catch (exitCode) {
            return exitCode == 136;
        }
    }

    // For completeness, include previously defined tests
    fun testNewAddressValid(): String {
        // Create a valid address on the basechain (chain id 0) with a typical 256-bit hash
        let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        return addr.toString();
    }

    fun testContractAddressEquality(): Bool {
        let s: StateInit = initOf AddressFuzz();
        let addr1: Address = contractAddress(s);
        let addr2: Address = contractAddressExt(0, s.code, s.data);
        return addr1 == addr2;
    }

    fun testAsSlice(): Bool {
        let addr: Address = newAddress(0, 0x789);
        let s1: Slice = beginCell().storeAddress(addr).asSlice();
        let s2: Slice = addr.asSlice();
        return s1 == s2;
    }

    fun testBasechainAddresses(): Bool {
        let empty: BasechainAddress = emptyBasechainAddress();
        let nonEmpty: BasechainAddress = newBasechainAddress(0xabc);
        return (empty.hash == null) && (nonEmpty.hash != null);
    }

    fun testForceBasechain(): Bool {
        let valid: Address = newAddress(0, 0x123);
        forceBasechain(valid);
        return true;
    }

    fun testHasSameBasechainAddress(): Bool {
        let s: StateInit = initOf AddressFuzz();
        return s.hasSameBasechainAddress(newAddress(0, 0xdef));
    }

    // Uncomment the following main function to run all tests during execution
    // fun main() {
    //     assert(testNewAddressValid() != "");
    //     assert(testContractAddressEquality());
    //     assert(testAsSlice());
    //     assert(testBasechainAddresses());
    //     assert(testForceBasechain());
    //     assert(testHasSameBasechainAddress());
    //     assert(testForceBasechainFailure());
    //     assert(testInvalidStandardAddress());
    // }
}
