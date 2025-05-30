contract SomeContract {}

fun test_contract_address(): Address {
    let s: StateInit = initOf SomeContract();
    return contractAddress(s);
}

fun test_contract_address_ext(): Address {
    let s: StateInit = initOf SomeContract();
    return contractAddressExt(0, s.code, s.data);
}

fun test_asSlice_toString(a: Address): Bool {
    let s1: Slice = a.asSlice();
    let s2: Slice = beginCell().storeAddress(a).asSlice();
    return s1 == s2;
}

fun test_basechain_address(): BasechainAddress {
    return newBasechainAddress(0xdeadbeef);
}
