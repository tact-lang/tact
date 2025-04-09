fun invalidNewAddress() {
    // This should produce a compile error because chain=1 is invalid.
    let a: Address = newAddress(1, 0xdeadbeef);
}
