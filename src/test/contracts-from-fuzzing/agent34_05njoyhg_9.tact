fun main() : Int {
    // Test for BasechainAddress: emptyBasechainAddress returns a BasechainAddress with null hash
    let empty: BasechainAddress = emptyBasechainAddress();
    if (!(empty.hash == null)) {
         return 100;
    }
    
    // Test for non-empty BasechainAddress
    let nonEmpty: BasechainAddress = newBasechainAddress(0x123456);
    if (nonEmpty.hash == null) {
         return 200;
    }

    return 1;
}
