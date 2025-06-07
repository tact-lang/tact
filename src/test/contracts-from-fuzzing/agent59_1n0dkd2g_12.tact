contract TestHashData {
    receive() {
        // Testing the extension function hashData on strings.
        // The hashData function should calculate the SHA-256 hash of the data bits from the string.
        let s: String = "Test string for hash";
        let h: Int = s.hashData();
    }
}
