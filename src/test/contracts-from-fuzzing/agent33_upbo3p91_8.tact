contract Dummy {
    // Minimal contract definition needed for initOf
    fun main() {}
}

contract TestVarAddressUnderflow {
    // This function attempts to parse an incomplete slice representing a VarAddress.
    // It should fail with an exception carrying exit code 9 (Cell underflow).
    fun test(): Bool {
        // Construct a cell that's too short for a VarAddress: only the marker (3 bits) and no further data
        let cellShort = beginCell()
            .storeUint(6, 3) // marker for VarAddress
            .endCell();
        let sliceShort: Slice = cellShort.asSlice();
        try {
            let _ = parseVarAddress(sliceShort);
            // If parseVarAddress succeeds (which it shouldn't), return false
            return false;
        } catch (exitCode) {
            return exitCode == 9;
        }
    }
}

contract TestAddressComprehensive {

    // Test 1: Valid creation of addresses with newAddress using workchain 0 and -1
    fun testValidNewAddress(): Bool {
        let addr1: Address = newAddress(0, 0x83dfd552e63729b47);
        let addr2: Address = newAddress(-1, 0x0123456789abcdef);
        return true;
    }

    // Test 2: Ensure contractAddress and contractAddressExt produce the same address
    fun testContractAddressConsistency(): Bool {
        let initState: StateInit = initOf Dummy();
        let addrA: Address = contractAddress(initState);
        let addrB: Address = contractAddressExt(0, initState.code, initState.data);
        return addrA == addrB;
    }

    // Test 3: Validity of parseVarAddress with a properly encoded VarAddress
    fun testParseVarAddressValid(): Bool {
        // Construct a cell representing a valid VarAddress:
        // Store marker (3 bits), length (9 bits), then workchain (32 bits) and address (123 bits)
        let cellVarAddr = beginCell()
            .storeUint(6, 3)     // marker for VarAddress
            .storeUint(123, 9)   // length of address in bits
            .storeUint(234, 32)  // workchain ID
            .storeUint(345, 123) // address value
            .endCell();
        let sliceVarAddr: Slice = cellVarAddr.asSlice();
        let varAddr: VarAddress = parseVarAddress(sliceVarAddr);
        return (varAddr.workchain == 234) && (varAddr.address.loadUint(123) == 345);
    }

    // Test 4: Roundtrip conversion: Address -> Slice -> Address
    fun testAddressRoundtrip(): Bool {
        let a: Address = newAddress(0, 42);
        let slice: Slice = a.asSlice();
        let a2: Address = slice.asAddressUnsafe();
        return a == a2;
    }

    // Test 5: Verify Address.asSlice and toString do not produce errors
    fun testAddressSliceAndToString(): Bool {
        let a: Address = myAddress();
        let sliceFromCell: Slice = beginCell().storeAddress(a).endCell().asSlice();
        let sliceDirect: Slice = a.asSlice();
        let s: String = a.toString();
        // If no runtime error, return true
        return true;
    }

    // Test 6: Test basechain address utility functions
    fun testBasechainAddressUtil(): Bool {
        let emptyAddr: BasechainAddress = emptyBasechainAddress();
        let addrWithHash: BasechainAddress = newBasechainAddress(0xdeadbeef);
        return (emptyAddr.hash == null) && (addrWithHash.hash == 0xdeadbeef);
    }

    // Aggregate function to run all tests
    fun runAllTests() {
        self.testValidNewAddress();
        self.testContractAddressConsistency();
        self.testParseVarAddressValid();
        self.testAddressRoundtrip();
        self.testAddressSliceAndToString();
        self.testBasechainAddressUtil();
    }
}
