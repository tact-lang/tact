contract TestAddressAsSliceConversion {
    fun testRoundtrip(): Bool {
        let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        let s: Slice = addr.asSlice();
        let parsed: StdAddress = parseStdAddress(s);
        let addr2: Address = newAddress(parsed.workchain, parsed.address);
        return addr == addr2;
    }
}

contract TestEmptyBasechainAddress {
    // Test that emptyBasechainAddress returns a BasechainAddress with null hash
    fun testEmpty(): Bool {
        let emptyAddr: BasechainAddress = emptyBasechainAddress();
        return emptyAddr.hash == null;
    }
}

contract TestNewBasechainAddress {
    // Test newBasechainAddress with a given hash value
    fun testNewBasechain(): Bool {
        let hashVal: Int = 0x123456789abcdef;
        let base: BasechainAddress = newBasechainAddress(hashVal);
        return base.hash != null && base.hash == hashVal;
    }
}

contract TestParseVarAddressValid {
    // Construct a valid VarAddress slice and parse it.
    // Using the documented order: store 3 bits (discriminator=6), then 9 bits for address length,
    // then 32 bits for workchain, then account id bits of specified length.
    fun testValid(): Bool {
        let cell = beginCell()
            .storeUint(6, 3)      // discriminator for VarAddress
            .storeUint(123, 9)    // address length = 123 bits
            .storeUint(234, 32)   // workchain id
            .storeUint(345, 123)  // account id
            .endCell();
        let s: Slice = cell.asSlice();
        let varAddr = parseVarAddress(s);
        if (varAddr.workchain != 234) {
            return false;
        }
        if (varAddr.address.loadUint(123) != 345) {
            return false;
        }
        return true;
    }
}

contract TestParseVarAddressInvalid {
    // Test parseVarAddress with an insufficient slice (expected to throw at runtime)
    fun testInvalid(): Int {
        let s: Slice = beginCell().storeUint(6, 3).endCell().asSlice();
        let _ : VarAddress = parseVarAddress(s);
        return 1;
    }
}

contract TestForceWorkchainVariable {
    // Test forceWorkchain with a runtime-supplied expected workchain
    fun testForce(chainExpected: Int): Int {
        let a: Address = newAddress(chainExpected, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        forceWorkchain(a, chainExpected, 593);
        return 1;
    }
}
