fun roundTripAddressFixed(): Bool {
    let a: Address = myAddress();
    return a == a.asSlice().asAddressUnsafe();
}

fun testBasechainAddressDynamic(hash: Int): Int? {
    let addr: BasechainAddress = newBasechainAddress(hash);
    return addr.hash;
}

fun testDynamicChainID2(invalid: Int): Address {
    return newAddress(invalid, 0xfaceb00c);
}
