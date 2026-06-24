fun testNewAddressMaster() : Address {
    return newAddress(-1, 0x123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0);
}

fun main() {
    let addr = testNewAddressMaster();
}
