fun testEquality() : Bool {
    let addr1: Address = newAddress(0, 0x123);
    let addr2: Address = newAddress(0, 0x123);
    let addr3: Address = newAddress(-1, 0x123);
    return (addr1 == addr2) && !(addr1 == addr3);
}
