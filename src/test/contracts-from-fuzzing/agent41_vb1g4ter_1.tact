fun testNewAddressValid() : Address {
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

// A dummy function to trigger compilation if required
fun main() {
    let addr = testNewAddressValid();
}