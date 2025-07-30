contract TestEmptyBasechainAddress {
    fun test() : Bool {
        let emptyAddr: BasechainAddress = emptyBasechainAddress();
        // Check that the empty basechain address has no hash (i.e., null)
        return emptyAddr.hash == null;
    }
}
