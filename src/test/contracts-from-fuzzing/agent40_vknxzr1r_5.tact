fun testEmptyBasechain(): Bool {
    let emptyAddr: BasechainAddress = emptyBasechainAddress();
    return (emptyAddr.hash == null);
}

fun main() {
    testEmptyBasechain();
    return;
}
