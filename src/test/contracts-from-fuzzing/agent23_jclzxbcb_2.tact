contract DummyA {}
contract DummyB {}
contract DummyC {}

contract TestValidFunctions {
    // Test 1: Valid newAddress usage using a valid workchain (0)
    fun testNewAddressValid() {
        let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    }

    // Test 2: Valid newAddress usage using masterchain workchain (-1) with a valid 256-bit hash (64 hex digits)
    fun testNewAddressMaster() {
        let addr: Address = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    }

    // Test 3: Boundary test: using a different 256-bit hash literal
    fun testNewAddressBoundary() {
        let addr0: Address = newAddress(0, 0x123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0);
    }

    // Test 4: Convert Address to Slice and back using asSlice and asAddressUnsafe
    fun testSliceConversion() {
        let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        let s: Slice = addr.asSlice();
        let addr2: Address = s.asAddressUnsafe();
        let _check: Bool = addr == addr2;
    }

    // Test 5: BasechainAddress utilities
    fun testBasechainAddresses() {
        let emptyAddr: BasechainAddress = emptyBasechainAddress();
        let nonEmptyAddr: BasechainAddress = newBasechainAddress(0x83dfd552);

        let s: StateInit = initOf DummyB();
        let contractBAddr: BasechainAddress = contractBasechainAddress(s);
    }

    // Test 6: Compare addresses obtained by contractAddress and contractAddressExt
    fun compareAddresses(): Bool {
        let s: StateInit = initOf DummyC();
        let a1: Address = contractAddress(s);
        let a2: Address = contractAddressExt(0, s.code, s.data);
        return a1 == a2;
    }
}
