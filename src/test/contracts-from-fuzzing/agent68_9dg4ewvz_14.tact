contract Test {
    receive() {
        // Test 14: Valid Base64 conversion to a Slice then to a String
        let s: Slice = "SGVsbG8gV29ybGQh".fromBase64();
        let str: String = s.asString();
        if (str != "Hello World!") { throw(101); }
    }
}
