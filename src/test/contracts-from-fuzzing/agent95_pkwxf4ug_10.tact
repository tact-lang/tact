contract TestHashData {
    receive() {
        // Test hashData: for strings longer than 127 bytes, only the first 127 bytes are hashed
        // The following string is 130 characters long (all 'A'), which is >127 bytes.
        let s: String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        dump(s.hashData());
    }
}
