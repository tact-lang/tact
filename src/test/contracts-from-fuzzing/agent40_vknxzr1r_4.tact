fun testAddressAsSlice(): Bool {
    let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    let sliceDirect: Slice = addr.asSlice();
    let sliceIndirect: Slice = beginCell().storeAddress(addr).asSlice();
    return sliceDirect == sliceIndirect;
}

fun main() {
    testAddressAsSlice();
    return;
}
