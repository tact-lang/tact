contract TestEmptyString {
    receive() {
        // Test assignment of an empty string literal, expected to compile
        let s: String = "";
    }
}
