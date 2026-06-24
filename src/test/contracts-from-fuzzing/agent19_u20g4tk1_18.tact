contract TestHexEscapeValid {
    receive() {
        // Test a valid hex escape sequence: \x22 should produce a double quote character
        // The resulting string should be "Quote: " followed by a double quote
        let s: String = "Quote: \x22";
        let s2: String = s.asSlice().asString();
        if (!(s == s2)) {
            require(false, "Hex escape conversion mismatch");
        }
    }
}
