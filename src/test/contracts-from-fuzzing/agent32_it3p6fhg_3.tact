fun testStoreLoad(addr: Address): Address {
    let cell = beginCell().storeAddress(addr).endCell();
    let slice = cell.beginParse();
    return slice.loadAddress();
}
