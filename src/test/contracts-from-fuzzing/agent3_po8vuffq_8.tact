fun testBasechainAddressFixed() {
    let emptyAddr: BasechainAddress = emptyBasechainAddress();
    // Confirm that the empty basechain address has a null hash.
    let condition: Bool = emptyAddr.hash == null;
    let result: String = condition ? "Empty" : "Non-empty";
    result;
}

fun testAddressStringNonEmpty() {
    let a: Address = myAddress();
    let s: String = a.toString();
    s;
}
