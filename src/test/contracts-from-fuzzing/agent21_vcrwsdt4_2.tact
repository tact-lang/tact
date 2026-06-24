contract AddressInternalTests {
    init() {}

    // Test that converting an address to slice via asSlice is consistent
    get fun testAsSliceConsistency(): Bool {
        let a: Address = newAddress(0, 0x123456789abcdef);
        let sl1: Slice = a.asSlice();
        let sl2: Slice = beginCell().storeAddress(a).asSlice();
        return sl1 == sl2;
    }

    // Test that toString on an address returns a non-empty string
    get fun testToString(): Bool {
        let a: Address = newAddress(0, 0x9876543210abcdef);
        let t: String = a.toString();
        return t != "";
    }
}

fun testEmptyBasechain(): Bool {
    let e: BasechainAddress = emptyBasechainAddress();
    return (e.hash == null);
}

fun testNewBasechain(): Bool {
    let b: BasechainAddress = newBasechainAddress(0xaaa);
    return (b.hash == 0xaaa);
}

// Test hasSameBasechainAddress extension function using a StateInit structure
fun testHasSameBasechain(): Bool {
    let initVal: StateInit = initOf AddressInternalTests();
    let addr: Address = contractAddress(initVal);
    // should be true since contractAddress computes a basechain address
    return initVal.hasSameBasechainAddress(addr);
}
