fun testAddressAsSliceEquality() : Bool {
    let a: Address = newAddress(0, 0xabcdef);
    let cell = beginCell().storeAddress(a);
    let s1 = cell.asSlice();
    let s2 = a.asSlice();
    return s1 == s2;
}

fun testStoreBasechainAddress() {
    let baseAddr: BasechainAddress = newBasechainAddress(0x456);
    let b: Builder = beginCell();
    let b2: Builder = b.storeBasechainAddress(baseAddr);
    dump(b2.asSlice());
}

fun recStore(b: Builder, n: Int) : Int {
    if (n == 0) {
        return 0;
    } else {
        let a: Address = newAddress(0, 0x123);
        let bNew = b.storeAddress(a);
        return recStore(bNew, n - 1) + 1;
    }
}

fun testStoreAddressOverflow() {
    try {
        let count = recStore(beginCell(), 1000);
        dump(count);
    } catch (exitCode) {
        dump(exitCode);
    }
}
