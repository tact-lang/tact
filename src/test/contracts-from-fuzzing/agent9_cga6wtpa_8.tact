fun testDynamicAddress(c: Int): Address {
    // The compiler expects the chain parameter to be a compile-time constant of either 0 or -1
    // If any other value is provided, it should cause a compile-time error. However, here we branch at runtime.
    if (c == 0) {
        return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    } else if (c == -1) {
        return newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    } else {
        // Fallback: always return a valid address by using chain 0, ignoring provided c
        return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    }
}
