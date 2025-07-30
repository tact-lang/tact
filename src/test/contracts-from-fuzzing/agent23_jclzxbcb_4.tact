contract DummyD {}

contract TestAddressAdvanced {

    // Test 7: Using runtime arithmetic in computing the hash for newAddress
    fun testDynamicNewAddress() {
        // Compute a dynamic hash value using arithmetic, though such arithmetic might be resolved at runtime
        let part1: Int = 0x83dfd552e63729b472fcbcc8c45ebcc6;
        let part2: Int = 0x691702558b68ec7527e1ba403a0f31a8;
        let dynamicHash: Int = part1 + part2; // not bitwise concatenation, but arithmetic addition
        let addr: Address = newAddress(0, dynamicHash);
    }

    // Test 8: Using runtime arithmetic in the parameter for newBasechainAddress
    fun testDynamicBasechainAddress() {
        let a: Int = 0x83dfd552;
        let b: Int = 10;
        let dynamicHash: Int = a + b; // simple arithmetic
        let baseAddr: BasechainAddress = newBasechainAddress(dynamicHash);
    }

    // Test 9: Ternary operator with Address values to test conditional merging
    fun testTernaryAddress(cond: Bool) {
        let addr1: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        let addr2: Address = newAddress(0, 0x123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0);
        let addr: Address = cond ? addr1 : addr2;
        // Use the address in a dummy way
        let _ : Slice = addr.asSlice();
    }

    // Test 10: Mixing dynamic runtime value for chain parameter in contractAddressExt
    fun testDynamicChain(chain: Int) {
         let s: StateInit = initOf DummyD();
         // Accept any chain value, compile-time resolution not required
         let addr: Address = contractAddressExt(chain, s.code, s.data);
         let _ : String = addr.toString();
    }

    // Test 11: Nested expressions involving Address conversion
    fun testNestedConversions() {
         let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         // Convert to Slice and then back to Address, then to String
         let addrReconstructed: Address = addr.asSlice().asAddressUnsafe();
         let str: String = addrReconstructed.toString();
    }
}

// Test 12: Multiple conditional assignments involving Address equality
fun testConditionalEquality(cond: Bool) {
    let addr1: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    let addr2: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    let addr3: Address = newAddress(0, 0x123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0);
    let chosen: Address = cond ? (addr1 == addr2 ? addr1 : addr3) : addr3;
    let _ : Bool = (chosen == addr1);
}
