fun testNewAddress(): Address {
    let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    return addr;
}

// Entry point to run the tests if needed
fun main() {
    testNewAddress();
    return;
}
