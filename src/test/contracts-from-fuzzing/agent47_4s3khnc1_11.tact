contract TestEmptyHash() {
    // Test compile-time evaluation of crc32 and sha256 with empty string
    // Typically, crc32("") is defined as 0, and sha256("") is defined as specific hash value.
    // Here, we just output them for manual inspection.
    const EMPTY_CRC: Int = crc32("");
    const EMPTY_SHA: Int = sha256("");

    receive() {
        dump(self.EMPTY_CRC); // expected: 0 (if crc32 of empty string is defined as 0)
        dump(self.EMPTY_SHA); // expected: sha256 hash of empty string as Int
        cashback(sender());
    }
}
