contract Test {
    receive() {
        // Test: Base64 round-trip conversion using fromBase64 and asString
        // The Base64 string decodes into a slice which should represent a valid UTF-8 string.
        let base64: String = "SGVyZSdzIEpvaG5ueSE="; // Expected to decode to "Here's Johny!"
        let decoded: Slice = base64.fromBase64();
        let str: String = decoded.asString();
        dump(str);
    }

    fun dump(s: String) {
        // no-op dump function
    }
}
