contract DummyA {}
contract DummyB {}

contract TestAddressChain {
    // Test: Using a variable for the chain value in contractAddressExt
    // This should compile and use the runtime value of 'chain'.
    fun testChainVar(chain: Int) {
         let s: StateInit = initOf DummyA();
         let _ : Address = contractAddressExt(chain, s.code, s.data);
    }

    // Test: Compare addresses computed with chain 0 vs chain -1
    // According to documentation, contractAddress(s) uses chain 0.
    // So if we compute address with chain -1, they should differ.
    fun compareChainAddresses() : Bool {
         let s: StateInit = initOf DummyB();
         let addr0: Address = contractAddress(s);
         let addrNon0: Address = contractAddressExt(-1, s.code, s.data);
         return addr0 == addrNon0;  // Expected: false
    }

    // Test: toString conversion of an address
    fun testToString() {
         let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         let str: String = addr.toString();
         // No explicit equality check; just ensuring compilation and runtime conversion
    }
}

// Test: Multiple assignments and equality of Address type
fun testMultipleAssignments() {
    let addr1: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    let addr2: Address = addr1;
    let _check: Bool = (addr1 == addr2);
}
