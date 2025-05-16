contract AllAddressTests {

    // Test 1: Roundtrip conversion between Address to Slice and back using asAddressUnsafe
    fun testAddressRoundtrip() : Bool {
        let original: Address = newAddress(0, 0xcafebabe);
        let s: Slice = original.asSlice();
        let restored: Address = s.asAddressUnsafe();
        return original == restored;
    }

    // Test 2: Test address chain mismatch: addresses with same hash but different chain ids must not be equal
    fun testAddressChainMismatch() : Bool {
        let a: Address = newAddress(0, 0x123456);
        let b: Address = newAddress(-1, 0x123456);
        return a != b;
    }

    // Test 3: Test toString formatting ensuring non-empty string representation
    fun testAddressToStringFormat() : Bool {
         let a: Address = newAddress(0, 0xf00d);
         let s: String = a.toString();
         return s != "";
    }

    // Test 4: Persistent state test combining update and roundtrip conversion
    stored: Address = newAddress(0, 0);

    init() {
        // Initialize stored with an address
        self.stored = newAddress(0, 0x1111);
    }

    fun updateStored(newHash: Int) {
        self.stored = newAddress(0, newHash);
    }

    fun testComplexAddress() : Bool {
        self.updateStored(0x2222);
        let s: Slice = self.stored.asSlice();
        let restored: Address = s.asAddressUnsafe();
        return self.stored == restored;
    }

    // Test 5: Testing inequality of addresses constructed with different hash values
    fun testAddressInequality() : Bool {
        let a: Address = newAddress(0, 0xAAAABBBB);
        let b: Address = newAddress(0, 0xEEEEFFFF);
        return a != b;
    }

    // Combined getter to run all tests
    get fun runAllTests() : Bool {
        return self.testAddressRoundtrip() &&
               self.testAddressChainMismatch() &&
               self.testAddressToStringFormat() &&
               self.testComplexAddress() &&
               self.testAddressInequality();
    }
}
