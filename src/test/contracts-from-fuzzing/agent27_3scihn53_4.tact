// Test D: Verify emptyBasechainAddress yields a null hash
fun testEmptyBasechain() : Bool {
    let b: BasechainAddress = emptyBasechainAddress();
    return b.hash == null;
}
