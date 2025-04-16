contract FuzzAddress2 {
    // Test forceWorkchain with valid parameters: the address is in the workchain specified (0)
    fun test_forceWorkchain_valid() : Bool {
        let addr = newAddress(0, 0xABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890);
        // This should not throw since the workchain matches
        forceWorkchain(addr, 0, 593);
        return true;
    }

    // Test forceWorkchain with an invalid workchain: the address has workchain 0 but we force workchain -1
    fun test_forceWorkchain_invalid() : Bool {
        let addr = newAddress(0, 0xABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890);
        try {
            forceWorkchain(addr, -1, 593);
            return false; // If no exception, test fails
        } catch (exitCode) {
            return exitCode == 593;
        }
    }

    // Test masterchain address: newAddress with chain -1 should not be considered basechain
    fun test_masterchain() : Bool {
        let addr = newAddress(-1, 0x123456789ABCDEF123456789ABCDEF123456789ABCDEF123456789ABCDEF1234);
        try {
            forceBasechain(addr);
            return false; // Should throw an error
        } catch (exitCode) {
            return exitCode == 138;
        }
    }

    // Test reversibility of asSlice and asAddress: storing an address in a cell and reloading it
    fun test_asSlice_reversible() : Bool {
        let addr = newAddress(0, 0xFEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210);
        let slice = addr.asSlice();
        let addr2 = slice.asAddress(0);
        return addr == addr2;
    }

    // Test toString method: the output string should be non-empty
    fun test_toString_format() : Bool {
        let addr = newAddress(0, 0xDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF);
        let s = addr.toString();
        return s != "";
    }

    // Test parsing a standard address via parseStdAddress: roundtrip
    fun test_parseStdAddress() : Bool {
        let addr = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        let parsed = parseStdAddress(addr.asSlice());
        let addr2 = newAddress(parsed.workchain, parsed.address);
        return addr == addr2;
    }

    // Test parsing a variable-length address via parseVarAddress
    fun test_parseVarAddress() : Bool {
        let slice = beginCell()
            .storeUint(6, 3)     // Identifier for VarAddress
            .storeUint(123, 9)   // Dummy bit-length for the address field
            .storeUint(234, 32)  // workchain = 234
            .storeUint(345, 123) // the address value
            .endCell()
            .asSlice();
        let varAddr = parseVarAddress(slice);
        return (varAddr.workchain == 234) && (varAddr.address.loadUint(123) == 345);
    }
}
