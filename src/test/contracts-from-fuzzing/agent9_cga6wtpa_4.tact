fun testNewAddressInvalidHashType(): Address {
    // This should cause a compile-time error because the second parameter is not a valid hash literal.
    return newAddress(0, 42);
}
