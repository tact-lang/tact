contract SomeContract {
    init() {}
}

// Test 1: Valid newAddress - using valid chain (0) and a valid hash literal
fun test_valid_newAddress(): Address {
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}
