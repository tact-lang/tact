contract TestAddressValidChains {
    // Test creation of a new Address with valid chain IDs: 0 and -1
    // Using a constant 256-bit hash value for both cases
    fun testValidChains() : Bool {
        let hash: Int = 0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890;
        let addr0 = newAddress(0, hash);
        let addrM1 = newAddress(-1, hash);
        // The addresses should be different because of different workchain IDs
        return (addr0 != addrM1);
    }
    
    // Test converting an Address to Slice and back via asSlice utilization
    fun testAddressRoundtrip(a: Address) : Bool {
         let sliceA = a.asSlice();
         // Store the address into a cell and load it back as a Slice
         let cellA = beginCell().storeAddress(a).endCell();
         let sliceFromCell = cellA.beginParse();
         return (sliceA == sliceFromCell);
    }
    
    // Test BasechainAddress functions: emptyBasechainAddress and newBasechainAddress
    fun testBasechainAddresses() : Bool {
         let emptyAddr = emptyBasechainAddress();
         let newAddr = newBasechainAddress(1234567890);
         return (emptyAddr.hash == null) && (newAddr.hash != null);
    }
    
    receive() {
         let ok1 = self.testValidChains();
         let a = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         let ok2 = self.testAddressRoundtrip(a);
         let ok3 = self.testBasechainAddresses();
         // Use require to ensure all tests pass at runtime (if any fails, contract will fail)
         require(ok1 && ok2 && ok3, "tests failed");
         cashback(sender());
    }
}
