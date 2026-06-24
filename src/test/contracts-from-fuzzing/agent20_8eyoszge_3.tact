// The following Tact code demonstrates a comprehensive fuzz-testing suite for contract addresses, covering multiple documented features and edge cases:

contract AddressFuzz {
    
    // Test 1: Valid usage of newAddress and conversion to string
    fun testNewAddressValid(): String {
        // Create a valid address on the basechain (chain id 0) using a typical 256-bit hash
        let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        return addr.toString();
    }

    // Test 2: Validate that contractAddress and contractAddressExt yield the same address
    fun testContractAddressEquality(): Bool {
        let s: StateInit = initOf AddressFuzz();
        let addr1: Address = contractAddress(s);
        let addr2: Address = contractAddressExt(0, s.code, s.data);
        return addr1 == addr2;
    }

    // Test 3: Validate that conversion from Address to Slice using asSlice() is consistent
    fun testAsSlice(): Bool {
        let addr: Address = newAddress(0, 0x789);
        let s1: Slice = beginCell().storeAddress(addr).asSlice();
        let s2: Slice = addr.asSlice();
        return s1 == s2;
    }

    // Test 4: Validate creation and properties of basechain addresses
    fun testBasechainAddresses(): Bool {
        let emptyAddr: BasechainAddress = emptyBasechainAddress();
        let nonEmptyAddr: BasechainAddress = newBasechainAddress(0xabc);
        return (emptyAddr.hash == null) && (nonEmptyAddr.hash != null);
    }

    // Test 5: Validate that forceBasechain accepts a valid basechain address
    fun testForceBasechain(): Bool {
        let valid: Address = newAddress(0, 0x123);
        forceBasechain(valid);
        return true;
    }

    // Test 6: Verify extension function hasSameBasechainAddress
    fun testHasSameBasechainAddress(): Bool {
        let s: StateInit = initOf AddressFuzz();
        // This test simply invokes the extension function; its outcome depends on the encoding inside s
        return s.hasSameBasechainAddress(newAddress(0, 0xdef));
    }

    // Test 7: Validate that forceBasechain fails (throws exit code 138) when given a masterchain address
    fun testForceBasechainFailure(): Bool {
        let masterchain: Address = newAddress(-1, 0x12345);
        try {
            forceBasechain(masterchain);
            // If no exception is thrown, the test fails
            return false;
        } catch (exitCode) {
            // According to documentation, exit code 138 'Not a basechain address' should be thrown
            return exitCode == 138;
        }
    }

    // Test 8: Construct an invalid standard address slice and verify that asAddress() triggers exit code 136
    fun testInvalidStandardAddress(): Bool {
        let basechainID: Int = 0;
        // Build a cell with an incorrect tag prefix (correct tag is 0b100; we use 0b101 to break it)
        let cellWithInvalidTag = beginCell()
            .storeUint(0b101, 3)     // Invalid prefix
            .storeInt(basechainID, 8)  // Valid chain id (0)
            .storeUint(0, 256)         // 256-bit account id (but together with wrong prefix, it is invalid)
            .endCell();
        let addrSlice: Slice = cellWithInvalidTag.asSlice();
        try {
            let _ : Address = addrSlice.asAddress(basechainID);
            return false; // should not succeed
        } catch (exitCode) {
            // Documentation specifies exit code 136 'Invalid standard address'
            return exitCode == 136;
        }
    }

    // Uncomment a main() function to run the tests during execution if desired
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
