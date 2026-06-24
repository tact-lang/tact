fun main() {
    // Test: Using newAddress with an invalid constant chain id (100) should trigger compile-time error
    let addr = newAddress(100, 0x123456789abcdef);
    // No return statement since function is void
}
