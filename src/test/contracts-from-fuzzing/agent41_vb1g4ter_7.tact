fun testAddressEquality(a: Address, b: Address) : Bool {
    return a == b;
}

fun main() {
    let res = testAddressEquality(myAddress(), myAddress());
}
