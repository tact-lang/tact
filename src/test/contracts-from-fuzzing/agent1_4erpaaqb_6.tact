fun testRoundtrip(a: Address): Bool {
    let s = a.asSlice();
    let a2 = s.loadAddress();
    return a == a2;
}

fun main() {
    let a: Address = newAddress(0, 0x123456789abcdef123456789abcdef123456789abcdef123456789abcdef);
    testRoundtrip(a);
}
