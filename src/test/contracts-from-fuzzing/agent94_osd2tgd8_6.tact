contract TestEmptyString {
    // This contract tests the usage of an empty string literal in Tact.
    receive() {
        let s: String = "";
        s;
    }
}
