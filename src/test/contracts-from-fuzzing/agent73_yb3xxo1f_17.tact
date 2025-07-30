contract Test {
    receive() {
        // Test round-trip conversion: String -> Slice -> String
        let s: String = "roundtrip test with special chars \n \t and emoji \u{1F44D}!";
        let s2: String = s.asSlice().asString();
        if (s != s2) {
            throw(10);
        }

        // Test empty string conversion
        let empty: String = "";
        let empty2: String = empty.asSlice().asString();
        if (empty != empty2) {
            throw(11);
        }

        // Test String.hashData consistency
        let hash1: Int = s.hashData();
        let hash2: Int = s2.hashData();
        if (hash1 != hash2) {
            throw(12);
        }
    }
}
