contract TestAddresses {
    // Test forceBasechain with a valid basechain address (chain id 0).
    fun test_valid_force_basechain() : Int {
        let addr = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        // Should not throw
        forceBasechain(addr);
        return 0;
    }

    // Test forceBasechain with an invalid address (chain id -1), expecting exit code 138.
    fun test_invalid_force_basechain() : Int {
        let addr = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        try {
            forceBasechain(addr);
            return -1; // should not reach here
        } catch (exitCode) {
            return exitCode; // expected exit code 138
        }
    }

    // Test forceWorkchain with matching workchain parameter; should pass quietly.
    fun test_force_workchain_correct() : Int {
        let addr0 = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        forceWorkchain(addr0, 0, 593);
        return 0;
    }

    // Test forceWorkchain with a mismatch: address chain id is 0, but expected workchain -1; should error with code 593.
    fun test_force_workchain_error() : Int {
        let addr0 = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        try {
            forceWorkchain(addr0, -1, 593);
            return -1; // should not happen
        } catch (exitCode) {
            return exitCode; // expected exit code 593
        }
    }

    // Test conversion of Address to String using toString extension
    fun test_address_to_string() : Bool {
        let a: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        let s: String = a.toString();
        return (s == "EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
    }

    // Test Address.asSlice: compare the slice from explicit storage and the extension function
    fun test_address_as_slice() : Bool {
        let a: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        let s1: Slice = beginCell().storeAddress(a).asSlice();
        let s2: Slice = a.asSlice();
        return s1 == s2;
    }

    // Test equality of addresses computed via contractAddress and contractAddressExt
    fun test_contract_address_equality() : Bool {
        let s = initOf TestAddresses();
        let a1 = contractAddress(s);
        let a2 = contractAddressExt(0, s.code, s.data);
        return a1 == a2;
    }

    // Test parseStdAddress by converting an address slice to StdAddress and back
    fun test_parse_std_address() : Bool {
        let a : Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        let parsed = parseStdAddress(a.asSlice());
        let a2 = newAddress(parsed.workchain, parsed.address);
        return a == a2;
    }
}
