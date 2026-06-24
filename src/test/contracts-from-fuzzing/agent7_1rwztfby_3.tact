contract SomeContract {}
contract Dummy1 {}
contract Dummy2 {}

// Test using newAddress for valid workchains
fun testNewAddress0(): Address {
    // Valid basechain address: workchain 0
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun testNewAddressM1(): Address {
    // Valid masterchain address: workchain -1
    return newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

// Test contractAddress functions
fun testContractAddress(): Bool {
    // Checks that contractAddress and contractAddressExt are consistent
    let s: StateInit = initOf SomeContract();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    return addr1 == addr2;
}

// Test BasechainAddress functionalities
fun testNewBasechainAddress(): BasechainAddress {
    // Create a new basechain address with a given hash
    return newBasechainAddress(0xabcdef);
}

fun testEmptyBasechainAddress(): Bool {
    // Verify that emptyBasechainAddress produces an address with a null hash
    let b: BasechainAddress = emptyBasechainAddress();
    return b.hash == null;
}

fun testContractBasechainAddress(): BasechainAddress {
    // Generate a basechain address derived from a contract's state initialization
    let s: StateInit = initOf Dummy1();
    return contractBasechainAddress(s);
}

// Test Address conversion methods
fun testAddressToString(): String {
    // Test the conversion of an Address to a String representation
    let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    return a.toString();
}

fun testAddressAsSlice(): Bool {
    // Ensure that storing and retrieving an address yields a consistent Slice representation
    let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    let s1: Slice = beginCell().storeAddress(a).asSlice();
    let s2: Slice = a.asSlice();
    return s1 == s2;
}

// Test comparison of StateInit's derived basechain address with a manually created address
fun testHasSameBasechainAddress(): Bool {
    let s: StateInit = initOf Dummy2();
    // Should return true if the provided address has the same basechain address as computed from the StateInit
    return s.hasSameBasechainAddress(newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8));
}
