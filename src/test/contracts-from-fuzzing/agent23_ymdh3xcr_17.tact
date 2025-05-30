contract TestHashData {
    receive() {
        // Testing hashData on a string with valid bit length (each character is 8-bit)
        // Expected: Computing the SHA-256 hash (only of first 127 bytes if long, but our string is short)
        dump("Never gonna give you up!".hashData());
    }
}
