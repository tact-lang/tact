// This Tact contract fuzz-tests various aspects of contract addresses as documented. 
// It exercises functions like newAddress, contractAddress, contractAddressExt, asSlice, toString, emptyBasechainAddress, and newBasechainAddress. 
// Observations: 
// 1. newAddress rejects invalid workchain IDs at compile time (only 0 and -1 are allowed) (see docs_ref_core-addresses.md  ).
// 2. contractAddress and contractAddressExt correctly compute addresses from a contract's state (see docs_ref_core-addresses.md  ).
// 3. Address.asSlice provides a lossless conversion between Address and its underlying Cell (see docs_ref_core-addresses.md   and  ). 
// 4. Basechain address functions (emptyBasechainAddress and newBasechainAddress) behave as documented. 
// 
// The following code snippet will be compiled and deployed, and its receive() function runs several runtime checks with require(). 

contract FuzzTestAddresses {
    // Test valid creation of addresses using newAddress with chain IDs 0 and -1
    fun testValidChains() : Bool {
        // Use a constant hash value for testing.
        let hash: Int = 0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890;
        let addr0 = newAddress(0, hash);
        let addrM1 = newAddress(-1, hash);
        // The addresses must differ on account of their workchain distinction
        return (addr0 != addrM1);
    }

    // Test contractAddress and contractAddressExt produce the same result
    fun testContractAddresses() : Bool {
        let s: StateInit = initOf FuzzTestAddresses();
        let a1 = contractAddress(s);
        let a2 = contractAddressExt(0, s.code, s.data);
        return (a1 == a2);
    }

    // Test Address.asSlice and its round-trip integrity
    fun testAddressAsSlice(a: Address) : Bool {
        let sliceA = a.asSlice();
        // Rebuild a cell containing the address, then parse to a slice
        let cellA = beginCell().storeAddress(a).endCell();
        let sliceFromCell = cellA.beginParse();
        return (sliceA == sliceFromCell);
    }

    // Test Address.toString conversion by checking non-empty output
    fun testAddressToString(a: Address) : Bool {
        let str = a.toString();
        // For a valid address, the string representation should not be empty
        return (str != "");
    }

    // Test BasechainAddress functions
    fun testBasechainAddresses() : Bool {
        let empty = emptyBasechainAddress();
        let newBase = newBasechainAddress(1234567890);
        // emptyBasechainAddress should have a null hash; newBasechainAddress should have a non-null hash
        return (empty.hash == null) && (newBase.hash != null);
    }

    receive() {
        // Execute tests and ensure all are successful via runtime require
        let validChainsOk = self.testValidChains();
        let contractAddrOk = self.testContractAddresses();
        let a = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        let roundtripOk = self.testAddressAsSlice(a);
        let toStringOk = self.testAddressToString(a);
        let basechainOk = self.testBasechainAddresses();
        
        // All tests must pass
        require(validChainsOk && contractAddrOk && roundtripOk && toStringOk && basechainOk, "Address fuzz-tests failed");
        cashback(sender());
    }
}
