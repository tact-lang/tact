fun test_invalidNewAddress() {
    // Using invalid workchain (1). Expected to cause a compile-time error
    let addr: Address = newAddress(1, 0x123456789abcdef);
}
