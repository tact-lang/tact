fun testMultipleAddressStorage(): Bool {
    let a1: Address = newAddress(0, 0x1234);
    let a2: Address = newAddress(-1, 0x1234);
    let cell: Cell = beginCell().storeAddress(a1).storeAddress(a2).endCell();
    let s: Slice = cell.asSlice();
    let a1r: Address = s.loadAddress();
    let a2r: Address = s.loadAddress();
    return (a1 == a1r) && (a2 == a2r);
}

fun testZeroHashAddress(): Bool {
    let a: Address = newAddress(0, 0x0);
    return a.toString() != "";
}
