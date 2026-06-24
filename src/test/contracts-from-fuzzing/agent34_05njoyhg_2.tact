fun main() : Int {
    // Test A: Using an invalid chain id with newAddress (only 0 or -1 is allowed by documentation, constant error expected)
    // This should trigger a compile-time error.
    let _ : Address = newAddress(1, 0x123456789ABCDEF123456789ABCDEF123456789ABCDEF123456789ABCDEF1234);
    return 1;
}
