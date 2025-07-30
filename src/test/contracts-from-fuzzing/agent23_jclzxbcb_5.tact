contract TestAddressCell {
    // Test 13: Store an Address in a Cell and load it back
    fun testCellConversion() {
         let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         let cell: Cell = beginCell().storeAddress(addr).endCell();
         let slice: Slice = cell.beginParse();
         let addr2: Address = slice.loadAddress();
         // Check that the loaded address equals the original
         let _check: Bool = addr == addr2;
    }
}

contract TestAddressComplex {
    // Test 14: Using the address() function to parse a string literal into an Address
    // Assuming the built-in 'address' function exists and is used to decode a base64url-like string
    fun testFromString() {
         let addrFromStr: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
         let str: String = addrFromStr.toString();
         // The string conversion should be reversible (or at least valid), here we simply convert
    }

    // Test 15: Multiple chained conversions and conditionals
    fun testChainedOperations(cond: Bool) {
         let addr1: Address = newAddress(0, 0x123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0);
         let addr2: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         // Chain conversion: Address -> Slice -> Address -> String
         let addrReconstructed: Address = addr1.asSlice().asAddressUnsafe();
         let str1: String = addrReconstructed.toString();
         // Use ternary operator with addresses
         let chosen: Address = cond ? addr1 : addr2;
         let strChosen: String = chosen.toString();
         let _ : Bool = (chosen == addr1) || (chosen == addr2);
    }

    // Test 16: Dynamic computation of a hash for newAddress with bitwise operations
    fun testBitwiseHash(offset: Int) {
         // Compute dynamic hash by XORing a constant with the offset
         let baseHash: Int = 0x83dfd552e63729b472fcbcc8c45ebcc6;
         let dynamicHash: Int = baseHash ^ offset; // XOR operation
         let addr: Address = newAddress(0, dynamicHash);
         let _ : String = addr.toString();
    }

    // Test 17: Combining contract-based address computation and asSlice conversion
    fun testContractAndSlice() {
         let s: StateInit = initOf TestAddressComplex();
         let computed: Address = contractAddress(s);
         let slice: Slice = computed.asSlice();
         let backAddress: Address = slice.asAddressUnsafe();
         let _ : Bool = computed == backAddress;
    }
}
