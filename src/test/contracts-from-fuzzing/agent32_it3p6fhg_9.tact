fun misSerializeAddress(): Address {
    // Intentionally mis-serializing: storing an integer instead of an address.
    let cell = beginCell().storeUint(42, 7).endCell();
    let slice = cell.beginParse();
    return slice.loadAddress();
}
