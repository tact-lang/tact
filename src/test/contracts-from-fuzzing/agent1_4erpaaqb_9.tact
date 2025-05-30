fun testBasechain() {
   let emptyAddr: BasechainAddress = emptyBasechainAddress();
   require(emptyAddr.hash == null, "emptyBasechainAddress hash should be null");
   let nonEmptyAddr: BasechainAddress = newBasechainAddress(0x123456789abcdef);
   require(nonEmptyAddr.hash != null, "newBasechainAddress should have a hash value");
}

fun main() {
    testBasechain();
}
