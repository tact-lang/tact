contract DummyContract {
    // An empty dummy contract for testing contract address derivation
    // A minimal receive function to make it deployable
    receive() {}
}

contract FuzzAddressTests {
    dummyHash: Int = 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8;

    // Test 1: Valid newAddress using workchain 0
    fun testNewAddressValid0(): Int {
        let addr = newAddress(0, self.dummyHash);
        return 42;
    }

    // Test 2: Valid newAddress using masterchain (-1)
    fun testNewAddressValidNeg(): Int {
        let addr = newAddress(-1, self.dummyHash);
        return 42;
    }

    // Test 3: Address round-trip conversion: Address -> Slice -> Address (using the unsafe cast)
    fun testRoundTrip(): Int {
        let original: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        let s: Slice = original.asSlice();
        let converted: Address = s.asAddressUnsafe();
        require(original == converted, "Roundtrip failed");
        return 42;
    }

    // Test 4: toString conversion; the resulting string must be non-empty as documented
    fun testToString(): Int {
        let a: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        let s: String = a.toString();
        require(s != "", "Empty address String");
        return 42;
    }

    // Test 5: Contract address derivation consistency: contractAddress vs contractAddressExt using DummyContract
    fun testContractAddress(): Int {
        let s: StateInit = initOf DummyContract();
        let addr1: Address = contractAddress(s);
        let addr2: Address = contractAddressExt(0, s.code, s.data);
        require(addr1 == addr2, "Mismatch in contract address derivation");
        return 42;
    }

    // Test 6: Validate contractHash usage by comparing addresses computed via contractHash and contractAddressExt using DummyContract
    fun testContractHash(): Int {
        let s: StateInit = initOf DummyContract();
        let h: Int = contractHash(s.code, s.data);
        let addr1: Address = contractAddressExt(0, s.code, s.data);
        let addr2: Address = newAddress(0, h);
        require(addr1 == addr2, "Mismatch in contract hash derivation");
        return 42;
    }
}
