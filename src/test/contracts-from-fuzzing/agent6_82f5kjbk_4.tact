contract TestAddressesFurtherFixed {
    // Additional tests to explore edge cases

    // Test newAddress with masterchain chain id (-1) using forceWorkchain correctly
    fun test_masterchain_with_forceWorkchain() : Int {
        let addr = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        // Correct use: expects workchain -1
        forceWorkchain(addr, -1, 593);
        return 0;
    }

    // Test updating BasechainAddress: create an empty basechain address and new basechain address with specific hash
    fun test_basechain_address_struct() : Bool {
        let emptyAddr = emptyBasechainAddress();
        let newAddr = newBasechainAddress(0x123456789abcdef);
        // Check that emptyAddr hash is null and newAddr hash is not null
        return (emptyAddr.hash == null) && (newAddr.hash != null);
    }

    // Test: compute contract hash and compare with newAddress
    fun test_contract_hash() : Bool {
        let s = initOf TestAddressesFurtherFixed();
        let hashVal = contractHash(s.code, s.data);
        let addr1 = newAddress(0, hashVal);
        let addr2 = contractAddress(s);
        return addr1 == addr2;
    }

    // Test parseVarAddress: convert an address slice to VarAddress, then rebuild standard address
    fun test_parse_var_address() : Bool {
        let a: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        // Using parseVarAddress to parse out a variable-length address
        let varAddr = parseVarAddress(a.asSlice());
        // Here, varAddr.address is a Slice; convert it to an Int (uint256) using loadUint
        let intVal: Int = varAddr.address.loadUint(256);
        let a2 = newAddress(varAddr.workchain, intVal);
        return a == a2;
    }
}
