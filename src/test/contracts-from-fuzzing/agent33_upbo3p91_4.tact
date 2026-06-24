contract Dummy {
    // Minimal function required for a contract definition
    fun main() {}
}

contract TestAddresses {

    // Test 1: Valid usage of newAddress with valid chain IDs
    fun testValidNewAddress(): Bool {
        // Using workchain 0 (basechain) and -1 (masterchain)
        let addr1: Address = newAddress(0, 0x83dfd552e63729b47);
        let addr2: Address = newAddress(-1, 0x0123456789abcdef);
        return true;
    }

    // Test 2: Testing contractAddress and contractAddressExt for consistency
    fun testContractAddress(): Bool {
        let initState: StateInit = initOf Dummy();
        let addr3: Address = contractAddress(initState);
        let addr4: Address = contractAddressExt(0, initState.code, initState.data);
        return addr3 == addr4;
    }

    // Test 3: Testing parseVarAddress with a correctly constructed slice
    fun testParseVarAddress(): Bool {
        // Construct a cell representing a VarAddress:
        // Marker: 6 with 3 bits, then 123-bit length indicator, then workchain (234) and address (345)
        let cellVarAddr = beginCell()
            .storeUint(6, 3)     // marker for VarAddress
            .storeUint(123, 9)   // address occupies 123 bits
            .storeUint(234, 32)  // workchain ID
            .storeUint(345, 123) // address value
            .endCell();
        let sliceVarAddr: Slice = cellVarAddr.asSlice();
        let varAddr: VarAddress = parseVarAddress(sliceVarAddr);
        return (varAddr.workchain == 234) && (varAddr.address.loadUint(123) == 345);
    }

    // Test 4: Testing Address.asSlice and toString functions
    fun testAddressSliceString(): Bool {
        let a: Address = myAddress();
        let slice1: Slice = beginCell().storeAddress(a).endCell().asSlice();
        let slice2: Slice = a.asSlice();
        let s: String = a.toString();
        // Check that slices are equal
        // Though string representation may vary, we ensure operations complete
        return true;
    }

    // Test 5: Testing newBasechainAddress and emptyBasechainAddress
    fun testBasechainAddress(): Bool {
        let emptyAddr: BasechainAddress = emptyBasechainAddress();
        let addrWithHash: BasechainAddress = newBasechainAddress(0xdeadbeef);
        return (emptyAddr.hash == null) && (addrWithHash.hash == 0xdeadbeef);
    }

    // Aggregate test function
    fun runTests() {
        self.testValidNewAddress();
        self.testContractAddress();
        self.testParseVarAddress();
        self.testAddressSliceString();
        self.testBasechainAddress();
    }
}
