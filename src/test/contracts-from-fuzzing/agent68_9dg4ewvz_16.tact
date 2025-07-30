contract Test {
    receive() {
        // Test 16: Verify all common escape sequences round-trip
        let s: String = "Escape test: \\ \" \n \r \t \v \b \f \x22";
        let s2: String = s.asSlice().asString();
        if (s != s2) { throw(101); }
    }
}
