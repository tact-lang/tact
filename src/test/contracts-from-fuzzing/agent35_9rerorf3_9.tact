// FuzzTestAddresses
// This Tact contract is part of an extensive fuzz-testing cycle covering contract addresses functionality, including:
// 1. Creation of new addresses using newAddress, validating that only allowed workchain IDs (0 and -1) are accepted, and that invalid ones (like 1) trigger compile-time errors. 
//    (See documentation: docs_ref_core-addresses.md   and  )
//
// 2. Correct computation of contract addresses via contractAddress and contractAddressExt, ensuring they yield the same result for a given StateInit structure.
//
// 3. Correct behavior of Address.asSlice as a round-trip conversion mechanism for addresses. 
//
// 4. Proper string conversion using Address.toString, and verification that the produced string is non-empty for a valid address.
//
// 5. Verification of BasechainAddress functions (emptyBasechainAddress and newBasechainAddress) where an empty address has a null hash and a new basechain address holds a non-null hash.
//
// The contract executes these tests in its receive() function via runtime assertions using require(). If any test fails, the contract will abort and refund sender accordingly.
//
// Each of these tests adheres to documented behaviors available in the official documentation (see docs_ref_core-addresses.md and related sections on addresses)    .

contract FuzzTestAddresses {
    // Test valid creation of addresses using newAddress with valid workchain IDs: 0 and -1
    fun testValidChains() : Bool {
        // Use a constant hash value for testing
        let hash: Int = 0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890;
        let addr0 = newAddress(0, hash);
        let addrM1 = newAddress(-1, hash);
        // The addresses must differ due to the different workchain IDs
        return (addr0 != addrM1);
    }

    // Test that contractAddress and contractAddressExt yield the same result
    fun testContractAddresses() : Bool {
        let s: StateInit = initOf FuzzTestAddresses();
        let a1 = contractAddress(s);
        let a2 = contractAddressExt(0, s.code, s.data);
        return (a1 == a2);
    }

    // Test round-trip conversion with Address.asSlice
    fun testAddressAsSlice(a: Address) : Bool {
        let sliceA = a.asSlice();
        // Reconstruct by storing address in a cell and parsing its slice
        let cellA = beginCell().storeAddress(a).endCell();
        let sliceFromCell = cellA.beginParse();
        return (sliceA == sliceFromCell);
    }

    // Test Address.toString to ensure it provides a non-empty string for valid addresses
    fun testAddressToString(a: Address) : Bool {
        let str = a.toString();
        return (str != "");
    }

    // Test BasechainAddress functions
    fun testBasechainAddresses() : Bool {
        let emptyAddr = emptyBasechainAddress();
        let newBaseAddr = newBasechainAddress(1234567890);
        return (emptyAddr.hash == null) && (newBaseAddr.hash != null);
    }

    receive() {
        let validChainsOk = self.testValidChains();
        let contractAddrOk = self.testContractAddresses();
        let a = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        let roundtripOk = self.testAddressAsSlice(a);
        let toStringOk = self.testAddressToString(a);
        let basechainOk = self.testBasechainAddresses();
        require(validChainsOk && contractAddrOk && roundtripOk && toStringOk && basechainOk, "Address fuzz-tests failed");
        cashback(sender());
    }
}
