fun testOptionalMap(): Bool {
    let optAddr: Address? = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    if (optAddr != null) {
        let m: map<Address, Int> = emptyMap();
        m.set(optAddr!!, 42);
        let v: Int? = m.get(optAddr!!);
        return v != null && v!! == 42;
    } else {
        return false;
    }
}

// Additional test: Using dynamic computations to generate a hash for an address and then update it conditionally
fun testDynamicAddressUpdate(flag: Bool): Bool {
    let baseHash: Int = 0x1000 + (flag ? 0x10 : 0x20);
    let addr1: Address = newAddress(0, baseHash);
    let addr2: Address = newAddress(0, baseHash + 1);
    // Using a conditional operator to choose an address
    let selected: Address = flag ? addr1 : addr2;
    // Test that the selected address is as expected
    return flag ? (selected == addr1) : (selected == addr2);
}
