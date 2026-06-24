fun testInvalidAddress(): Address {
    // Chain 1 is not allowed according to documentation (only -1 and 0 are valid)
    return newAddress(1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

// Entry point
fun main() {
    testInvalidAddress();
    return;
}
