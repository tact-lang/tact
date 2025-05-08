contract Dummy {}

contract TestForceBaseAndWorkchain {
    // Test the global function forceBasechain, which checks that the given address is on the basechain (chain ID 0).
    fun testForceBasechain() : Bool {
        let base: Address = newAddress(0, 0);
        // This call should pass without error
        forceBasechain(base);
        
        // Now, create a masterchain address and attempt to force it to basechain; it must throw error exit code 138
        try {
            let master: Address = newAddress(-1, 0);
            forceBasechain(master);
            // If no exception, then it's a bug
            return false;
        } catch (exitCode) {
            return exitCode == 138;
        }
    }

    // Test the global function forceWorkchain, which checks that the address's chain matches the specified workchain parameter.
    fun testForceWorkchain() : Bool {
        let a: Address = newAddress(0, 0);
        // This call should pass because a is in workchain 0
        forceWorkchain(a, 0, 593);
        
        // Now, force a mismatch: a is from basechain (0) but we expect -1; this should throw with error code 593
        try {
            forceWorkchain(a, -1, 593);
            return false; // if no exception, it's an error
        } catch (exitCode) {
            return exitCode == 593;
        }
    }
}

contract TestStdAndVarAddressParsing {
    // Test parsing of standard addresses with parseStdAddress
    fun testStdAddressParsing() : Bool {
        let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
        let s: Slice = a.asSlice();
        let parsed = parseStdAddress(s);
        let a2: Address = newAddress(parsed.workchain, parsed.address);
        return a == a2;
    }

    // Test parsing of variable-length addresses with parseVarAddress
    fun testVarAddressParsing() : Bool {
        let workchain: Int = 234;
        let bitlen: Int = 123;
        let addrVal: Int = 345;
        // Construct a cell representing a VarAddress
        let builder = beginCell()
            .storeUint(6, 3)      // indicator for VarAddress
            .storeUint(bitlen, 9)   // bit length of address
            .storeUint(workchain, 32)  // workchain ID
            .storeUint(addrVal, bitlen); // address value
        let s: Slice = builder.endCell().asSlice();
        let varAddr = parseVarAddress(s);
        // Verify that the parsed workchain matches and that loading the specified number of bits from varAddr.address gives the original addrVal
        return (varAddr.workchain == workchain) && (varAddr.address.loadUint(bitlen) == addrVal);
    }
}

contract TestContractAddressEquality {
    // Test that contractAddress(s) equals contractAddressExt(0, s.code, s.data)
    fun testEquality() : Bool {
        let s: StateInit = initOf Dummy();
        let a1: Address = contractAddress(s);
        let a2: Address = contractAddressExt(0, s.code, s.data);
        return a1 == a2;
    }
}
