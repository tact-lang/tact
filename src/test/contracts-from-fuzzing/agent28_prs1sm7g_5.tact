contract TestNewAddressVariable {
    // Tests newAddress with a runtime-supplied chain ID.
    // According to documentation, if the chain is not provided as a compile-time constant,
    // the call should compile even if the value is not one of the two allowed (0 or -1).
    fun testVar(chain: Int): Address {
        return newAddress(chain, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    }
}

contract TestInvalidAsAddress {
    // Tests the behavior of asAddress on an invalid Slice.
    // The docs state that providing a Slice with an invalid layout or account id length
    // will throw an exception with exit code 136 ("Invalid standard address").
    fun testInvalid(): Address {
        // Create an intentionally malformed slice using rawSlice.
        // "abcd" in hex is likely too short to represent a valid standard address.
        let s: Slice = rawSlice("abcd");
        // The conversion should fail at runtime.
        return s.asAddress(0);
    }
}

contract TestEmptySliceParse {
    // Tests the behavior of parseStdAddress on an empty slice.
    // According to documentation, passing a slice that does not have the full layout
    // of a StdAddress should result in a "Cell underflow" error with exit code 9.
    fun testEmpty(): Int {
        // Create an empty cell slice.
        let s: Slice = beginCell().endCell().asSlice();
        // This call is expected to throw at runtime due to insufficient data
        let _ : StdAddress = parseStdAddress(s);
        return 1;
    }
}

contract TestAddressToString {
    // Tests the Address.toString function which should convert the address to its String representation.
    fun testToString(): String {
        let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        return a.toString();
    }
}

contract TestRoundtripConversion {
    // Tests roundtrip address conversion: Address -> Slice -> StdAddress -> newAddress
    fun testConversion(): Bool {
        // Use a compile-time literal address via the address() function.
        let a: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        let parsed: StdAddress = parseStdAddress(a.asSlice());
        let a2: Address = newAddress(parsed.workchain, parsed.address);
        return a == a2;
    }
}

contract TestForceWorkchainVariable {
    // Tests forceWorkchain with a runtime-supplied expected workchain.
    // The function should only pass if the actual chain matches the expected value.
    fun testForce(chainExpected: Int): Int {
        let a: Address = newAddress(chainExpected, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        // This call will throw at runtime if the actual chain does not equal chainExpected.
        forceWorkchain(a, chainExpected, 593);
        return 1;
    }
}
