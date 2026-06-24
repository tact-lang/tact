// Snippet 2: Test invalid newAddress() with invalid chain id (expect compile-time error)

fun invalidNewAddress() {
    // Using an invalid chain id (1 instead of 0 or -1)
    let a: Address = newAddress(1, 0x0);
    dump(a);
}

fun main() {
    invalidNewAddress();
}
