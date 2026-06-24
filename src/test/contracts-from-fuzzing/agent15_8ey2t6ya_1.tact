fun test_valid_newAddress(): Address {
    // Valid: workchain id 0
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

// A dummy main entry to trigger compilation
fun main() {
    let a = test_valid_newAddress();
}
