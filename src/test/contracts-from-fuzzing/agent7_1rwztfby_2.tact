contract SomeContract {}
contract Dummy1 {}
contract Dummy2 {}

fun testNewAddress0(): Address {
    // Valid basechain (0)
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun testNewAddressM1(): Address {
    // Valid masterchain (-1)
    return newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun testContractAddress(): Bool {
    // Test that contractAddress and contractAddressExt produce identical addresses for a contract
    let s: StateInit = initOf SomeContract();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    return addr1 == addr2;
}

fun testNewBasechainAddress(): BasechainAddress {
    // Create a new basechain address with a given hash
    return newBasechainAddress(0xabcdef);
}

fun testEmptyBasechainAddress(): Bool {
    // Test that emptyBasechainAddress creates an address with a null hash
    let b: BasechainAddress = emptyBasechainAddress();
    return b.hash == null;
}

fun testContractBasechainAddress(): BasechainAddress {
    // Generate a basechain address from a contract's StateInit
    let s: StateInit = initOf Dummy1();
    return contractBasechainAddress(s);
}

fun testAddressToString(): String {
    // Test conversion of Address to String using the gas-expensive toString extension
    let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    return a.toString();
}

fun testAddressAsSlice(): Bool {
    // Test that converting an Address to a Slice via two methods is consistent
    let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    let s1: Slice = beginCell().storeAddress(a).asSlice();
    let s2: Slice = a.asSlice();
    return s1 == s2;
}

fun testHasSameBasechainAddress(): Bool {
    // Test the hasSameBasechainAddress extension function for StateInit
    let s: StateInit = initOf Dummy2();
    return s.hasSameBasechainAddress(newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8));
}
