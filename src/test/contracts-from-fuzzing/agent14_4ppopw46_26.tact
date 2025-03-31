contract TestNullChar {
    receive() {
        // Test a string containing an embedded null character (\x00)
        let s: String = "Hello\x00World";
        let s2: String = s.asSlice().asString();
        dump(s2);
    }
}
