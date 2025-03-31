contract SomeContract {
    receive() {}
}

fun test_address_round_trip(): Int {
    let orig: Address = newAddress(0, 42);
    let slice: Slice = orig.asSlice();
    let addr2: Address = slice.asAddressUnsafe();
    if (orig.toString() != addr2.toString()) { return 1; }
    return 0;
}

fun test_masterchain_address(): Int {
    let s: StateInit = initOf SomeContract();
    let a: Address = contractAddressExt(-1, s.code, s.data);
    return 0;
}

fun test_big_basechain_address(): Int {
    let b: BasechainAddress = newBasechainAddress(0xFFFFFFFFFFFFFFFF);
    if (b.hash == null) { return 1; }
    return 0;
}

fun test_field_assignment(): Int {
    let addr: Address = newAddress(0, 42);
    let cell: Slice = addr.asSlice();
    let addr2: Address = cell.asAddressUnsafe();
    if (addr.toString() != addr2.toString()) { return 1; }
    return 0;
}

fun run_all(): Int {
    let r1 = test_address_round_trip();
    let r2 = test_masterchain_address();
    let r3 = test_big_basechain_address();
    let r4 = test_field_assignment();
    return r1 + r2 + r3 + r4;
}
