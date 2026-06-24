contract TestBasechainAddressBoundary {
    // Test newBasechainAddress with a negative hash
    fun testNegative() : Bool {
        let ba = newBasechainAddress(-1);
        return ba.hash == -1;
    }
    
    receive() {}
}
