fun validNewAddress() {
    // Using valid workchain id (0 for basechain) and a sample hash
    let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    dump(addr);
}

// Entry point to trigger the test
fun main() {
    validNewAddress();
}
