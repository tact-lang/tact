contract Dummy {
    init() {}
}

fun test_valid_newAddress(): Address {
    // Valid newAddress with workchain 0
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun test_contractAddress(): Address {
    // Compute address using contractAddress from StateInit of Dummy
    let s: StateInit = initOf Dummy();
    return contractAddress(s);
}

fun test_contractAddressExt(): Address {
    // Compute address using contractAddressExt with workchain 0
    let s: StateInit = initOf Dummy();
    return contractAddressExt(0, s.code, s.data);
}

fun test_toString(): String {
    // Convert an address to string
    let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    return a.toString();
}

fun test_asSlice(): Bool {
    // Compare conversions of an address to a slice
    let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    return beginCell().storeAddress(a).asSlice() == a.asSlice();
}

fun test_emptyBasechainAddress(): Bool {
    // Verify that an empty basechain address has a null hash
    let e: BasechainAddress = emptyBasechainAddress();
    return e.hash == null;
}

fun test_newBasechainAddress(): Bool {
    // Create a new basechain address with hash value 42 and check
    let b: BasechainAddress = newBasechainAddress(42);
    return b.hash == 42;
}
