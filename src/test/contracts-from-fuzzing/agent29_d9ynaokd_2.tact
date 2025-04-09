contract TestBasechainAddress {
    // Test that newBasechainAddress returns a basechain address with the given hash
    fun testNew(hash: Int) : Bool {
        let ba = newBasechainAddress(hash);
        return ba.hash == hash;
    }

    // Test that emptyBasechainAddress returns a basechain address with a null hash
    fun testEmpty() : Bool {
        let ba = emptyBasechainAddress();
        return ba.hash == null;
    }

    // Minimal receive function
    receive() {}
}
