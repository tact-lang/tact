contract Test {
    receive() {
        // Test 12: Roundtrip conversion test using asSlice and asString
        let orig: String = "Roundtrip test \n emoji \u{1F602}";
        let converted: String = orig.asSlice().asString();
        // If the conversion fails, throw exit code 101
        if (orig != converted) { throw(101); }
    }
}
