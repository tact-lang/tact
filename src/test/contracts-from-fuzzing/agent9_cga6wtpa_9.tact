fun testNewAddressNegativeHash(): Address {
    // Test passing a negative value for the hash parameter. According to spec, the hash should be a valid SHA-256 hash, which is typically non-negative.
    // We check if the compiler rejects a negative hash literal.
    return newAddress(0, -1);
}
